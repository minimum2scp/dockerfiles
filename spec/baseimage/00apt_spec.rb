require 'spec_helper'

describe file('/etc/apt/sources.list') do
  apt_line_re = ->(enabled, type, uri, suite, *components) {
    /^#{enabled ? '' : '#'}#{type}\s+#{Regexp.quote(uri)}\s+#{suite}\s+#{components.join('\s+')}$/
  }
  ## stable
  its(:content) { should match apt_line_re[false, 'deb',     'http://ftp.jp.debian.org/debian/', 'stable',         'main', 'non-free', 'contrib'] }
  its(:content) { should match apt_line_re[false, 'deb-src', 'http://ftp.jp.debian.org/debian/', 'stable',         'main', 'non-free', 'contrib'] }
  its(:content) { should match apt_line_re[false, 'deb',     'http://security.debian.org/',      'stable/updates', 'main', 'contrib', 'non-free'] }
  its(:content) { should match apt_line_re[false, 'deb-src', 'http://security.debian.org/',      'stable/updates', 'main', 'contrib', 'non-free'] }
  its(:content) { should match apt_line_re[false, 'deb',     'http://ftp.jp.debian.org/debian/', 'stable-updates', 'main', 'contrib', 'non-free'] }
  its(:content) { should match apt_line_re[false, 'deb-src', 'http://ftp.jp.debian.org/debian/', 'stable-updates', 'main', 'contrib', 'non-free'] }
  ## testing
  its(:content) { should match apt_line_re[false, 'deb',     'http://ftp.jp.debian.org/debian/', 'testing',        'main', 'non-free', 'contrib'] }
  its(:content) { should match apt_line_re[false, 'deb-src', 'http://ftp.jp.debian.org/debian/', 'testing',        'main', 'non-free', 'contrib'] }
  ## sid
  its(:content) { should match apt_line_re[true,  'deb',     'http://ftp.jp.debian.org/debian/', 'sid',            'main', 'non-free', 'contrib'] }
  its(:content) { should match apt_line_re[false, 'deb-src', 'http://ftp.jp.debian.org/debian/', 'sid',            'main', 'non-free', 'contrib'] }
  ## experimental
  its(:content) { should match apt_line_re[false, 'deb',     'http://ftp.jp.debian.org/debian/', 'experimental',   'main', 'non-free', 'contrib'] }
  its(:content) { should match apt_line_re[false, 'deb-src', 'http://ftp.jp.debian.org/debian/', 'experimental',   'main', 'non-free', 'contrib'] }
end


