require 'spec_helper'

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


