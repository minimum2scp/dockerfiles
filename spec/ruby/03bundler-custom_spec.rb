require 'spec_helper'

describe file('/etc/apt/sources.list.d/minimum2scp.list') do
  it { should be_file }
  its(:content) { should include 'deb     http://minimum2scp.org/repos/apt/debian sid main contrib non-free' }
end

describe package('bundler') do
  it { should be_installed.with_version('1.8.5-0custom1') }
end

