require 'spec_helper'

describe 'minimum2scp/ruby-full' do
  context 'without env' do
    before(:all) do
      start_container({
        'Image' => ENV['DOCKER_IMAGE'] || "minimum2scp/#{File.basename(__dir__)}:latest",
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
        ruby: '3.4.5',
        desc: 'ruby 3.4.5 (2025-07-16 revision 20cda200d3) +PRISM [x86_64-linux]',
        rubygems_version: '3.7.1',
        gems: [
          {name: 'bundler', version: 'default: 2.7.1'},
        ],
        openssl_version: '3.5.1'
      },
      {
        ruby: '3.3.8',
        desc: 'ruby 3.3.8 (2025-04-09 revision b200bad6cd) [x86_64-linux]',
        rubygems_version: '3.7.1',
        gems: [
          {name: 'bundler', version: 'default: 2.7.1'},
        ],
        openssl_version: '3.5.1'
      },
      {
        ruby: '3.2.8',
        desc: 'ruby 3.2.8 (2025-03-26 revision 13f495dc2c) [x86_64-linux]',
        rubygems_version: '3.7.1',
        gems: [
          {name: 'bundler', version: 'default: 2.7.1'},
        ],
        openssl_version: '3.5.1'
      },
      {
        ruby: '3.1.7',
        desc: 'ruby 3.1.7p261 (2025-03-26 revision 0a3704f218) [x86_64-linux]',
        rubygems_version: '3.6.9',
        gems: [
          {name: 'bundler', version: 'default: 2.6.9'},
        ],
        openssl_version: '3.5.1'
      },
      {
        ruby: '3.0.7',
        desc: 'ruby 3.0.7p220 (2024-04-23 revision 724a071175) [x86_64-linux]',
        rubygems_version: '3.5.23',
        gems: [
          {name: 'bundler', version: 'default: 2.5.23'},
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

    %w[ruby3.3 ruby3.3-dev].each do |pkg|
      describe package(pkg) do
        it { should be_installed }
      end
    end

    describe command('ruby3.3 -v') do
      its(:stdout) { should start_with('ruby 3.3.8 ') }
    end
  end
end
