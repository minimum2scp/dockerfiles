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
      [ '2.3.0',          'ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-linux]' ],
      [ '2.2.4',          'ruby 2.2.4p230 (2015-12-16 revision 53155) [x86_64-linux]' ],
      [ '2.1.9',          'ruby 2.1.9p490 (2016-03-30 revision 54437) [x86_64-linux]' ],
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

    %w[ruby2.3 ruby2.3-dev].each do |pkg|
      describe package(pkg) do
        it { should be_installed }
      end
    end

    describe command('ruby2.3 -v') do
      its(:stdout) { should include 'ruby 2.3.0p0 (2015-12-25) [x86_64-linux-gnu]' }
    end
  end
end
