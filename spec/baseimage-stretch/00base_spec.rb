require 'spec_helper'

describe 'minimum2scp/baseimage-stretch' do
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

    ## no merged usr
    ## https://wiki.debian.org/UsrMerge
    ## https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=839046
    %w[/bin /lib /lib64 /sbin].each do |dir|
      describe file(dir) do
        it { should be_directory }
        it { should_not be_symlink }
      end
    end
    %w[/lib32 /libx32].each do |dir|
      describe file(dir) do
        it { should_not be_directory }
        it { should_not be_symlink }
      end
    end

    describe file('/etc/apt/sources.list') do
      apt_line_re = ->(enabled, type, uri, suite, *components) {
        /^#{enabled ? '' : '#'}#{type}\s+#{Regexp.quote(uri)}\s+#{suite}\s+#{components.join('\s+')}$/
      }
      ## stable
      its(:content) { should match apt_line_re[true, 'deb',     'http://deb.debian.org/debian/', 'stretch',         'main', 'contrib', 'non-free'] }
      its(:content) { should match apt_line_re[true, 'deb-src', 'http://deb.debian.org/debian/', 'stretch',         'main', 'contrib', 'non-free'] }
      its(:content) { should match apt_line_re[true, 'deb',     'http://security.debian.org/',   'stretch/updates', 'main', 'contrib', 'non-free'] }
      its(:content) { should match apt_line_re[true, 'deb-src', 'http://security.debian.org/',   'stretch/updates', 'main', 'contrib', 'non-free'] }
      its(:content) { should match apt_line_re[true, 'deb',     'http://deb.debian.org/debian/', 'stretch-updates', 'main', 'contrib', 'non-free'] }
      its(:content) { should match apt_line_re[true, 'deb-src', 'http://deb.debian.org/debian/', 'stretch-updates', 'main', 'contrib', 'non-free'] }
      its(:content) { should match apt_line_re[true, 'deb',     'http://deb.debian.org/debian/', 'stretch-backports', 'main', 'contrib', 'non-free'] }
      its(:content) { should match apt_line_re[true, 'deb-src', 'http://deb.debian.org/debian/', 'stretch-backports', 'main', 'contrib', 'non-free'] }
      ## testing
      its(:content) { should_not match apt_line_re[true, 'deb',     'http://deb.debian.org/debian/', 'testing',        'main', 'contrib', 'non-free'] }
      its(:content) { should_not match apt_line_re[true, 'deb-src', 'http://deb.debian.org/debian/', 'testing',        'main', 'contrib', 'non-free'] }
      ## sid
      its(:content) { should_not match apt_line_re[true, 'deb',     'http://deb.debian.org/debian/', 'sid',            'main', 'contrib', 'non-free'] }
      its(:content) { should_not match apt_line_re[true, 'deb-src', 'http://deb.debian.org/debian/', 'sid',            'main', 'contrib', 'non-free'] }
      ## experimental
      its(:content) { should_not match apt_line_re[true, 'deb',     'http://deb.debian.org/debian/', 'experimental',   'main', 'contrib', 'non-free'] }
      its(:content) { should_not match apt_line_re[true, 'deb-src', 'http://deb.debian.org/debian/', 'experimental',   'main', 'contrib', 'non-free'] }
    end

    describe file('/etc/apt/apt.conf.d/proxy.conf') do
      it { should_not be_exist }
    end

    %w[
      sudo adduser curl ca-certificates openssl git lv vim-tiny man-db whiptail zsh net-tools unzip
      etckeeper locales tzdata localepurge sysvinit-core openssh-server rsyslog cron
    ].each do |pkg|
      describe package(pkg) do
        it { should be_installed }
      end
    end

    %w[
      systemd systemd-sysv
    ].each do |pkg|
      describe package(pkg) do
        it { should_not be_installed }
      end
    end

    describe file("/etc/default/locale") do
      its(:content){ should include 'LANG=C' }
    end

    describe file("/etc/locale.gen") do
      its(:content){ should match /^en_US\.UTF-8\s+UTF-8\s*/ }
      its(:content){ should match /^ja_JP\.UTF-8\s+UTF-8\s*/ }
    end

    describe file("/etc/timezone") do
      its(:content){ should include 'Asia/Tokyo' }
    end

    describe file("/etc/localtime") do
      it { should be_linked_to '/usr/share/zoneinfo/Asia/Tokyo' }
    end

    describe file("/etc/locale.nopurge") do
      its(:content){ should match /^en$/ }
      its(:content){ should match /^en_US$/ }
      its(:content){ should match /^en_US\.UTF-8$/ }
      its(:content){ should match /^ja$/ }
      its(:content){ should match /^ja_JP\.UTF-8$/ }
    end

    describe file("/etc/inittab") do
      its(:content) { should match %r!^#si::sysinit:/etc/init.d/rcS! }
      its(:content) { should match %r!^#1:2345:respawn:/sbin/getty 38400 tty1$! }
      its(:content) { should match %r!^#[2-7]:23:respawn:/sbin/getty 38400 tty[2-7]$! }
    end

    describe file("/etc/default/hwclock") do
      its(:content) { should match /^HWCLOCKACCESS=no$/ }
    end

    describe file("/etc/sudoers") do
      it { should be_mode 440 }
      its(:content) { should match /^#%sudo\s+/ }
    end

    describe file("/etc/sudoers.d/local") do
      it { should be_mode 440 }
      its(:content) { should include '%sudo ALL=(ALL:ALL) NOPASSWD: ALL' }
    end

    describe group('debian') do
      it { should be_exist }
      it { should have_gid 2000 }
    end

    describe user('debian') do
      it { should be_exist }
      it { should belong_to_group 'debian' }
      it { should belong_to_group 'sudo' }
      it { should belong_to_group 'adm' }
      it { should have_uid 2000 }
      it { should have_home_directory '/home/debian' }
      it { should have_login_shell '/bin/bash' }
    end

    %w[ssh cron rsyslog].each do |svc|
      describe service(svc) do
        it { should be_enabled }
        it { should be_running }
      end
    end

    describe file('/opt/init-wrapper') do
      it { should be_directory }
    end

    describe file('/opt/init-wrapper/sbin') do
      it { should be_directory }
    end

    describe file('/opt/init-wrapper/sbin/entrypoint.sh') do
      it { should be_executable }
    end

    describe file('/opt/init-wrapper/post-init.d') do
      it { should be_directory }
    end

    describe file('/opt/init-wrapper/pre-init.d') do
      it { should be_directory }
    end

    describe file('/opt/init-wrapper/pre-init.d/01-git-config') do
      it { should be_executable }
    end

    describe file('/opt/init-wrapper/pre-init.d/02-reset-sshd-keys') do
      it { should be_executable }
    end

    describe file('/opt/init-wrapper/pre-init.d/03-adduser') do
      it { should be_executable }
    end

    describe file('/opt/init-wrapper/pre-init.d/04-chpass-and-sshkey') do
      it { should be_executable }
    end

    describe file('/opt/init-wrapper/pre-init.d/05-apt') do
      it { should be_executable }
    end

    describe file('/opt/init-wrapper/pre-init.d/06-remove-unnecessary-files') do
      it { should be_executable }
    end

    describe file('/opt/init-wrapper/pre-init.d/10-save-env') do
      it { should be_executable }
    end

    describe file('/tmp/build') do
      it { should_not be_directory }
    end
  end


  context 'with env [APT_LINE=keep, APT_HTTP_PROXY=http://x.x.x.x:3142/ DEFAULT_LANG=en_US.UTF-8, DEFAULT_TZ=UTC]' do
    before(:all) do
      start_container({
        'Image' => ENV['DOCKER_IMAGE'] || "minimum2scp/#{File.basename(__dir__)}:latest",
        'Env' => [ 'APT_LINE=keep', 'APT_HTTP_PROXY=http://x.x.x.x:3142/', 'DEFAULT_LANG=en_US.UTF-8', 'DEFAULT_TZ=UTC' ]
      })
    end

    after(:all) do
      stop_container
    end

    describe file('/etc/apt/apt.conf.d/proxy.conf') do
      it { should be_exist }
      its(:content){ should include 'Acquire::http::proxy "http://x.x.x.x:3142/";' }
      its(:content){ should include 'Acquire::https::proxy "DIRECT";' }
    end

    describe file("/etc/default/locale") do
      its(:content){ should include 'LANG=en_US.UTF-8' }
    end

    describe file("/etc/timezone") do
      its(:content){ should include 'Etc/UTC' }
    end

    describe file("/etc/localtime") do
      it { should be_linked_to '/usr/share/zoneinfo/Etc/UTC' }
    end
  end

  context 'with env [APT_LINE=keep, CUSTOM_USER=testuser]' do
    before(:all) do
      start_container({
        'Image' => ENV['DOCKER_IMAGE'] || "minimum2scp/#{File.basename(__dir__)}:latest",
        'Env' => [ 'APT_LINE=keep', 'CUSTOM_USER=testuser' ]
      })
    end

    after(:all) do
      stop_container
    end

    describe group('testuser') do
      it { should exist }
    end

    describe user('testuser') do
      it { should exist }
      it { should belong_to_group('testuser') }
      it { should have_login_shell '/bin/bash' }
    end
  end

  context 'with env [APT_LINE=keep, CUSTOM_USER=testuser, CUSTOM_USER_UID=1999, CUSTOM_USER_SHELL=/bin/false, CUSTOM_GROUP=testgrp, CUSTOM_GROUP_GID=1999]' do
    before(:all) do
      start_container({
        'Image' => ENV['DOCKER_IMAGE'] || "minimum2scp/#{File.basename(__dir__)}:latest",
        'Env' => [
          'APT_LINE=keep',
          'CUSTOM_USER=testuser',
          'CUSTOM_USER_UID=1999',
          'CUSTOM_USER_SHELL=/bin/false',
          'CUSTOM_GROUP=testgrp',
          'CUSTOM_GROUP_GID=1999',
        ]
      })
    end

    after(:all) do
      stop_container
    end

    describe group('testgrp') do
      it { should exist }
      it { should have_gid 1999 }
    end

    describe user('testuser') do
      it { should exist }
      it { should belong_to_group('testgrp') }
      it { should have_login_shell '/bin/false' }
      it { should have_uid 1999 }
    end
  end

  context 'with env [APT_LINE=keep, INSTALL_DOCKER_CE_CLI=yes]' do
    before(:all) do
      start_container({
        'Image' => ENV['DOCKER_IMAGE'] || "minimum2scp/#{File.basename(__dir__)}:latest",
        'Env' => [ 'APT_LINE=keep', 'INSTALL_DOCKER_CE_CLI=yes' ]
      })
      # wait /opt/init-wrapper/post-init.d/07-docker-ce-cli
      wait_container_file('/usr/local/bin/docker')
    end

    after(:all) do
      stop_container
    end

    describe file('/opt/init-wrapper/post-init.d/07-docker-ce-cli') do
      it { should be_executable }
    end

    describe file('/usr/local/bin/docker') do
      it { should be_executable }
    end

    describe command('docker --version') do
      its(:stdout){ should match a_string_starting_with('Docker version 19.03.12, ') }
    end
  end

  context 'with env [APT_LINE=keep, INSTALL_NGINX=yes]' do
    before(:all) do
      start_container({
        'Image' => ENV['DOCKER_IMAGE'] || "minimum2scp/#{File.basename(__dir__)}:latest",
        'Env' => [ 'APT_LINE=keep', 'INSTALL_NGINX=yes' ]
      })

      # wait for nignx in container start
      wait_container_port(80)
    end

    after(:all) do
      stop_container
    end

    describe file('/opt/init-wrapper/post-init.d/07-nginx') do
      it { should be_executable }
    end

    describe file('/etc/apt/sources.list.d/nginx.list') do
      it { should be_file }
    end

    describe file('/etc/apt/trusted.gpg.d/nginx.gpg') do
      it { should be_file }
    end

    describe file('/etc/apt/preferences.d/nginx') do
      it { should be_file }
    end

    describe command('apt-cache policy') do
      its(:stdout) {
        should include " 600 http://nginx.org/packages/mainline/debian stretch/nginx amd64 Packages\n" +
                       "     release v=9.0,o=nginx,a=stable,n=stretch,l=nginx,c=nginx,b=amd64\n" +
                       "     origin nginx.org\n"
      }
      its(:stdout) {
        should include " 600 http://nginx.org/packages/debian stretch/nginx amd64 Packages\n" +
                       "     release v=9.0,o=nginx,a=stable,n=stretch,l=nginx,c=nginx,b=amd64\n" +
                       "     origin nginx.org\n"
      }
    end

    describe package('nginx') do
      it { should be_installed.with_version('1.19.1-1~stretch') }
    end

    describe file('/etc/nginx/conf.d/misc.conf') do
      it { should be_file }
    end

    describe service('nginx') do
      it { should be_running }
      it { should be_enabled }
    end
  end
end
