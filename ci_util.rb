#! /usr/bin/env ruby

require 'digest/sha2'
require 'find'
require 'pathname'
require 'yaml'
require 'bundler/setup'
require 'thor'
require 'docker'
require 'sequel'
require 'text-table'
require 'pry'

CACHE_DIR = Pathname("#{__dir__}/.circleci/cache/docker")
CACHE_DIR.mkpath if !CACHE_DIR.directory?
DB = Sequel.connect("sqlite://#{CACHE_DIR}/index.db")
DB.create_table?(:image_caches) do
  primary_key :id
  String :image_name
  String :image_source_dir
  String :image_id
  String :dependency
  String :dependency_digest
  Time :created_at
  Time :last_used_at
end

module CiUtil
  class CLI < Thor
    desc "pull IMAGE", "pull IMAGE and save cache, or load IMAGE from cache"
    def pull(image)
      with_cache(image) do
        system("docker pull #{image}")
      end
    end

    desc "build IMAGE", "build IMAGE and save cache,  or load IMAGE from cache"
    def build(image)
      with_cache(image) do
        Dir.chdir(image_source_dir(image).to_s) do
          system("docker build -t #{image} .")
        end
      end
    end

    desc "gc", "gc old caches"
    def gc(expire_seconds=3*24*60*60)
      fields = ::CiUtil::ImageCache.show_fields
      known_files = [ "#{::CACHE_DIR}/index.db" ]
      ::CiUtil::ImageCache.all do |cache|
        tarball = Pathname("#{::CACHE_DIR}/#{cache.tarball}")
        expired_flg = !!(Time.now - cache.last_used_at > expire_seconds.to_i)
        vanished_flg = !tarball.exist?
        if expired_flg || vanished_flg
          puts "DELETE OLD CACHE: " + Hash[fields.values.zip(cache.show)].inspect
          tarball.unlink if tarball.exist?
          cache.delete
        else
          known_files << "#{::CACHE_DIR}/#{cache.tarball}"
        end
      end
      unknown_files = Dir["#{::CACHE_DIR}/**/*"].select{|f| File.file?(f)} - known_files
      unknown_files.each do |f|
        puts "DELETE UNKNOWN FILE IN CACHE_DIR: #{f}"
        File.unlink(f)
      end
    end

    desc "list", "list caches"
    def list
      image_caches = ::CiUtil::ImageCache.all
      fields = ::CiUtil::ImageCache.show_fields
      puts [ fields.values, *image_caches.map{|cache| cache.show} ].to_table(first_row_is_head: true).to_s
      puts ""
      puts "(#{image_caches.size} caches)"
    end

    no_commands do
      def with_cache(image)
        deps = ::CiUtil::ImageDependency.new(image, image_source_dir(image))
        cache = ::CiUtil::ImageCache.where(image_name:image, image_source_dir:image_source_dir(image).to_s, dependency_digest:deps.digest).first
        if cache && Pathname("#{::CACHE_DIR}/#{cache.tarball}").readable?
          puts "loading image cache from #{::CACHE_DIR}/#{cache.tarball}"
          system("docker load < #{::CACHE_DIR}/#{cache.tarball}")
          cache.update(last_used_at: Time.now)
        else
          yield
          cache = ::CiUtil::ImageCache.create(
            image_name: image,
            image_source_dir: image_source_dir(image),
            image_id: image_id(image),
            dependency: YAML.dump(deps.dependency),
            dependency_digest: deps.digest,
            created_at: Time.now,
            last_used_at: Time.now
          )
          puts "saving image cache to #{::CACHE_DIR}/#{cache.tarball}"
          system("docker save #{image} > #{::CACHE_DIR}/#{cache.tarball}")
        end
      end

      def image_source_dir(image_name)
        Pathname(image_name.split('/', 2).last.split(':').first)
      end

      def image_id(image_name)
        ::Docker::Image.all.find{|img| img.info['RepoTags'].include?(image_name) }.id
      end
    end
  end

  class ImageCache < Sequel::Model
    def short_dependency_digest
      self.dependency_digest[0,12]
    end

    def tarball
      "#{self.image_source_dir}-#{self.image_id[0,12]}.tar"
    end

    def show
      self.class.show_fields.keys.map{|f| self.send(f) }
    end

    class << self
      def show_fields
        {
          tarball:                  'cached tarball',
          short_dependency_digest:  'deps digest',
          created_at:               'created at',
          last_used_at:             'last used at'
        }
      end
    end
  end

  class ImageDependency
    attr_accessor :image_name, :image_source_dir

    def initialize(image_name, image_source_dir)
      @image_name = image_name
      @image_source_dir = image_source_dir
    end

    def dependency
      if !@dependency
        @dependency = { :image_name => @image_name }
        dockerfile = @image_source_dir + 'Dockerfile'

        if dockerfile.exist?
          @dependency[:dockerfile_checksum] = Digest::SHA256.hexdigest(dockerfile.read)
          from = dockerfile.read.scan(/^FROM (.+)$/).first.first
          parent_image = ::Docker::Image.all.find{|img| img.info['RepoTags'].include?(from) }
          @dependency[:parent] = { :name => from, :id => parent_image.id }
        end

        files = []
        Dir.chdir(@image_source_dir.to_s) do
          Dir.glob('**/*', File::FNM_DOTMATCH).each do |f|
            next if File.directory?(f)
            next if %w[.gitignore Rakefile README.md README.md.erb].include?(f)
            files << { :name => f, :checksum => Digest::SHA256.hexdigest(File.read(f)) }
          end
        end
        @dependency[:files] = files.sort_by{|file_hash| file_hash[:name]}
      end
      @dependency
    end

    def digest
      @digest ||= Digest::SHA256.hexdigest(YAML.dump(self.dependency))
    end
  end
end

CiUtil::CLI.start(ARGV)
