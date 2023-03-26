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
        ruby: '3.2.1',
        desc: 'ruby 3.2.1 (2023-02-08 revision 31819e82c8) [x86_64-linux]',
        rubygems_version: '3.4.9',
        gems: [
          {name: 'bundler', version: 'default: 2.4.9, 1.17.3'},
          {name: 'pry'}
        ],
        openssl_version: '3.0.8'
      },
      {
        ruby: '3.1.3',
        desc: 'ruby 3.1.3p185 (2022-11-24 revision 1a6b16756e) [x86_64-linux]',
        rubygems_version: '3.4.9',
        gems: [
          {name: 'bundler', version: 'default: 2.4.9, 1.17.3'},
          {name: 'pry'}
        ],
        openssl_version: '3.0.8'
      },
      {
        ruby: '3.0.5',
        desc: 'ruby 3.0.5p211 (2022-11-24 revision ba5cf0f7c5) [x86_64-linux]',
        rubygems_version: '3.4.9',
        gems: [
          {name: 'bundler', version: 'default: 2.4.9, 1.17.3'},
          {name: 'pry'}
        ],
        openssl_version: '1.1.1'
      },
      {
        ruby: '2.7.7',
        desc: 'ruby 2.7.7p221 (2022-11-24 revision 168ec2b1e5) [x86_64-linux]',
        rubygems_version: '3.4.9',
        gems: [
          {name: 'bundler', version: 'default: 2.4.9, 1.17.3'},
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

    %w[ruby3.1 ruby3.1-dev].each do |pkg|
      describe package(pkg) do
        it { should be_installed }
      end
    end

    describe command('ruby3.1 -v') do
      its(:stdout) { should start_with('ruby 3.1.2p') }
    end
  end
end
