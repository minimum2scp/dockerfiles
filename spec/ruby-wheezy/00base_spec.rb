require 'spec_helper'

describe 'minimum2scp/ruby-wheezy' do
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


    #Dir["#{__dir__}/../baseimage-wheezy/*_spec.rb"].sort.each do |spec|
    #  load spec
    #end

    %w[
  ruby ruby-dev rake
  build-essential autoconf bison ca-certificates libgdbm-dev libncursesw5-dev libncurses5-dev libreadline6-dev tcl-dev tk-dev zlib1g-dev libssl-dev libffi-dev libyaml-dev libgmp-dev
    ].each do |pkg|
      describe package(pkg) do
        it { should be_installed }
      end
    end

    %w[
  bundler pry
  gem2deb
    ].each do |pkg|
      describe package(pkg) do
        it { should_not be_installed }
      end
    end

    %w[
  bundler pry
    ].each do |pkg|
      describe package(pkg) do
        it { should be_installed.by('gem') }
      end
    end

    describe file('/usr/bin/ruby') do
      it { should be_symlink }
      it { should be_linked_to('/etc/alternatives/ruby') }
    end

    describe file('/etc/alternatives/ruby') do
      it { should be_symlink }
      it { should be_linked_to('/usr/bin/ruby1.9.1') }
    end

    describe command('ruby -v') do
      its(:stdout) { should include 'ruby 1.9.3p194 (2012-04-20 revision 35410) [x86_64-linux]' }
    end

    describe file('/opt/rbenv') do
      it { should be_directory }
    end

    describe file('/etc/profile.d/rbenv.sh') do
      it { should be_file }
      its(:content) { should match %r!^export RBENV_ROOT=/opt/rbenv$! }
    end

    describe file('/opt/rbenv/bin') do
      it { should be_directory }
    end

    describe file('/opt/rbenv/versions') do
      it { should be_directory }
    end

    describe file('/opt/rbenv/shims') do
      it { should be_directory }
    end

    describe file('/opt/rbenv/plugins/ruby-build') do
      it { should be_directory }
    end

    describe file('/opt/rbenv/plugins/rbenv-default-gems') do
      it { should_not be_directory }
    end

    describe file('/opt/rbenv/plugins/rbenv-gem-rehash') do
      it { should_not be_directory }
    end

    describe file('/opt/rbenv/plugins/rbenv-aliases') do
      it { should_not be_directory }
    end

    describe file('/opt/rbenv/plugins/rbenv-update') do
      it { should be_directory }
    end
  end
end
