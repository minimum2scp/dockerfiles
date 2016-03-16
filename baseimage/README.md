# about minimum2scp/baseimage image

 * based on [minimum2scp/debian](https://github.com/minimum2scp/dockerfiles/tree/master/debian) image
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
docker run -d -p 2222:22 minimum2scp/baseimage:latest
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
ii   adduser                 3.114                         all    add and remove users and groups                                                
ii   apt                     1.2.7                         amd64  commandline package manager                                                    
ii   base-files              9.6                           amd64  Debian base system miscellaneous files                                         
ii   base-passwd             3.5.39                        amd64  Debian base system master password and group files                             
ii   bash                    4.3-14+b1                     amd64  GNU Bourne Again SHell                                                         
ii   bsdmainutils            9.0.8                         amd64  collection of more utilities from FreeBSD                                      
ii   bsdutils                1:2.27.1-6                    amd64  basic utilities from 4.4BSD-Lite                                               
ii   ca-certificates         20160104                      all    Common CA certificates                                                         
ii   coreutils               8.25-2                        amd64  GNU core utilities                                                             
ii   cron                    3.0pl1-128                    amd64  process scheduling daemon                                                      
ii   curl                    7.47.0-1                      amd64  command line tool for transferring data with URL syntax                        
ii   dash                    0.5.8-2.1                     amd64  POSIX-compliant shell                                                          
ii   debconf                 1.5.59                        all    Debian configuration management system                                         
ii   debconf-i18n            1.5.59                        all    full internationalization support for debconf                                  
ii   debian-archive-keyring  2014.3                        all    GnuPG archive keys of the Debian archive                                       
ii   debianutils             4.7                           amd64  Miscellaneous utilities specific to Debian                                     
ii   diffutils               1:3.3-3                       amd64  File comparison utilities                                                      
ii   dmsetup                 2:1.02.116-1+b1               amd64  Linux Kernel Device Mapper userspace library                                   
ii   dpkg                    1.18.4                        amd64  Debian package management system                                               
ii   e2fslibs                1.42.13-1                     amd64  ext2/ext3/ext4 file system libraries                                           
ii   e2fsprogs               1.42.13-1                     amd64  ext2/ext3/ext4 file system utilities                                           
ii   etckeeper               1.18.2-1                      all    store /etc in git, mercurial, bzr or darcs                                     
ii   findutils               4.6.0+git+20160126-2          amd64  utilities for finding files--find, xargs                                       
ii   gcc-4.8-base            4.8.5-4                       amd64  GCC, the GNU Compiler Collection (base package)                                
ii   gcc-4.9-base            4.9.3-12                      amd64  GCC, the GNU Compiler Collection (base package)                                
ii   gcc-5-base              5.3.1-11                      amd64  GCC, the GNU Compiler Collection (base package)                                
ii   git                     1:2.7.0-1                     amd64  fast, scalable, distributed revision control system                            
ii   git-man                 1:2.7.0-1                     all    fast, scalable, distributed revision control system (manual pages)             
ii   gnupg                   1.4.20-4                      amd64  GNU privacy guard - a free PGP replacement                                     
ii   gpgv                    1.4.20-4                      amd64  GNU privacy guard - signature verification tool                                
ii   grep                    2.23-1                        amd64  GNU grep, egrep and fgrep                                                      
ii   groff-base              1.22.3-7                      amd64  GNU troff text-formatting system (base system components)                      
ii   gzip                    1.6-5                         amd64  GNU compression utilities                                                      
ii   hostname                3.17                          amd64  utility to set/show the host name or domain name                               
ii   inetutils-ping          2:1.9.4-1+b1                  amd64  ICMP echo tool                                                                 
ii   init                    1.29                          amd64  System-V-like init utilities - metapackage                                     
ii   init-system-helpers     1.29                          all    helper tools for all init systems                                              
ii   initscripts             2.88dsf-59.3                  amd64  scripts for initializing and shutting down the system                          
ii   insserv                 1.14.0-5.3                    amd64  boot sequence organizer using LSB init.d script dependency information         
ii   iproute2                4.3.0-1+b1                    amd64  networking and traffic control tools                                           
ii   libacl1                 2.2.52-3                      amd64  Access control list shared library                                             
ii   libapparmor1            2.10-3+b1                     amd64  changehat AppArmor library                                                     
ii   libapt-pkg5.0           1.2.7                         amd64  package management runtime library                                             
ii   libattr1                1:2.4.47-2                    amd64  Extended attribute shared library                                              
ii   libaudit-common         1:2.4.5-1                     all    Dynamic library for security auditing - common files                           
ii   libaudit1               1:2.4.5-1+b1                  amd64  Dynamic library for security auditing                                          
ii   libblkid1               2.27.1-6                      amd64  block device ID library                                                        
ii   libbsd0                 0.8.2-1                       amd64  utility functions from BSD systems - shared library                            
ii   libbz2-1.0              1.0.6-8                       amd64  high-quality block-sorting file compressor library - runtime                   
ii   libc-bin                2.22-3                        amd64  GNU C Library: Binaries                                                        
ii   libc-l10n               2.22-3                        all    GNU C Library: localization files                                              
ii   libc6                   2.22-3                        amd64  GNU C Library: Shared libraries                                                
ii   libcap2                 1:2.24-12                     amd64  POSIX 1003.1e capabilities (library)                                           
ii   libcap2-bin             1:2.24-12                     amd64  POSIX 1003.1e capabilities (utilities)                                         
ii   libcomerr2              1.42.13-1                     amd64  common error description library                                               
ii   libcryptsetup4          2:1.7.0-2                     amd64  disk encryption support - shared library                                       
ii   libcurl3-gnutls         7.47.0-1                      amd64  easy-to-use client-side URL transfer library (GnuTLS flavour)                  
ii   libdb5.3                5.3.28-11                     amd64  Berkeley v5.3 Database Libraries [runtime]                                     
ii   libdebconfclient0       0.207                         amd64  Debian Configuration Management System (C-implementation library)              
ii   libdevmapper1.02.1      2:1.02.116-1+b1               amd64  Linux Kernel Device Mapper userspace library                                   
ii   libedit2                3.1-20150325-1+b1             amd64  BSD editline and history libraries                                             
ii   liberror-perl           0.17-1.2                      all    Perl module for error/exception handling in an OO-ish way                      
ii   libestr0                0.1.10-1                      amd64  Helper functions for handling strings (lib)                                    
ii   libexpat1               2.1.1-1                       amd64  XML parsing C library - runtime library                                        
ii   libfdisk1               2.27.1-6                      amd64  fdisk partitioning library                                                     
ii   libffi6                 3.2.1-4                       amd64  Foreign Function Interface library runtime                                     
ii   libgcc1                 1:5.3.1-11                    amd64  GCC support library                                                            
ii   libgcrypt20             1.6.5-2                       amd64  LGPL Crypto library - runtime library                                          
ii   libgdbm3                1.8.3-13.1                    amd64  GNU dbm database routines (runtime version)                                    
ii   libgmp10                2:6.1.0+dfsg-2                amd64  Multiprecision arithmetic library                                              
ii   libgnutls30             3.4.9-2                       amd64  GNU TLS library - main runtime library                                         
ii   libgpg-error0           1.21-2                        amd64  library for common error values and messages in GnuPG components               
ii   libgssapi-krb5-2        1.13.2+dfsg-5                 amd64  MIT Kerberos runtime libraries - krb5 GSS-API Mechanism                        
ii   libhogweed4             3.2-1                         amd64  low level cryptographic library (public-key cryptos)                           
ii   libidn11                1.32-3                        amd64  GNU Libidn library, implementation of IETF IDN specifications                  
ii   libjson-c2              0.11-4                        amd64  JSON manipulation library - shared library                                     
ii   libk5crypto3            1.13.2+dfsg-5                 amd64  MIT Kerberos runtime libraries - Crypto Library                                
ii   libkeyutils1            1.5.9-8                       amd64  Linux Key Management Utilities (library)                                       
ii   libkmod2                22-1                          amd64  libkmod shared library                                                         
ii   libkrb5-3               1.13.2+dfsg-5                 amd64  MIT Kerberos runtime libraries                                                 
ii   libkrb5support0         1.13.2+dfsg-5                 amd64  MIT Kerberos runtime libraries - Support library                               
ii   libldap-2.4-2           2.4.42+dfsg-2+b2              amd64  OpenLDAP libraries                                                             
ii   liblocale-gettext-perl  1.07-1+b1                     amd64  module using libc functions for internationalization in Perl                   
ii   liblogging-stdlog0      1.0.5-2                       amd64  easy to use and lightweight logging library                                    
ii   liblognorm2             1.1.2-1.1                     amd64  Log normalizing library                                                        
ii   liblz4-1                0.0~r131-2                    amd64  Fast LZ compression algorithm library - runtime                                
ii   liblzma5                5.1.1alpha+20120614-2.1       amd64  XZ-format compression library                                                  
ii   libmount1               2.27.1-6                      amd64  device mounting library                                                        
ii   libncurses5             6.0+20160213-1                amd64  shared libraries for terminal handling                                         
ii   libncursesw5            6.0+20160213-1                amd64  shared libraries for terminal handling (wide character support)                
ii   libnettle6              3.2-1                         amd64  low level cryptographic library (symmetric and one-way cryptos)                
ii   libnewt0.52             0.52.18-3                     amd64  Not Erik's Windowing Toolkit - text mode windowing with slang                  
ii   libnghttp2-14           1.8.0-1                       amd64  library implementing HTTP/2 protocol (shared library)                          
ii   libp11-kit0             0.23.2-3                      amd64  Library for loading and coordinating access to PKCS#11 modules - runtime       
ii   libpam-modules          1.1.8-3.2                     amd64  Pluggable Authentication Modules for PAM                                       
ii   libpam-modules-bin      1.1.8-3.2                     amd64  Pluggable Authentication Modules for PAM - helper binaries                     
ii   libpam-runtime          1.1.8-3.2                     all    Runtime support for the PAM library                                            
ii   libpam0g                1.1.8-3.2                     amd64  Pluggable Authentication Modules library                                       
ii   libpcre3                2:8.38-3                      amd64  Perl 5 Compatible Regular Expression Library - runtime files                   
ii   libperl5.22             5.22.1-9                      amd64  shared Perl library                                                            
ii   libpipeline1            1.4.1-2                       amd64  pipeline manipulation library                                                  
ii   libpopt0                1.16-10                       amd64  lib for parsing cmdline parameters                                             
ii   libprocps5              2:3.3.11-3                    amd64  library for accessing process information from /proc                           
ii   libpython-stdlib        2.7.11-1                      amd64  interactive high-level object-oriented language (default python version)       
ii   libpython2.7-minimal    2.7.11-4                      amd64  Minimal subset of the Python language (version 2.7)                            
ii   libpython2.7-stdlib     2.7.11-4                      amd64  Interactive high-level object-oriented language (standard library, version 2.7)
ii   libreadline6            6.3-8+b4                      amd64  GNU readline and history libraries, run-time libraries                         
ii   librtmp1                2.4+20151223.gitfa8646d-1+b1  amd64  toolkit for RTMP streams (shared library)                                      
ii   libsasl2-2              2.1.26.dfsg1-14+b1            amd64  Cyrus SASL - authentication abstraction library                                
ii   libsasl2-modules-db     2.1.26.dfsg1-14+b1            amd64  Cyrus SASL - pluggable authentication modules (DB)                             
ii   libseccomp2             2.2.3-3                       amd64  high level interface to Linux seccomp filter                                   
ii   libselinux1             2.4-3+b1                      amd64  SELinux runtime shared libraries                                               
ii   libsemanage-common      2.4-3                         all    Common files for SELinux policy management libraries                           
ii   libsemanage1            2.4-3+b1                      amd64  SELinux policy management library                                              
ii   libsepol1               2.4-2                         amd64  SELinux library for manipulating binary security policies                      
ii   libslang2               2.3.0-2+b1                    amd64  S-Lang programming library - runtime version                                   
ii   libsmartcols1           2.27.1-6                      amd64  smart column output alignment library                                          
ii   libsqlite3-0            3.11.1-1                      amd64  SQLite 3 shared library                                                        
ii   libss2                  1.42.13-1                     amd64  command-line interface parsing library                                         
ii   libssh2-1               1.5.0-2.1                     amd64  SSH2 client-side library                                                       
ii   libssl1.0.2             1.0.2g-1                      amd64  Secure Sockets Layer toolkit - shared libraries                                
ii   libstdc++6              5.3.1-11                      amd64  GNU Standard C++ Library v3                                                    
ii   libsystemd0             229-2                         amd64  systemd utility library                                                        
ii   libtasn1-6              4.7-3                         amd64  Manage ASN.1 structures (runtime)                                              
ii   libtext-charwidth-perl  0.04-7+b4                     amd64  get display widths of characters on the terminal                               
ii   libtext-iconv-perl      1.7-5+b3                      amd64  converts between character sets in Perl                                        
ii   libtext-wrapi18n-perl   0.06-7.1                      all    internationalized substitute of Text::Wrap                                     
ii   libtinfo5               6.0+20160213-1                amd64  shared low-level terminfo library for terminal handling                        
ii   libudev1                229-2                         amd64  libudev shared library                                                         
ii   libusb-0.1-4            2:0.1.12-28                   amd64  userspace USB programming library                                              
ii   libustr-1.0-1           1.0.4-5                       amd64  Micro string library: shared library                                           
ii   libuuid1                2.27.1-6                      amd64  Universally Unique ID library                                                  
ii   libwrap0                7.6.q-25                      amd64  Wietse Venema's TCP wrappers library                                           
ii   localepurge             0.7.3.4                       all    reclaim disk space by removing unneeded localizations                          
ii   locales                 2.22-3                        all    GNU C Library: National Language (locale) data [support]                       
ii   login                   1:4.2-3.1                     amd64  system login tools                                                             
ii   lsb-base                9.20160110                    all    Linux Standard Base init script functionality                                  
ii   lv                      4.51-2.3+b1                   amd64  Powerful Multilingual File Viewer                                              
ii   man-db                  2.7.5-1                       amd64  on-line manual pager                                                           
ii   mawk                    1.3.3-17                      amd64  a pattern scanning and text processing language                                
ii   mime-support            3.59                          all    MIME files 'mime.types' & 'mailcap', and support programs                      
ii   mount                   2.27.1-6                      amd64  tools for mounting and manipulating filesystems                                
ii   multiarch-support       2.22-3                        amd64  Transitional package to ensure multiarch compatibility                         
ii   ncurses-base            6.0+20160213-1                all    basic terminal type definitions                                                
ii   ncurses-bin             6.0+20160213-1                amd64  terminal-related programs and man pages                                        
ii   net-tools               1.60+git20150829.73cef8a-2    amd64  NET-3 networking toolkit                                                       
ii   netbase                 5.3                           all    Basic TCP/IP networking system                                                 
ii   openssh-client          1:7.2p2-1                     amd64  secure shell (SSH) client, for secure access to remote machines                
ii   openssh-server          1:7.2p2-1                     amd64  secure shell (SSH) server, for secure access from remote machines              
ii   openssh-sftp-server     1:7.2p2-1                     amd64  secure shell (SSH) sftp server module, for SFTP access from remote machines    
ii   openssl                 1.0.2g-1                      amd64  Secure Sockets Layer toolkit - cryptographic utility                           
ii   passwd                  1:4.2-3.1                     amd64  change and administer password and group data                                  
ii   perl                    5.22.1-9                      amd64  Larry Wall's Practical Extraction and Report Language                          
ii   perl-base               5.22.1-9                      amd64  minimal Perl system                                                            
ii   perl-modules-5.22       5.22.1-9                      all    Core Perl modules                                                              
ii   procps                  2:3.3.11-3                    amd64  /proc file system utilities                                                    
ii   python                  2.7.11-1                      amd64  interactive high-level object-oriented language (default version)              
ii   python-minimal          2.7.11-1                      amd64  minimal subset of the Python language (default version)                        
ii   python2.7               2.7.11-4                      amd64  Interactive high-level object-oriented language (version 2.7)                  
ii   python2.7-minimal       2.7.11-4                      amd64  Minimal subset of the Python language (version 2.7)                            
ii   readline-common         6.3-8                         all    GNU readline and history libraries, common files                               
ii   rsyslog                 8.16.0-1+b1                   amd64  reliable system and kernel logging daemon                                      
ii   sed                     4.2.2-7.1                     amd64  The GNU sed stream editor                                                      
ii   sensible-utils          0.0.9                         all    Utilities for sensible alternative selection                                   
ii   startpar                0.59-3                        amd64  run processes in parallel and multiplex their output                           
ii   sudo                    1.8.15-1.1                    amd64  Provide limited super user privileges to specific users                        
ii   sysv-rc                 2.88dsf-59.3                  all    System-V-like runlevel change mechanism                                        
ii   sysvinit-core           2.88dsf-59.3                  amd64  System-V-like init utilities                                                   
ii   sysvinit-utils          2.88dsf-59.3                  amd64  System-V-like utilities                                                        
ii   tar                     1.28-2.1                      amd64  GNU version of the tar archiving utility                                       
ii   tzdata                  2016b-1                       all    time zone and daylight-saving time data                                        
ii   ucf                     3.0035                        all    Update Configuration File(s): preserve user changes to config files            
ii   unzip                   6.0-20                        amd64  De-archiver for .zip files                                                     
ii   util-linux              2.27.1-6                      amd64  miscellaneous system utilities                                                 
ii   vim-common              2:7.4.963-1+b2                amd64  Vi IMproved - Common files                                                     
ii   vim-tiny                2:7.4.963-1+b2                amd64  Vi IMproved - enhanced vi editor - compact version                             
ii   whiptail                0.52.18-3                     amd64  Displays user-friendly dialog boxes from shell scripts                         
ii   zlib1g                  1:1.2.8.dfsg-2+b1             amd64  compression library - runtime                                                  
ii   zsh                     5.2-3                         amd64  shell with lots of features                                                    
ii   zsh-common              5.2-3                         all    architecture independent files for Zsh                                         
```
