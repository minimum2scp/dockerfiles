require 'serverspec'
require 'docker'

## workaround for Circle CI
## docker rm (removing btrfs snapshot) fails on Circle CI
if ENV['CIRCLECI']
  class Docker::Container
    def remove
      # do not delete container
    end
    alias_method :delete, :remove
  end
end

## start container before run spec
raise "environment variable DOCKER_IMAGE required" unless ENV['DOCKER_IMAGE']
container = ::Docker::Container.create('Image' => ENV['DOCKER_IMAGE'])
container.start

## stop and delete container after spec
at_exit {
  container.delete(force: true)
}

## configure ssh
set :backend, :ssh
set :host, container.json['NetworkSettings']['IPAddress']
set :ssh_options, {
  :user     => 'debian',
  :password => 'debian',
  :user_known_hosts_file => '/dev/null',
}

## skip OS detection
## see specinfra-2.12.3/lib/specinfra/helper/os.rb
##     specinfra-2.12.3/lib/specinfra/helper/detect_os/debian.rb
set :os, :family => 'debian', :arch => 'x86_64', :release => '8.0'

## wait for sshd in container start
sleep 3

