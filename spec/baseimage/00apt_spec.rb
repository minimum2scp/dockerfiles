require 'spec_helper'

describe file('/etc/apt/sources.list') do
  apt_line_re = ->(enabled, type, uri, suite, *components) {
    /^#{enabled ? '' : '#'}#{type}\s+#{Regexp.quote(uri)}\s+#{suite}\s+#{components.join('\s+')}$/
  }
  ## stable
  its(:content) { should match apt_line_re[false, 'deb',     'http://httpredir.debian.org/debian/', 'stable',         'main', 'contrib', 'non-free'] }
  its(:content) { should match apt_line_re[false, 'deb-src', 'http://httpredir.debian.org/debian/', 'stable',         'main', 'contrib', 'non-free'] }
  its(:content) { should match apt_line_re[false, 'deb',     'http://security.debian.org/',         'stable/updates', 'main', 'contrib', 'non-free'] }
  its(:content) { should match apt_line_re[false, 'deb-src', 'http://security.debian.org/',         'stable/updates', 'main', 'contrib', 'non-free'] }
  its(:content) { should match apt_line_re[false, 'deb',     'http://httpredir.debian.org/debian/', 'stable-updates', 'main', 'contrib', 'non-free'] }
  its(:content) { should match apt_line_re[false, 'deb-src', 'http://httpredir.debian.org/debian/', 'stable-updates', 'main', 'contrib', 'non-free'] }
  ## testing
  its(:content) { should match apt_line_re[false, 'deb',     'http://httpredir.debian.org/debian/', 'testing',        'main', 'contrib', 'non-free'] }
  its(:content) { should match apt_line_re[false, 'deb-src', 'http://httpredir.debian.org/debian/', 'testing',        'main', 'contrib', 'non-free'] }
  ## sid
  its(:content) { should match apt_line_re[true,  'deb',     'http://httpredir.debian.org/debian/', 'sid',            'main', 'contrib', 'non-free'] }
  its(:content) { should match apt_line_re[false, 'deb-src', 'http://httpredir.debian.org/debian/', 'sid',            'main', 'contrib', 'non-free'] }
  ## experimental
  its(:content) { should match apt_line_re[false, 'deb',     'http://httpredir.debian.org/debian/', 'experimental',   'main', 'contrib', 'non-free'] }
  its(:content) { should match apt_line_re[false, 'deb-src', 'http://httpredir.debian.org/debian/', 'experimental',   'main', 'contrib', 'non-free'] }
end


