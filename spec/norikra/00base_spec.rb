require 'spec_helper'

describe 'minimum2scp/norikra' do
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

    #Dir["#{__dir__}/../baseimage/*_spec.rb"].sort.each do |spec|
    #  load spec
    #end

    describe file('/tmp/build') do
      it { should_not be_directory }
    end

    describe package('norikra') do
      let(:path){ '/opt/rbenv/versions/jruby-9.4.2.0/bin:$PATH' }
      it { should be_installed.by('gem') }
    end
  end
end
