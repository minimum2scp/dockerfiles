# about minimum2scp/baseimage-bullseye image

 * based on [minimum2scp/debian-bullseye](https://github.com/minimum2scp/dockerfiles/tree/master/debian-bullseye) image
 * Runs [/opt/init-wrapper/sbin/init](https://github.com/minimum2scp/dockerfiles/blob/master/baseimage/build/opt/init-wrapper/sbin/init) by default
   * /opt/init-wrapper/sbin/init invokes all scripts in /opt/init-wrapper/pre-init.d (using run-parts), and exec /sbin/init
   * /sbin/init is replaced by sysvinit-core package
   * /sbin/init invokes sshd, rsyslogd, cron daemons
   * /etc/rc.local invokes all scripts in /opt/init-wrapper/post-init.d (using run-parts)
 * ja_JP.UTF-8 locale supported. (default locale is C)
 * timezone is Asia/Tokyo
 * etckeeper installed

## start container

```
docker run -d -p 2222:22 minimum2scp/baseimage-bullseye:latest
```

## ssh login to container

ssh login to container:

```
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no debian@<container IP address>
```

or use published port:

```
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -p 2222 debian@localhost
```

 * user "debian" is available
 * default password is "debian"
   * to change password, set environment variable `USER_PASSWORD` (see /opt/init-wrapper/pre-init.d/04-chpass-and-sshkey)
   * to set ssh public key into `~/.ssh/authorized_keys`, set environment variable `USER_SSH_KEY_URI` (see /opt/init-wrapper/pre-init.d/04-chpass-and-sshkey)
 * user "debian" can use sudo command without password
 * `id debian`: `uid=2000(debian) gid=2000(debian) groups=2000(debian),4(adm),27(sudo)`

## processes

```
UID        PID  PPID  C STIME TTY      STAT   TIME CMD
root         1     0  0 01:52 ?        Ss     0:00 init [2]
root        37     1  0 01:52 ?        Ssl    0:00 /usr/sbin/rsyslogd
root        62     1  0 01:52 ?        Ss     0:00 /usr/sbin/cron
root        73     1  0 01:52 ?        Ss     0:00 /usr/sbin/sshd
root        80    73  0 01:52 ?        Ss     0:00  \_ sshd: debian [priv]
debian      82    80  0 01:52 ?        S      0:00      \_ sshd: debian@pts/0
debian      83    82  0 01:52 pts/0    Ss     0:00          \_ -bash
debian      89    83  0 01:52 pts/0    R+     0:00              \_ ps -ef fww
```

## ports

 * TCP/22: sshd

## packages

installed packages:

```
ii   adduser                 3.118+deb11u1                       all    add and remove users and groups
ii   apt                     2.2.4                               amd64  commandline package manager
ii   base-files              11.1+deb11u11                       amd64  Debian base system miscellaneous files
ii   base-passwd             3.5.51                              amd64  Debian base system master password and group files
ii   bash                    5.1-2+deb11u1                       amd64  GNU Bourne Again SHell
ii   bsdextrautils           2.36.1-8+deb11u2                    amd64  extra utilities from 4.4BSD-Lite
ii   bsdutils                1:2.36.1-8+deb11u2                  amd64  basic utilities from 4.4BSD-Lite
ii   bzip2                   1.0.8-4                             amd64  high-quality block-sorting file compressor - utilities
ii   ca-certificates         20210119                            all    Common CA certificates
ii   coreutils               8.32-4+b1                           amd64  GNU core utilities
ii   cron                    3.0pl1-137                          amd64  process scheduling daemon
ii   curl                    7.74.0-1.3+deb11u15                 amd64  command line tool for transferring data with URL syntax
ii   dash                    0.5.11+git20200708+dd9ef66-5        amd64  POSIX-compliant shell
ii   debconf                 1.5.77                              all    Debian configuration management system
ii   debian-archive-keyring  2021.1.1+deb11u1                    all    GnuPG archive keys of the Debian archive
ii   debianutils             4.11.2                              amd64  Miscellaneous utilities specific to Debian
ii   diffutils               1:3.7-5                             amd64  File comparison utilities
ii   dpkg                    1.20.13                             amd64  Debian package management system
ii   e2fsprogs               1.46.2-2+deb11u1                    amd64  ext2/ext3/ext4 file system utilities
ii   etckeeper               1.18.16-1                           all    store /etc in git, mercurial, brz or darcs
ii   findutils               4.8.0-1                             amd64  utilities for finding files--find, xargs
ii   gcc-10-base             10.2.1-6                            amd64  GCC, the GNU Compiler Collection (base package)
ii   gcc-9-base              9.3.0-22                            amd64  GCC, the GNU Compiler Collection (base package)
ii   git                     1:2.30.2-1+deb11u4                  amd64  fast, scalable, distributed revision control system
ii   git-man                 1:2.30.2-1+deb11u4                  all    fast, scalable, distributed revision control system (manual pages)
ii   gpgv                    2.2.27-2+deb11u2                    amd64  GNU privacy guard - signature verification tool
ii   grep                    3.6-1+deb11u1                       amd64  GNU grep, egrep and fgrep
ii   groff-base              1.22.4-6                            amd64  GNU troff text-formatting system (base system components)
ii   gzip                    1.10-4+deb11u1                      amd64  GNU compression utilities
ii   hostname                3.23                                amd64  utility to set/show the host name or domain name
ii   init-system-helpers     1.60                                all    helper tools for all init systems
ii   initscripts             2.96-7+deb11u1                      all    scripts for initializing and shutting down the system
ii   insserv                 1.21.0-1.1                          amd64  boot sequence organizer using LSB init.d script dependency information
ii   libacl1                 2.2.53-10                           amd64  access control list - shared library
ii   libapt-pkg6.0           2.2.4                               amd64  package management runtime library
ii   libattr1                1:2.4.48-6                          amd64  extended attribute handling - shared library
ii   libaudit-common         1:3.0-2                             all    Dynamic library for security auditing - common files
ii   libaudit1               1:3.0-2                             amd64  Dynamic library for security auditing
ii   libblkid1               2.36.1-8+deb11u2                    amd64  block device ID library
ii   libbrotli1              1.0.9-2+b2                          amd64  library implementing brotli encoder and decoder (shared libraries)
ii   libbsd0                 0.11.3-1+deb11u1                    amd64  utility functions from BSD systems - shared library
ii   libbz2-1.0              1.0.8-4                             amd64  high-quality block-sorting file compressor library - runtime
ii   libc-bin                2.31-13+deb11u13                    amd64  GNU C Library: Binaries
ii   libc-l10n               2.31-13+deb11u13                    all    GNU C Library: localization files
ii   libc6                   2.31-13+deb11u13                    amd64  GNU C Library: Shared libraries
ii   libcap-ng0              0.7.9-2.2+b1                        amd64  An alternate POSIX capabilities library
ii   libcap2                 1:2.44-1+deb11u1                    amd64  POSIX 1003.1e capabilities (library)
ii   libcbor0                0.5.0+dfsg-2                        amd64  library for parsing and generating CBOR (RFC 7049)
ii   libcom-err2             1.46.2-2+deb11u1                    amd64  common error description library
ii   libcrypt1               1:4.4.18-4                          amd64  libcrypt shared library
ii   libcurl3-gnutls         7.74.0-1.3+deb11u15                 amd64  easy-to-use client-side URL transfer library (GnuTLS flavour)
ii   libcurl4                7.74.0-1.3+deb11u15                 amd64  easy-to-use client-side URL transfer library (OpenSSL flavour)
ii   libdb5.3                5.3.28+dfsg1-0.8                    amd64  Berkeley v5.3 Database Libraries [runtime]
ii   libdebconfclient0       0.260                               amd64  Debian Configuration Management System (C-implementation library)
ii   libedit2                3.1-20191231-2+b1                   amd64  BSD editline and history libraries
ii   liberror-perl           0.17029-1                           all    Perl module for error/exception handling in an OO-ish way
ii   libestr0                0.1.10-2.1+b1                       amd64  Helper functions for handling strings (lib)
ii   libexpat1               2.2.10-2+deb11u7                    amd64  XML parsing C library - runtime library
ii   libext2fs2              1.46.2-2+deb11u1                    amd64  ext2/ext3/ext4 file system libraries
ii   libfastjson4            0.99.9-1                            amd64  fast json library for C
ii   libffi7                 3.3-6                               amd64  Foreign Function Interface library runtime
ii   libfido2-1              1.6.0-2                             amd64  library for generating and verifying FIDO 2.0 objects
ii   libgcc-s1               10.2.1-6                            amd64  GCC support library
ii   libgcrypt20             1.8.7-6                             amd64  LGPL Crypto library - runtime library
ii   libgdbm-compat4         1.19-2                              amd64  GNU dbm database routines (legacy support runtime version) 
ii   libgdbm6                1.19-2                              amd64  GNU dbm database routines (runtime version) 
ii   libgmp10                2:6.2.1+dfsg-1+deb11u1              amd64  Multiprecision arithmetic library
ii   libgnutls30             3.7.1-5+deb11u7                     amd64  GNU TLS library - main runtime library
ii   libgpg-error0           1.38-2                              amd64  GnuPG development runtime library
ii   libgssapi-krb5-2        1.18.3-6+deb11u7                    amd64  MIT Kerberos runtime libraries - krb5 GSS-API Mechanism
ii   libhogweed6             3.7.3-1                             amd64  low level cryptographic library (public-key cryptos)
ii   libidn2-0               2.3.0-5                             amd64  Internationalized domain names (IDNA2008/TR46) library
ii   libk5crypto3            1.18.3-6+deb11u7                    amd64  MIT Kerberos runtime libraries - Crypto Library
ii   libkeyutils1            1.6.1-2                             amd64  Linux Key Management Utilities (library)
ii   libkrb5-3               1.18.3-6+deb11u7                    amd64  MIT Kerberos runtime libraries
ii   libkrb5support0         1.18.3-6+deb11u7                    amd64  MIT Kerberos runtime libraries - Support library
ii   libldap-2.4-2           2.4.57+dfsg-3+deb11u1               amd64  OpenLDAP libraries
ii   liblognorm5             2.0.5-1.1                           amd64  log normalizing library
ii   liblz4-1                1.9.3-2                             amd64  Fast LZ compression algorithm library - runtime
ii   liblzma5                5.2.5-2.1~deb11u1                   amd64  XZ-format compression library
ii   libmd0                  1.0.3-3                             amd64  message digest functions from BSD systems - shared library
ii   libmount1               2.36.1-8+deb11u2                    amd64  device mounting library
ii   libmpdec3               2.5.1-1                             amd64  library for decimal floating point arithmetic (runtime library)
ii   libncurses6             6.2+20201114-2+deb11u2              amd64  shared libraries for terminal handling
ii   libncursesw6            6.2+20201114-2+deb11u2              amd64  shared libraries for terminal handling (wide character support)
ii   libnettle8              3.7.3-1                             amd64  low level cryptographic library (symmetric and one-way cryptos)
ii   libnewt0.52             0.52.21-4+b3                        amd64  Not Erik's Windowing Toolkit - text mode windowing with slang
ii   libnghttp2-14           1.43.0-1+deb11u2                    amd64  library implementing HTTP/2 protocol (shared library)
ii   libnsl2                 1.3.0-2                             amd64  Public client interface for NIS(YP) and NIS+
ii   libp11-kit0             0.23.22-1                           amd64  library for loading and coordinating access to PKCS#11 modules - runtime
ii   libpam-modules          1.4.0-9+deb11u1                     amd64  Pluggable Authentication Modules for PAM
ii   libpam-modules-bin      1.4.0-9+deb11u1                     amd64  Pluggable Authentication Modules for PAM - helper binaries
ii   libpam-runtime          1.4.0-9+deb11u1                     all    Runtime support for the PAM library
ii   libpam0g                1.4.0-9+deb11u1                     amd64  Pluggable Authentication Modules library
ii   libpcre2-8-0            10.36-2+deb11u1                     amd64  New Perl Compatible Regular Expression Library- 8 bit runtime files
ii   libpcre3                2:8.39-13                           amd64  Old Perl 5 Compatible Regular Expression Library - runtime files
ii   libperl5.32             5.32.1-4+deb11u4                    amd64  shared Perl library
ii   libpipeline1            1.5.3-1                             amd64  Unix process pipeline manipulation library
ii   libpopt0                1.18-2                              amd64  lib for parsing cmdline parameters
ii   libprocps8              2:3.3.17-5                          amd64  library for accessing process information from /proc
ii   libpsl5                 0.21.0-1.2                          amd64  Library for Public Suffix List (shared libraries)
ii   libpython3-stdlib       3.9.2-3                             amd64  interactive high-level object-oriented language (default python3 version)
ii   libpython3.9-minimal    3.9.2-1+deb11u3                     amd64  Minimal subset of the Python language (version 3.9)
ii   libpython3.9-stdlib     3.9.2-1+deb11u3                     amd64  Interactive high-level object-oriented language (standard library, version 3.9)
ii   libreadline8            8.1-1                               amd64  GNU readline and history libraries, run-time libraries
ii   librtmp1                2.4+20151223.gitfa8646d.1-2+b2      amd64  toolkit for RTMP streams (shared library)
ii   libsasl2-2              2.1.27+dfsg-2.1+deb11u1             amd64  Cyrus SASL - authentication abstraction library
ii   libsasl2-modules-db     2.1.27+dfsg-2.1+deb11u1             amd64  Cyrus SASL - pluggable authentication modules (DB)
ii   libseccomp2             2.5.1-1+deb11u1                     amd64  high level interface to Linux seccomp filter
ii   libselinux1             3.1-3                               amd64  SELinux runtime shared libraries
ii   libsemanage-common      3.1-1                               all    Common files for SELinux policy management libraries
ii   libsemanage1            3.1-1+b2                            amd64  SELinux policy management library
ii   libsepol1               3.1-1+deb11u1                       amd64  SELinux library for manipulating binary security policies
ii   libslang2               2.3.2-5                             amd64  S-Lang programming library - runtime version
ii   libsmartcols1           2.36.1-8+deb11u2                    amd64  smart column output alignment library
ii   libsqlite3-0            3.34.1-3+deb11u1                    amd64  SQLite 3 shared library
ii   libss2                  1.46.2-2+deb11u1                    amd64  command-line interface parsing library
ii   libssh2-1               1.9.0-2+deb11u1                     amd64  SSH2 client-side library
ii   libssl1.1               1.1.1w-0+deb11u3                    amd64  Secure Sockets Layer toolkit - shared libraries
ii   libstdc++6              10.2.1-6                            amd64  GNU Standard C++ Library v3
ii   libsystemd0             247.3-7+deb11u6                     amd64  systemd utility library
ii   libtasn1-6              4.16.0-2+deb11u2                    amd64  Manage ASN.1 structures (runtime)
ii   libtinfo6               6.2+20201114-2+deb11u2              amd64  shared low-level terminfo library for terminal handling
ii   libtirpc-common         1.3.1-1+deb11u1                     all    transport-independent RPC library - common files
ii   libtirpc3               1.3.1-1+deb11u1                     amd64  transport-independent RPC library
ii   libuchardet0            0.0.7-1                             amd64  universal charset detection library - shared library
ii   libudev1                247.3-7+deb11u6                     amd64  libudev shared library
ii   libunistring2           0.9.10-4                            amd64  Unicode string library for C
ii   libuuid1                2.36.1-8+deb11u2                    amd64  Universally Unique ID library
ii   libwrap0                7.6.q-31                            amd64  Wietse Venema's TCP wrappers library
ii   libxxhash0              0.8.0-2                             amd64  shared library for xxhash
ii   libzstd1                1.4.8+dfsg-2.1                      amd64  fast lossless compression algorithm
ii   localepurge             0.7.3.10                            all    reclaim disk space by removing unneeded localizations
ii   locales                 2.31-13+deb11u13                    all    GNU C Library: National Language (locale) data [support]
ii   login                   1:4.8.1-1+deb11u1                   amd64  system login tools
ii   logsave                 1.46.2-2+deb11u1                    amd64  save the output of a command in a log file
ii   lsb-base                11.1.0                              all    Linux Standard Base init script functionality
ii   lv                      4.51-8                              amd64  Powerful Multilingual File Viewer
ii   man-db                  2.9.4-2                             amd64  tools for reading manual pages
ii   mawk                    1.3.4.20200120-2                    amd64  Pattern scanning and text processing language
ii   media-types             4.0.0                               all    List of standard media types and their usual file extension
ii   mount                   2.36.1-8+deb11u2                    amd64  tools for mounting and manipulating filesystems
ii   ncurses-base            6.2+20201114-2+deb11u2              all    basic terminal type definitions
ii   ncurses-bin             6.2+20201114-2+deb11u2              amd64  terminal-related programs and man pages
ii   net-tools               1.60+git20181103.0eebece-1+deb11u2  amd64  NET-3 networking toolkit
ii   openssh-client          1:8.4p1-5+deb11u5                   amd64  secure shell (SSH) client, for secure access to remote machines
ii   openssh-server          1:8.4p1-5+deb11u5                   amd64  secure shell (SSH) server, for secure access from remote machines
ii   openssh-sftp-server     1:8.4p1-5+deb11u5                   amd64  secure shell (SSH) sftp server module, for SFTP access from remote machines
ii   openssl                 1.1.1w-0+deb11u3                    amd64  Secure Sockets Layer toolkit - cryptographic utility
ii   passwd                  1:4.8.1-1+deb11u1                   amd64  change and administer password and group data
ii   perl                    5.32.1-4+deb11u4                    amd64  Larry Wall's Practical Extraction and Report Language
ii   perl-base               5.32.1-4+deb11u4                    amd64  minimal Perl system
ii   perl-modules-5.32       5.32.1-4+deb11u4                    all    Core Perl modules
ii   procps                  2:3.3.17-5                          amd64  /proc file system utilities
ii   python3                 3.9.2-3                             amd64  interactive high-level object-oriented language (default python3 version)
ii   python3-minimal         3.9.2-3                             amd64  minimal subset of the Python language (default python3 version)
ii   python3.9               3.9.2-1+deb11u3                     amd64  Interactive high-level object-oriented language (version 3.9)
ii   python3.9-minimal       3.9.2-1+deb11u3                     amd64  Minimal subset of the Python language (version 3.9)
ii   readline-common         8.1-1                               all    GNU readline and history libraries, common files
ii   rsyslog                 8.2102.0-2+deb11u1                  amd64  reliable system and kernel logging daemon
ii   runit-helper            2.10.3                              all    dh-runit implementation detail
ii   sed                     4.7-1                               amd64  GNU stream editor for filtering/transforming text
ii   sensible-utils          0.0.14                              all    Utilities for sensible alternative selection
ii   startpar                0.64-3                              amd64  run processes in parallel and multiplex their output
ii   sudo                    1.9.5p2-3+deb11u2                   amd64  Provide limited super user privileges to specific users
ii   sysv-rc                 2.96-7+deb11u1                      all    System-V-like runlevel change mechanism
ii   sysvinit-core           2.96-7+deb11u1                      amd64  System-V-like init
ii   sysvinit-utils          2.96-7+deb11u1                      amd64  System-V-like utilities
ii   tar                     1.34+dfsg-1+deb11u1                 amd64  GNU version of the tar archiving utility
ii   tree                    1.8.0-1+b1                          amd64  displays an indented directory tree, in color
ii   tzdata                  2025b-0+deb11u1                     all    time zone and daylight-saving time data
ii   ucf                     3.0043+deb11u2                      all    Update Configuration File(s): preserve user changes to config files
ii   unzip                   6.0-26+deb11u1                      amd64  De-archiver for .zip files
ii   util-linux              2.36.1-8+deb11u2                    amd64  miscellaneous system utilities
ii   vim-common              2:8.2.2434-3+deb11u3                all    Vi IMproved - Common files
ii   vim-tiny                2:8.2.2434-3+deb11u3                amd64  Vi IMproved - enhanced vi editor - compact version
ii   whiptail                0.52.21-4+b3                        amd64  Displays user-friendly dialog boxes from shell scripts
ii   xxd                     2:8.2.2434-3+deb11u3                amd64  tool to make (or reverse) a hex dump
ii   zlib1g                  1:1.2.11.dfsg-2+deb11u2             amd64  compression library - runtime
ii   zsh                     5.8-6+deb11u1                       amd64  shell with lots of features
ii   zsh-common              5.8-6+deb11u1                       all    architecture independent files for Zsh
ii   zstd                    1.4.8+dfsg-2.1                      amd64  fast lossless compression algorithm -- CLI tool
```
