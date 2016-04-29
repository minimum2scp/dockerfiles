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
      [ '2.3.1',          'ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-linux]' ],
      [ '2.2.5',          'ruby 2.2.5p319 (2016-04-26 revision 54774) [x86_64-linux]' ],
      [ '2.1.10',         'ruby 2.1.10p492 (2016-04-01 revision 54464) [x86_64-linux]' ],
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
      its(:stdout) { should include 'ruby 2.3.1p112 (2016-04-26) [x86_64-linux-gnu]' }
    end
  end
end
