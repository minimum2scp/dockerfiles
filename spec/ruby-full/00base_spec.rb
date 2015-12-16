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

    describe file('/build') do
      it { should_not be_directory }
    end

    [
      [ '2.3.0-preview2', 'ruby 2.3.0preview2 (2015-12-11 trunk 53028) [x86_64-linux]' ],
      [ '2.2.4',          'ruby 2.2.4p230 (2015-12-16 revision 53155) [x86_64-linux]' ],
      [ '2.1.8',          'ruby 2.1.8p440 (2015-12-16 revision 53160) [x86_64-linux]' ],
      [ '2.0.0-p648',     'ruby 2.0.0p648 (2015-12-16 revision 53162) [x86_64-linux]' ],
    ].each do |dir, version|
      describe file("/opt/rbenv/versions/#{dir}") do
        it { should be_directory }
      end

      describe command("/opt/rbenv/versions/#{dir}/bin/ruby -v") do
        its(:stdout) { should include version }
      end

      describe command("/opt/rbenv/versions/#{dir}/bin/gem list") do
        its(:stdout) { should match /^bundler / }
        its(:stdout) { should match /^pry / }
      end
    end

    %w[ruby2.2 ruby2.2-dev].each do |pkg|
      describe package(pkg) do
        it { should be_installed }
      end
    end

    describe command('ruby2.2 -v') do
      its(:stdout) { should include 'ruby 2.2.3p173 (2015-08-18) [x86_64-linux-gnu]'}
    end
  end
end
