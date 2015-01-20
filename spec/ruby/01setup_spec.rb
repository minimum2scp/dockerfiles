require 'spec_helper'

%w[
  ruby ruby-dev bundler rake pry
  build-essential autoconf bison ca-certificates libgdbm-dev libncursesw5-dev libncurses5-dev libreadline6-dev tcl-dev tk-dev zlib1g-dev libssl-dev libffi-dev libyaml-dev libgmp-dev
  gem2deb
].each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

