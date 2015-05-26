require 'spec_helper'

describe file('/opt/init-wrapper') do
  it { should be_directory }
end

describe file('/opt/init-wrapper/sbin') do
  it { should be_directory }
end

describe file('/opt/init-wrapper/sbin/entrypoint.sh') do
  it { should be_executable }
end

describe file('/opt/init-wrapper/post-init.d') do
  it { should be_directory }
end

describe file('/opt/init-wrapper/pre-init.d') do
  it { should be_directory }
end

describe file('/opt/init-wrapper/pre-init.d/01-git-config') do
  it { should be_executable }
end

describe file('/opt/init-wrapper/pre-init.d/02-reset-sshd-keys') do
  it { should be_executable }
end

describe file('/opt/init-wrapper/pre-init.d/03-adduser') do
  it { should be_executable }
end

describe file('/opt/init-wrapper/pre-init.d/04-chpass-and-sshkey') do
  it { should be_executable }
end

describe file('/opt/init-wrapper/pre-init.d/05-apt') do
  it { should be_executable }
end

describe file('/opt/init-wrapper/pre-init.d/06-remove-unnecessary-files') do
  it { should be_executable }
end

describe file('/opt/init-wrapper/pre-init.d/07-google-fluentd') do
  it { should be_executable }
end

describe file('/opt/init-wrapper/pre-init.d/10-save-env') do
  it { should be_executable }
end

