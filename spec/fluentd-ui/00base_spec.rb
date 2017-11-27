require 'spec_helper'

describe 'minimum2scp/fluentd-ui' do
  context 'with env [APT_LINE=keep]' do
    before(:all) do
      start_container({
        'Image' => ENV['DOCKER_IMAGE'] || "minimum2scp/#{File.basename(__dir__)}:latest",
        'Env' => [ 'APT_LINE=keep' ]
      })
      ## wait for fluentd-ui startup
      sleep 3
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

    describe package('td-agent') do
      it { should be_installed }
    end

    describe service('td-agent') do
      it { should be_running }
      it { should be_enabled }
    end

    describe user('td-agent') do
      it { should be_exist }
    end

    describe file('/etc/td-agent') do
      it { should be_directory }
      it { should be_grouped_into 'td-agent' }
      it { should be_writable.by('group') }
    end

    describe port('8888') do
      it { should be_listening.on('0.0.0.0').with('tcp') }
    end

    describe port('24224') do
      it { should be_listening.on('0.0.0.0').with('tcp') }
      it { should be_listening.on('0.0.0.0').with('udp') }
    end

    describe port('24230') do
      it { should be_listening.on('127.0.0.1').with('tcp') }
    end

    describe file('/etc/gemrc') do
      it { should be_file }
      its(:content){ should match /^install: --no-document$/ }
      its(:content){ should match /^update: --no-document$/ }
    end

    describe file('/opt/fluentd-ui') do
      it { should be_directory }
      it { should be_owned_by 'td-agent' }
    end

    describe package('supervisor') do
      it { should be_installed }
    end

    describe service('supervisor') do
      it { should be_running }
      it { should be_enabled }
    end

    describe port('9001') do
      it { should be_listening.on('0.0.0.0').with('tcp') }
    end

    describe service('fluentd-ui') do
      it { should be_running.under('supervisor') }
    end

    describe port('9292') do
      it { should be_listening.on('127.0.0.1').with('tcp') }
    end

    describe package('nginx-light') do
      it { should be_installed }
    end

    describe service('nginx') do
      it { should be_running }
      it { should be_enabled }
    end

    describe port('80') do
      it { should be_listening.on('0.0.0.0').with('tcp') }
    end
  end
end
