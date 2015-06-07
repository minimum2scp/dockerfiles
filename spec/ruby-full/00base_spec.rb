require 'spec_helper'

describe 'minimum2scp/ruby-full' do
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

  [
    [ '2.2.2',      'ruby 2.2.2p95 (2015-04-13 revision 50295) [x86_64-linux]' ],
    [ '2.1.6',      'ruby 2.1.6p336 (2015-04-13 revision 50298) [x86_64-linux]' ],
    [ '2.0.0-p645', 'ruby 2.0.0p645 (2015-04-13 revision 50299) [x86_64-linux]' ]
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
    its(:stdout) { should include 'ruby 2.2.2p95 (2015-04-13) [x86_64-linux-gnu]'}
  end
end
