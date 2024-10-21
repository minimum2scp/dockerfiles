require 'spec_helper'

describe 'minimum2scp/tdiary' do
  context 'without env' do
    before(:all) do
      start_container({
        'Image' => ENV['DOCKER_IMAGE'] || "minimum2scp/#{File.basename(__dir__)}:latest",
      })
      ## wait for tdiary startup
      wait_container_port 80
      wait_container_port 19292
    end

    after(:all) do
      stop_container
    end

    #Dir["#{__dir__}/../ruby-full/*_spec.rb"].sort.each do |spec|
    #  load spec
    #end

    describe file('/tmp/build') do
      it { should_not be_directory }
    end

    describe 'tdiary' do
      %w[
        libsqlite3-dev
        supervisor
      ].each do |pkg|
        describe package(pkg) do
          it { should be_installed }
        end
      end

      describe command('rbenv version-name') do
        let(:login_shell){ true }
        its(:stdout){ should eq "3.2.5\n" }
      end

      %w[
        tdiary-core
        tdiary-contrib
        tdiary-blogkit
        tdiary-cache-redis
        tdiary-cache-memcached
        tdiary-cache-null
        tdiary-io-mongodb
        tdiary-io-rdb
        tdiary-theme
        tdiary-theme-nonfree
        tdiary-style-emptdiary
        tdiary-style-etdiary
        tdiary-style-gfm
        tdiary-style-rd
      ].each do |repo|
        describe file("/home/debian/go/src/github.com/tdiary/#{repo}") do
          it { should be_directory }
        end
      end

      describe command('cd /home/debian/go/src/github.com/tdiary/tdiary-core && bundle check') do
        let(:login_shell){ true }
        its(:exit_status){ should eq 0 }
        its(:stdout){ should end_with("The Gemfile's dependencies are satisfied\n") }
      end

      describe file("/home/debian/go/src/github.com/tdiary/tdiary-core/tdiary.conf") do
        it { should be_linked_to '/home/debian/tdiary/tdiary.conf' }
      end

      describe file('/home/debian/go/src/github.com/tdiary/tdiary-core/.htpasswd') do
        it { should be_linked_to '/home/debian/tdiary/.htpasswd' }
      end

      describe file('/home/debian/tdiary/data') do
        it { should be_directory }
      end

      describe file('/home/debian/tdiary/.htpasswd') do
        it { should be_file }
      end

      describe file('/home/debian/tdiary/tdiary.conf') do
        it { should be_file }
      end

      describe service('supervisor') do
        it { should be_running }
        it { should be_enabled }
      end

      describe port(9001) do
        it { should be_listening.with('tcp') }
      end

      describe package('nginx') do
        it {
          pending 'Switched nginx package to debian.org ones'
          should be_installed.with_version('1.22.1-1~bullseye')
        }
        it { should be_installed.with_version('1.26.0-3+b1') }
      end

      describe file('/etc/nginx/nginx.conf') do
        it { should be_file }
      end

      describe file('/etc/nginx/conf.d/default.conf') do
        it { should_not be_file }
      end

      describe file('/etc/nginx/conf.d/misc.conf') do
        it { should be_file }
      end

      describe file('/etc/nginx/conf.d/tdiary.conf') do
        it { should be_file }
      end

      describe service('nginx') do
        it { should be_running }
        it { should be_enabled }
      end

      describe port(80) do
        it { should be_listening.with('tcp') }
      end

      describe service('tdiary') do
        it { should be_running.under('supervisor') }
      end

      describe port(19292) do
        it { should be_listening.with('tcp') }
      end
    end
  end
end
