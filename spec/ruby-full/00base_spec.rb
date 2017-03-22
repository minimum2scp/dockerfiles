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
        ruby: '2.4.1',
        desc: 'ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-linux]',
        gems: [
          {name: 'bundler', version: '1.14.6'},
          {name: 'pry'}
        ],
        openssl_version: '1.1.0'
      },
      {
        ruby: '2.3.3',
        desc: 'ruby 2.3.3p222 (2016-11-21 revision 56859) [x86_64-linux]',
        gems: [
          {name: 'bundler', version: '1.14.6'},
          {name: 'pry'}
        ],
        openssl_version: '1.0.2'
      },
      {
        ruby: '2.2.6',
        desc: 'ruby 2.2.6p396 (2016-11-15 revision 56800) [x86_64-linux]',
        gems: [
          {name: 'bundler', version: '1.14.6'},
          {name: 'pry'}
        ],
        openssl_version: '1.0.2'
      },
      {
        ruby: '2.1.10',
        desc: 'ruby 2.1.10p492 (2016-04-01 revision 54464) [x86_64-linux]',
        gems: [
          {name: 'bundler', version: '1.14.6'},
          {name: 'pry'}
        ],
        openssl_version: '1.0.2'
      },
    ].each do |v|
      describe command("rbenv versions --bare --skip-aliases") do
        let(:login_shell){ true }
        its(:stdout) { should match /^#{Regexp.quote(v[:ruby])}$/ }
      end

      describe command("RBENV_VERSION=#{v[:ruby]} ruby -v") do
        let(:login_shell){ true }
        its(:stdout) { should eq "#{v[:desc]}\n" }
      end

      describe command("RBENV_VERSION=#{v[:ruby]} gem list") do
        let(:login_shell){ true }
        v[:gems].each do |gem|
          if gem[:version]
            its(:stdout){ should match /^#{gem[:name]} #{Regexp.quote("(#{gem[:version]})")}$/ }
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
      its(:stdout) { should include 'ruby 2.3.3p222 (2016-11-21) [x86_64-linux-gnu]' }
    end
  end
end
