require 'spec_helper'

describe 'minimum2scp/baseimage' do
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
  end
end
