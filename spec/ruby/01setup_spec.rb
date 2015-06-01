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

describe file('/usr/bin/ruby') do
  it { should be_symlink }
  it { should be_linked_to('ruby2.1') }
end

describe command('ruby2.1 -v') do
  its(:stdout) { should include 'ruby 2.1.5p273 (2014-11-13) [x86_64-linux-gnu]' }
end
