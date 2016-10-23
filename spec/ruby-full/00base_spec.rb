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
        ruby: '2.4.0-preview2',
        desc: 'ruby 2.4.0preview2 (2016-09-09 trunk 56129) [x86_64-linux]',
        gems: [
          {name: 'bundler', version: '1.13.6'},
          {name: 'pry'}
        ]
      },
      {
        ruby: '2.3.1',
        desc: 'ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-linux]',
        gems: [
          {name: 'bundler', version: '1.13.6'},
          {name: 'pry'}
        ]
      },
      {
        ruby: '2.2.5',
        desc: 'ruby 2.2.5p319 (2016-04-26 revision 54774) [x86_64-linux]',
        gems: [
          {name: 'bundler', version: '1.13.6'},
          {name: 'pry'}
        ]
      },
      {
        ruby: '2.1.10',
        desc: 'ruby 2.1.10p492 (2016-04-01 revision 54464) [x86_64-linux]',
        gems: [
          {name: 'bundler', version: '1.13.6'},
          {name: 'pry'}
        ]
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
    end

    %w[ruby2.3 ruby2.3-dev].each do |pkg|
      describe package(pkg) do
        it { should be_installed }
      end
    end

    describe command('ruby2.3 -v') do
      its(:stdout) { should include 'ruby 2.3.1p112 (2016-04-26) [x86_64-linux-gnu]' }
    end
  end
end
