require 'spec_helper'

describe 'minimum2scp/systemd-bullseye' do
  context 'without env' do
    before(:all) do
      start_container({
        'Image' => ENV['DOCKER_IMAGE'] || "minimum2scp/#{File.basename(__dir__)}:latest",
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
