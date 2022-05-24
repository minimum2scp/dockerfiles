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
        ruby: '3.1.2',
        desc: 'ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [x86_64-linux]',
        rubygems_version: '3.3.14',
        gems: [
          {name: 'bundler', version: 'default: 2.3.14, 1.17.3'},
          {name: 'pry'}
        ],
        openssl_version: '3.0.3'
      },
      {
        ruby: '3.0.4',
        desc: 'ruby 3.0.4p208 (2022-04-12 revision 3fa771dded) [x86_64-linux]',
        rubygems_version: '3.3.14',
        gems: [
          {name: 'bundler', version: 'default: 2.3.14, 1.17.3'},
          {name: 'pry'}
        ],
        openssl_version: '1.1.1'
      },
      {
        ruby: '2.7.6',
        desc: 'ruby 2.7.6p219 (2022-04-12 revision c9c2245c0a) [x86_64-linux]',
        rubygems_version: '3.3.14',
        gems: [
          {name: 'bundler', version: 'default: 2.3.14, 1.17.3'},
          {name: 'pry'}
        ],
        openssl_version: '1.1.1'
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

      describe command("RBENV_VERSION=#{v[:ruby]} gem -v") do
        let(:login_shell){ true }
        let(:env){ Bundler.original_env }
        its(:stdout) { should eq "#{v[:rubygems_version]}\n" }
      end

      describe command("RBENV_VERSION=#{v[:ruby]} gem outdated") do
        let(:login_shell){ true }
        let(:env){ Bundler.original_env }
        pending {
          its(:stdout) { should_not match /^bundler / }
          its(:stdout) { should_not match /^rubygems-update / }
        }
      end

      v[:gems].each do |gem|
        gem_list_opt = v[:ruby] =~ /\A2\.3\.\d+\z/ ? '' : '--exact'
        describe command("RBENV_VERSION=#{v[:ruby]} gem list #{gem_list_opt} #{gem[:name]}") do
          let(:login_shell){ true }
          let(:env){ Bundler.original_env }
          its(:stdout){
            version_regexp = if gem[:version] && gem[:default] == true
                               /\(default: #{Regexp.quote(gem[:version])}\)/
                             elsif gem[:version] && gem[:default]
                               /\(#{Regexp.quote(gem[:version])}, default: #{Regexp.quote(gem[:default])}\)/
                             elsif gem[:version]
                               /\(#{Regexp.quote(gem[:version])}\)/
                             elsif gem[:default]
                               /\(default: .+\)/
                             else
                               /\(.+\)/
                             end
            should match(/^#{Regexp.quote(gem[:name])} #{version_regexp}$/)
          }
        end
      end

      describe command("RBENV_VERSION=#{v[:ruby]} ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
        let(:login_shell){ true }
        its(:stdout){ should match /^OpenSSL #{Regexp.quote(v[:openssl_version])}/ }
      end
    end

    %w[ruby3.0 ruby3.0-dev].each do |pkg|
      describe package(pkg) do
        it { should be_installed }
      end
    end

    describe command('ruby3.0 -v') do
      its(:stdout) { should start_with('ruby 3.0.4p') }
    end
  end
end
