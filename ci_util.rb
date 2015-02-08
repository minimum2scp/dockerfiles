#! /usr/bin/env ruby

require 'digest/sha2'
require 'find'
require 'optparse'
require 'pathname'
require 'yaml'
require 'bundler/setup'
require 'docker'
#require 'pry'

opts = {
  :cache_dir => Pathname('~/.cache/docker').expand_path
}
ARGV.options do |q|
  q.on('-c', '--cache-dir=DIR'){ |arg| opts[:cache_dir] = arg }
  q.parse!
end

action = ARGV.shift
image = ARGV.shift

image_source_dir = Pathname('.') + image.split('/', 2).last.split(':').first
cache_dir = Pathname(opts[:cache_dir])
cache_tarball = cache_dir + "#{image_source_dir.basename}.tar"
deps_file = cache_dir + "#{image_source_dir.basename}.deps"

def calc_deps(image_source_dir)
  deps = {}

  dockerfile=image_source_dir + 'Dockerfile'
  if dockerfile.exist?
    deps[:dockerfile_checksum] = Digest::SHA256.hexdigest(dockerfile.read)
    from = dockerfile.read.scan(/^FROM (.+)$/).first.first
    parent_image = ::Docker::Image.all.find{|img| img.info['RepoTags'].include?(from)}
    deps[:parent] = {
      :name => from,
      :id => parent_image.id
    }
  end

  files = []
  Dir.chdir(image_source_dir.to_s) do
    Find.find('.') do |f|
      next if File.directory?(f)
      files << { :name => f.sub(%r!^\./!, ''), :checksum => Digest::SHA256.hexdigest(File.read(f)) }
    end
  end
  deps[:files] = files.sort_by{|file_hash| file_hash[:name]}

  deps
end

def cache_available?(image, cache_tarball, deps_file, image_source_dir)
  if !cache_tarball.readable?
    return false
  end

  cached_deps = YAML.load(deps_file.read)
  current_deps = calc_deps(image_source_dir)
  cached_deps == current_deps
end

def save_cache(image, cache_tarball, deps_file, image_source_dir)
  system("docker save #{image} > #{cache_tarball}")
  deps = calc_deps(image_source_dir)
  deps_file.open('w') do |fh|
    fh << YAML.dump(deps)
  end
end

if !cache_dir.directory?
  cache_dir.mkdir
end

case action
when 'pull'
  if cache_available?(image, cache_tarball, deps_file, image_source_dir)
    puts "loading image from #{cache_tarball}"
    system("docker load -i #{cache_tarball}")
  else
    puts "cache is not available, starting pull ..."
    system("docker pull #{image}")
    puts "save cache..."
    save_cache(image, cache_tarball, deps_file, image_source_dir)
  end
when 'build'
  if cache_available?(image, cache_tarball, deps_file, image_source_dir)
    puts "loading image from #{cache_tarball}"
    system("docker load -i #{cache_tarball}")
  else
    puts "cache is not available, starting build ..."
    Dir.chdir(image_source_dir.to_s) do
      system("docker build -t #{image} .")
    end
    puts "save cache..."
    save_cache(image, cache_tarball, deps_file, image_source_dir)
  end
end
