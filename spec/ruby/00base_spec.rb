require 'spec_helper'

describe 'minimum2scp/ruby' do
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

  %w[
    ruby ruby-dev bundler rake pry
    build-essential autoconf bison ca-certificates libgdbm-dev libncursesw5-dev libncurses5-dev libreadline6-dev tcl-dev tk-dev zlib1g-dev libssl-dev libffi-dev libyaml-dev libgmp-dev
    gem2deb
  ].each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end

  describe file('/usr/bin/ruby') do
    it { should be_symlink }
    it { should be_linked_to('ruby2.1') }
  end

  describe command('ruby2.1 -v') do
    its(:stdout) { should include 'ruby 2.1.5p273 (2014-11-13) [x86_64-linux-gnu]' }
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

  describe package('bundler') do
    it { should be_installed.with_version('1.10.3-1') }
  end
end
