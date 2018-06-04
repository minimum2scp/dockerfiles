require 'bundler/setup'
require 'rake'
require 'rspec/core/rake_task'

task :default => "minimum2scp:all"

namespace :minimum2scp do
  desc 'create all images'
  task :all => [:debian]

  desc 'build minimum2scp/debian image'
  task :debian do
    tag = ->(env, default){
      env ? (!env.empty? ? "TAG=#{env}" : "") : "TAG=#{default}"
    }[ENV['TAG_DEBIAN'], 'minimum2scp/debian:latest']
    env = ENV.select{|k,v| %w[http_proxy].include?(k)}.map{|k,v| "#{k}=#{v}"}.join(" ")
    sh "cd debian && rake clobber mkimage README.md #{tag} #{env}"
  end

  desc 'build minimum2scp/debian-stretch image'
  task :debian_stretch do
    tag = ->(env, default){
      env ? (!env.empty? ? "TAG=#{env}" : "") : "TAG=#{default}"
    }[ENV['TAG_DEBIAN'], 'minimum2scp/debian-stretch:latest']
    env = ENV.select{|k,v| %w[http_proxy].include?(k)}.map{|k,v| "#{k}=#{v}"}.join(" ")
    sh "cd debian-stretch && rake clobber mkimage README.md #{tag} #{env}"
  end

  desc 'build minimum2scp/debian-jessie image'
  task :debian_jessie do
    tag = ->(env, default){
      env ? (!env.empty? ? "TAG=#{env}" : "") : "TAG=#{default}"
    }[ENV['TAG_DEBIAN_JESSIE'], 'minimum2scp/debian-jessie:latest']
    env = ENV.select{|k,v| %w[http_proxy].include?(k)}.map{|k,v| "#{k}=#{v}"}.join(" ")
    sh "cd debian-jessie && rake clobber mkimage README.md #{tag} #{env}"
  end

  desc "create deps.svg from deps.dot (visualize dependencies)"
  file "deps.svg" => "deps.dot" do
    sh "dot -T svg -o deps.svg deps.dot"
  end

  desc "trigger dockerhub automated build"
  task :trigger, [:image] do |t,args|
    trigger_token = ENV["#{args['image'].gsub('-','_')}_TRIGGER_TOKEN"]
    sh "curl -i -d build=true -X POST https://registry.hub.docker.com/u/minimum2scp/#{args['image']}/trigger/#{trigger_token}/"
  end
end

namespace :spec do
  targets = []
  Dir.glob('./spec/*').each do |dir|
    next unless File.directory?(dir)
    targets << File.basename(dir)
  end

  task :all     => targets
  task :default => :all

  targets.each do |target|
    desc "Run serverspec tests to #{target}"
    RSpec::Core::RakeTask.new(target.to_sym) do |t|
      t.pattern = "spec/#{target}/*_spec.rb"
    end
  end
end

