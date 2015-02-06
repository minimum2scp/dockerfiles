require 'serverspec'

set :backend, :docker
set :docker_image, ENV['DOCKER_IMAGE']

## skip OS detection
## see specinfra-2.12.3/lib/specinfra/helper/os.rb
##     specinfra-2.12.3/lib/specinfra/helper/detect_os/debian.rb
set :os, :family => 'debian', :arch => 'x86_64', :release => '8.0'

## workaround for Circle CI
## docker rm (removing btrfs snapshot) fails on Circle CI
if ENV['CIRCLECI']
  require 'docker'
  class Docker::Container
    def remove
      # do not delete container
    end
    alias_method :delete, :remove
  end
end

