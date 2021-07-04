require 'spec_helper'

describe 'minimum2scp/debian-bullseye' do
  describe 'apt' do
    before(:all) do
      set :backend, :docker
      set :docker_image, ENV['DOCKER_IMAGE'] || "minimum2scp/#{File.basename(__dir__)}:latest"
    end

    after(:all) do
      set :backend, :ssh
      set :docker_image, nil
    end

    describe command('apt list --upgradable') do
      let(:pre_command){ 'apt-get update -qq' }
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
