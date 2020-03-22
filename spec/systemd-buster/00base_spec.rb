require 'spec_helper'

describe 'minimum2scp/systemd-buster' do
  context 'with env [APT_LINE=keep]' do
    before(:all) do
      start_container({
        'Image' => ENV['DOCKER_IMAGE'] || "minimum2scp/#{File.basename(__dir__)}:latest",
        'Env' => [ 'APT_LINE=keep' ],
        'HostConfig' => { 'Privileged' => true },
      })
    end

    after(:all) do
      stop_container
    end

    %w[
      systemd systemd-sysv dbus libpam-systemd less
    ].each do |pkg|
      describe package(pkg) do
        it { should be_installed }
      end
    end
  end
end
