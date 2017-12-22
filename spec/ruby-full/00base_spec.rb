require 'spec_helper'

describe 'minimum2scp/ruby-full' do
  context 'with env [APT_LINE=keep]' do
    before(:all) do
      start_container({
        'Image' => ENV['DOCKER_IMAGE'] || "minimum2scp/#{File.basename(__dir__)}:latest",
        'Env' => [ 'APT_LINE=keep' ]
      })
    end

    after(:all) do
      stop_container
    end

    #Dir["#{__dir__}/../ruby/*_spec.rb"].sort.each do |spec|
    #  load spec
    #end

    describe file('/tmp/build') do
      it { should_not be_directory }
    end

    [
      {
        ruby: '2.5.0-rc1',
        desc: 'ruby 2.5.0rc1 (2017-12-14 trunk 61243) [x86_64-linux]',
        rubygems_version: '2.7.3',
        gems: [
          {name: 'bundler', version: '1.16.1.pre1', default: true},
          {name: 'pry'}
        ],
        openssl_version: '1.1.0'
      },
      {
        ruby: '2.4.3',
        desc: 'ruby 2.4.3p205 (2017-12-14 revision 61247) [x86_64-linux]',
        rubygems_version: '2.6.14',
        gems: [
          {name: 'bundler', version: '1.16.1'},
          {name: 'pry'}
        ],
        openssl_version: '1.1.0'
      },
      {
        ruby: '2.3.6',
        desc: 'ruby 2.3.6p384 (2017-12-14 revision 61254) [x86_64-linux]',
        rubygems_version: '2.5.2.2',
        gems: [
          {name: 'bundler', version: '1.16.1'},
          {name: 'pry'}
        ],
        openssl_version: '1.0.2'
      },
      {
        ruby: '2.2.9',
        desc: 'ruby 2.2.9p480 (2017-12-15 revision 61259) [x86_64-linux]',
        rubygems_version: '2.4.5.4',
        gems: [
          {name: 'bundler', version: '1.16.1'},
          {name: 'pry'}
        ],
        openssl_version: '1.0.2'
      }
    ].each do |v|
      describe command("rbenv versions --bare --skip-aliases") do
        let(:login_shell){ true }
        its(:stdout) { should match /^#{Regexp.quote(v[:ruby])}$/ }
      end

      describe command("RBENV_VERSION=#{v[:ruby]} ruby -v") do
        let(:login_shell){ true }
        its(:stdout) { should eq "#{v[:desc]}\n" }
      end

      describe command("RBENV_VERSION=#{v[:ruby]} gem -v") do
        let(:login_shell){ true }
        its(:stdout) { should eq "#{v[:rubygems_version]}\n" }
      end

      describe command("RBENV_VERSION=#{v[:ruby]} gem list") do
        let(:login_shell){ true }
        v[:gems].each do |gem|
          if gem[:version] && gem[:default]
            its(:stdout){ should match /^#{gem[:name]} #{Regexp.quote("(default: #{gem[:version]})")}$/ }
          elsif gem[:version]
            its(:stdout){ should match /^#{gem[:name]} #{Regexp.quote("(#{gem[:version]})")}$/ }
          elsif gem[:default]
            its(:stdout){ should match /^#{gem[:name]} \(default: .+\)$/ }
          else
            its(:stdout){ should match /^#{gem[:name]} / }
          end
        end
      end

      describe command("RBENV_VERSION=#{v[:ruby]} ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
        let(:login_shell){ true }
        its(:stdout){ should match /^OpenSSL #{Regexp.quote(v[:openssl_version])}/ }
      end
    end

    %w[ruby2.3 ruby2.3-dev].each do |pkg|
      describe package(pkg) do
        it { should be_installed }
      end
    end

    describe command('ruby2.3 -v') do
      its(:stdout) { should include 'ruby 2.3.5p376 (2017-09-14) [x86_64-linux-gnu]' }
    end
  end
end
