require 'serverspec'
require 'docker'
#require 'pry'
require 'timeout'
require 'socket'
require 'shellwords'
require 'json'

## show debug log
if ENV['DOCKER_API_DEBUG'] =~ /^1|on|true|yes$/i
  require 'logger'
  Docker.logger = Logger.new(STDERR)
  Docker.logger.level = Logger::DEBUG
end

## configure ssh
set :backend, :ssh
set :ssh_options, {
  :user     => 'debian',
  :password => 'debian',
  :user_known_hosts_file => '/dev/null',
}

## skip OS detection
## see specinfra-2.12.3/lib/specinfra/helper/os.rb
##     specinfra-2.12.3/lib/specinfra/helper/detect_os/debian.rb
##
## set `:release => nil` to use `specinfra-x.x.x/lib/specinfra/command/debian/base/`,
## not to use `specinfra-x.x.x/lib/specinfra/command/debian/v8` (systemd)
set :os, :family => 'debian', :arch => 'x86_64', :release => nil

def start_container(opts)
  ## start container before run test
  container = ::Docker::Container.create(opts)
  container.start

  ## save container object to Specinfra.configuration
  ## (to stop and delete container after suite)
  set :docker_container_obj, container

  ## configure ssh
  set :host, container.json['NetworkSettings']['IPAddress']

  ## wait for sshd in container start
  wait_container_port(22)
end

def stop_container
  ## stop and delete container after test
  container = Specinfra.configuration.docker_container_obj
  container.delete(force: true)

  ## reset Net::SSH object for next test
  Specinfra.backend.set_config(:ssh, nil)
end

def wait_container_port(port, timeout: 60, interval: 1)
  Timeout.timeout(timeout) do
    begin
      s = TCPSocket.open(Specinfra.configuration.host, port)
      s.close
    rescue Errno::ECONNREFUSED
      sleep interval
      retry
    end
  end
end

def wait_container_file(file, timeout: 60, interval: 1)
  container = Specinfra.configuration.docker_container_obj
  begin
    Timeout.timeout(timeout) do
      loop do
        stdout_messages, stderr_messages, exit_code = container.exec(Shellwords.shellsplit("[ -f #{file} ]"))
        if exit_code == 0
          break
        else
          sleep interval
        end
      end
    end
  end
end

def container_exec(cmd, timeout: 60)
  container = Specinfra.configuration.docker_container_obj
  begin
    Timeout.timeout(timeout) do
      stdout_messages, stderr_messages, exit_code = container.exec(Shellwords.shellsplit(cmd))
      if exit_code != 0
        warn stdout_messages
        warn stderr_messages
        raise "#{cmd} failed with exit code #{exit_code}"
      end
    end
  end
end
