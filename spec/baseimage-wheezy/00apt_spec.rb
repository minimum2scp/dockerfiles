require 'spec_helper'

describe file('/etc/apt/sources.list') do
  apt_line_re = ->(enabled, type, uri, suite, *components) {
    /^#{enabled ? '' : '#'}#{type}\s+#{Regexp.quote(uri)}\s+#{suite}\s+#{components.join('\s+')}$/
  }
  ## stable
  its(:content) { should match apt_line_re[true, 'deb',     'http://http.debian.net/debian/', 'wheezy',         'main', 'contrib', 'non-free'] }
  its(:content) { should match apt_line_re[true, 'deb-src', 'http://http.debian.net/debian/', 'wheezy',         'main', 'contrib', 'non-free'] }
  its(:content) { should match apt_line_re[true, 'deb',     'http://security.debian.org/',    'wheezy/updates', 'main', 'contrib', 'non-free'] }
  its(:content) { should match apt_line_re[true, 'deb-src', 'http://security.debian.org/',    'wheezy/updates', 'main', 'contrib', 'non-free'] }
  its(:content) { should match apt_line_re[true, 'deb',     'http://http.debian.net/debian/', 'wheezy-updates', 'main', 'contrib', 'non-free'] }
  its(:content) { should match apt_line_re[true, 'deb-src', 'http://http.debian.net/debian/', 'wheezy-updates', 'main', 'contrib', 'non-free'] }
  ## testing
  its(:content) { should_not match apt_line_re[true, 'deb',     'http://http.debian.net/debian/', 'testing',        'main', 'contrib', 'non-free'] }
  its(:content) { should_not match apt_line_re[true, 'deb-src', 'http://http.debian.net/debian/', 'testing',        'main', 'contrib', 'non-free'] }
  ## sid
  its(:content) { should_not match apt_line_re[true,  'deb',     'http://http.debian.net/debian/', 'sid',            'main', 'contrib', 'non-free'] }
  its(:content) { should_not match apt_line_re[true, 'deb-src', 'http://http.debian.net/debian/', 'sid',            'main', 'contrib', 'non-free'] }
  ## experimental
  its(:content) { should_not match apt_line_re[true, 'deb',     'http://http.debian.net/debian/', 'experimental',   'main', 'contrib', 'non-free'] }
  its(:content) { should_not match apt_line_re[true, 'deb-src', 'http://http.debian.net/debian/', 'experimental',   'main', 'contrib', 'non-free'] }
end


