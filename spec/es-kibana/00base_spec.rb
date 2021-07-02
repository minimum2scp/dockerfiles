require 'spec_helper'

describe 'minimum2scp/es-kibana' do
  context 'with env [APT_LINE=keep]' do
    before(:all) do
      start_container({
        'Image' => ENV['DOCKER_IMAGE'] || "minimum2scp/#{File.basename(__dir__)}:latest",
        'Env' => [ 'APT_LINE=keep' ]
      })
    end

    after(:all) do
      stop_container
    end

    #Dir["#{__dir__}/../baseimage/*_spec.rb"].sort.each do |spec|
    #  load spec
    #end

    describe file('/tmp/build') do
      it { should_not be_directory }
    end

    %w[
      elasticsearch
      kibana
    ].each do |pkg|
      describe package(pkg) do
        it { should be_installed }
      end
    end

    describe file('/etc/default/elasticsearch') do
      its(:content){ should match /^ES_JAVA_OPTS="-Xms512m -Xmx512m"$/ }
    end

    describe service('elasticsearch') do
      it { should be_running }
      it { should be_enabled }
    end

    describe service('kibana') do
      it { should be_running }
      it { should be_enabled }
    end
  end

  context 'with env [APT_LINE=keep, ES_JAVA_OPTS="-Xms1024m -Xmx1024m"]' do
    before(:all) do
      start_container({
        'Image' => ENV['DOCKER_IMAGE'] || "minimum2scp/#{File.basename(__dir__)}:latest",
        'Env' => [ 'APT_LINE=keep', 'ES_JAVA_OPTS=-Xms1024m -Xmx1024m' ]
      })
    end

    after(:all) do
      stop_container
    end

    describe file('/etc/default/elasticsearch') do
      its(:content){ should match /^ES_JAVA_OPTS="-Xms1024m -Xmx1024m"$/ }
    end

    describe service('elasticsearch') do
      it { should be_running }
      it { should be_enabled }
    end

    describe service('kibana') do
      it { should be_running }
      it { should be_enabled }
    end

    describe file('/etc/profile.d/00docker-env.sh') do
      its(:content){ should match /^#export ES_JAVA_OPTS='-Xms1024m -Xmx1024m'$/ }
    end
  end
end
