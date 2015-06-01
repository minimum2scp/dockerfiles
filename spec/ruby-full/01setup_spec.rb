require 'spec_helper'

%w[ruby2.2 ruby2.2-dev].each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe command('ruby2.2 -v') do
  its(:stdout) { should include 'ruby 2.2.2p95 (2015-04-13) [x86_64-linux-gnu]'}
end

