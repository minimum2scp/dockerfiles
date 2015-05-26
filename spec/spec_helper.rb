require 'serverspec'
require 'docker'
require 'timeout'
require 'socket'

## show debug log
if ENV['DOCKER_API_DEBUG'] =~ /^1|on|true|yes$/i
  require 'logger'
  Docker.logger = Logger.new(STDERR)
  Docker.logger.level = Logger::DEBUG
end

## workaround for Circle CI
## docker rm (removing btrfs snapshot) fails on Circle CI
if ENV['CIRCLECI']
  class Docker::Container
    def remove(options={})
      # do not delete container
    end
    alias_method :delete, :remove
  end
end

## start container before run spec
raise "environment variable DOCKER_IMAGE required" unless ENV['DOCKER_IMAGE']
opts = {
  'Image' => ENV['DOCKER_IMAGE'],
  'Env'   => [ 'APT_LINE=keep' ]
}
container = ::Docker::Container.create(opts)
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
Timeout.timeout(60) do
  begin
    s = TCPSocket.open(container.json['NetworkSettings']['IPAddress'], 22)
    s.close
  rescue Errno::ECONNREFUSED
    sleep 1
    retry
  end
end

