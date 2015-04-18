require 'spec_helper'
require 'spec_helper'
set :docker_image, ENV['DOCKER_IMAGE'] || "minimum2scp/#{File.basename(__dir__)}:latest"
set :docker_envs, [ 'APT_LINE=keep' ]

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


describe file('/etc/apt/sources.list.d/minimum2scp.list') do
  it { should be_file }
  its(:content) { should include 'deb     http://minimum2scp.org/repos/apt/debian sid main contrib non-free' }
end

describe package('bundler') do
  it { should be_installed.with_version('1.8.5-0custom1') }
end

