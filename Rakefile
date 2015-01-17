require 'bundler/setup'
require 'rake'
require 'rspec/core/rake_task'

task :default => "minimum2scp:all"

namespace :minimum2scp do
  desc 'create all images'
  task :all => [:debian, :pb]

  desc 'build minimum2scp/debian image'
  task :debian do
    tag = ->(env, default){
      env ? (!env.empty? ? "TAG=#{env}" : "") : "TAG=#{default}"
    }[ENV['TAG_DEBIAN'], 'minimum2scp/debian:latest']
    env = ENV.select{|k,v| %w[http_proxy].include?(k)}.map{|k,v| "#{k}=#{v}"}.join(" ")
    sh "cd debian && rake clobber mkimage README.md #{tag} #{env}"
  end

  desc 'build minimum2scp/pb image'
  task :pb do
    tag = ->(env, default){
      env ? (!env.empty? ? "TAG=#{env}" : "") : "TAG=#{default}"
    }[ENV['TAG_PB'], 'minimum2scp/pb:latest']
    env = ENV.select{|k,v| %w[http_proxy].include?(k)}.map{|k,v| "#{k}=#{v}"}.join(" ")
    sh "cd pb && rake clean docker-build #{tag} #{env}"
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
      #ENV['TARGET_HOST'] = target
      ENV['DOCKER_IMAGE'] = "minimum2scp/#{target}:latest"
      t.pattern = "spec/#{target}/*_spec.rb"
    end
  end
end

