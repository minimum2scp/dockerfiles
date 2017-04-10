require 'serverspec'
require 'docker'
#require 'pry'
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

## configure ssh
set :backend, :ssh

## skip OS detection
## see specinfra-2.12.3/lib/specinfra/helper/os.rb
##     specinfra-2.12.3/lib/specinfra/helper/detect_os/debian.rb
##
## set `:release => nil` to use `specinfra-x.x.x/lib/specinfra/command/debian/base/`,
## not to use `specinfra-x.x.x/lib/specinfra/command/debian/v8` (systemd)
set :os, :family => 'debian', :arch => 'x86_64', :release => nil

def start_container(opts)
  ## start container before run test
  if ENV["CIRCLECI"]
    opts['Env'] << "CIRCLECI=#{ENV['CIRCLECI']}"
    opts['HostConfig'] ||= {}
    opts['HostConfig']['PublishAllPorts'] = true
  end
  container = ::Docker::Container.create(opts)
  container.start

  ## save container object to Specinfra.configuration
  ## (to stop and delete container after suite)
  set :docker_container_obj, container

  ## configure ssh
  if ENV["CIRCLECI"] && ENV["DOCKER_HOST"]
    host = URI.parse(ENV["DOCKER_HOST"]).host
    port = container.json['NetworkSettings']['Ports']['22/tcp'][0]['HostPort'].to_i
    set :host, host
    set :ssh_options, {
      :user                  => 'debian',
      :password              => 'debian',
      :user_known_hosts_file => '/dev/null',
      :port                  => port
    }
else
    host = container.json['NetworkSettings']['IPAddress']
    port = 22
    set :host, host
    set :ssh_options, {
      :user                  => 'debian',
      :password              => 'debian',
      :user_known_hosts_file => '/dev/null',
      :port                  => 22
    }
  end

  set :host, container.json['NetworkSettings']['IPAddress']

  ## wait for sshd in container start
  Timeout.timeout(60) do
    begin
      puts "Waiting for host=#{host}, port=#{port} ..."
      s = TCPSocket.open(host, port)
      s.close
    rescue Errno::ECONNREFUSED
      sleep 1
      retry
    end
  end
end

def stop_container
  ## stop and delete container after test
  container = Specinfra.configuration.docker_container_obj
  container.delete(force: true)

  ## reset Net::SSH object for next test
  Specinfra.backend.set_config(:ssh, nil)
end
