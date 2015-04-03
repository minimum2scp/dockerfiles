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

