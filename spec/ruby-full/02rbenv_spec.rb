require 'spec_helper'

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
