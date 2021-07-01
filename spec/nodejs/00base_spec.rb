require 'spec_helper'

describe 'minimum2scp/nodejs' do
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
      build-essential
    ].each do |pkg|
      describe package(pkg) do
        it { should be_installed }
      end
    end

    describe file('/opt/nodenv') do
      it { should be_directory }
    end

    describe file('/etc/profile.d/nodenv.sh') do
      it { should be_file }
      its(:content) { should match %r!^export NODENV_ROOT=/opt/nodenv$! }
    end

    describe file('/opt/nodenv/bin') do
      it { should be_directory }
    end

    describe file('/opt/nodenv/versions') do
      it { should be_directory }
    end

    describe file('/opt/nodenv/shims') do
      it { should be_directory }
    end

    describe file('/opt/nodenv/plugins/node-build') do
      it { should be_directory }
    end

    describe file('/opt/nodenv/plugins/nodenv-update') do
      it { should be_directory }
    end

    describe file('/etc/apt/sources.list.d/yarn.list') do
      it { should be_file }
    end

    describe command('nodenv version-name') do
      let(:login_shell){ true }
      its(:stdout){ should eq "16.4.1\n" }
    end

    [
      {
        nodejs: '16.4.1',
      },
    ].each do |v|
      describe command('nodenv versions --bare --skip-aliases') do
        let(:login_shell){ true }
        its(:stdout) { should match /^#{Regexp.quote(v[:nodejs])}$/ }
      end

      describe command("NODENV_VERSION=#{v[:nodejs]} node -v") do
        let(:login_shell){ true }
        its(:stdout) { should eq "v#{v[:nodejs]}\n" }
      end
    end

    describe command('nodenv alias') do
      let(:login_shell){ true }
      its(:stdout){
        should eq <<~ALIASES
          16 => 16.4.1
          16.4 => 16.4.1
        ALIASES
      }
    end

    {
      '16' => '16.4.1',
      '16.4' => '16.4.1',
    }.each do |src, dest|
      describe file("/opt/nodenv/versions/#{src}") do
        it { should be_symlink }
        it { should be_linked_to dest }
      end
    end

    describe package('yarn') do
      it { should be_installed.by('apt') }
    end

    describe command('yarn -V') do
      let(:login_shell){ true }
      its(:exit_status) { should eq 0 }
    end
  end
end
