require 'spec_helper'

describe 'minimum2scp/baseimage-stretch' do
  describe 'apt' do
    before(:all) do
      start_container({
        'Image' => ENV['DOCKER_IMAGE'] || "minimum2scp/#{File.basename(__dir__)}:latest",
        'Env' => [ 'APT_LINE=keep' ]
      })
    end

    after(:all) do
      stop_container
    end

    describe command('apt list --upgradable') do
      let(:pre_command){ 'sudo apt-get update -qq' }
      its(:stdout) {
        should_not match /\[upgradable from: /
      }
      its(:exit_status){ should eq 0 }
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
