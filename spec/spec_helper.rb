require 'serverspec'

set :backend, :docker
set :docker_image, ENV['DOCKER_IMAGE']

if ENV['CIRCLECI']
  require 'docker'
  class Docker::Container
    def remove
      # do not delete container
    end
    alias_method :delete, :remove
  end
end
