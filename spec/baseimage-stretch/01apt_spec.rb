require 'spec_helper'

describe 'minimum2scp/baseimage-stretch' do
  describe 'apt' do
    before(:all) do
      start_container({
        'Image' => ENV['DOCKER_IMAGE'] || "minimum2scp/#{File.basename(__dir__)}:latest",
        'Env' => [ 'APT_LINE=keep' ]
      })
      container_exec('apt-get update')
    end

    after(:all) do
      stop_container
    end

    describe command('apt list --upgradable') do
      its(:stdout) {
        should_not match /\[upgradable from: /
      }
    end

    packages = JSON.parse(File.read("#{File.basename(__dir__)}/debian-packages.json"))
    packages.each do |package|
      name = package["Package"]
      version = package["Version"]
      describe package(name) do
        it {
          should be_installed.with_version(version)
        }
      end
    end
  end
end
