require 'spec_helper'
set :docker_image, ENV['DOCKER_IMAGE'] || "minimum2scp/#{File.basename(__dir__)}:latest"
set :docker_envs, [ 'APT_LINE=keep' ]

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
  it { should be_directory }
end

describe file('/opt/rbenv/default-gems') do
  it { should be_file }
  its(:content){ should include 'bundler' }
  its(:content){ should include 'pry' }
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


