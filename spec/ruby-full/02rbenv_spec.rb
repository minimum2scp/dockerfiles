require 'spec_helper'

[
  [ '2.2.1',      'ruby 2.2.1p85 (2015-02-26 revision 49769) [x86_64-linux]' ],
  [ '2.1.5',      'ruby 2.1.5p273 (2014-11-13 revision 48405) [x86_64-linux]' ],
  [ '2.0.0-p643', 'ruby 2.0.0p643 (2015-02-25 revision 49749) [x86_64-linux]' ]
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
