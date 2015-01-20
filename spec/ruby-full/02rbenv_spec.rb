require 'spec_helper'

[
  [ '2.2.0',      'ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-linux]' ],
  [ '2.1.5',      'ruby 2.1.5p273 (2014-11-13 revision 48405) [x86_64-linux]' ],
  [ '2.0.0-p598', 'ruby 2.0.0p598 (2014-11-13 revision 48408) [x86_64-linux]' ]
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
