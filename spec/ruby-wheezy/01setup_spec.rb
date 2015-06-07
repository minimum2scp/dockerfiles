require 'spec_helper'

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
