# about minimum2scp/baseimage-jessie image

 * based on [minimum2scp/debian-jessie](https://github.com/minimum2scp/dockerfiles/tree/master/debian-jessie) image
 * Runs [/opt/init-wrapper/sbin/init](https://github.com/minimum2scp/dockerfiles/blob/master/baseimage-jessie/build/opt/init-wrapper/sbin/init) by default
   * /opt/init-wrapper/sbin/init invokes all scripts in /opt/init-wrapper/pre-init.d (using run-parts), and exec /sbin/init
   * /sbin/init is replaced by sysvinit-core package
   * /sbin/init invokes sshd, rsyslogd, cron daemons
   * /etc/rc.local invokes all scripts in /opt/init-wrapper/post-init.d (using run-parts)
 * ja_JP.UTF-8 locale supported. (default locale is C)
 * timezone is Asia/Tokyo
 * etckeeper installed

## start container

```
docker run -d -p 2222:22 minimum2scp/baseimage-jessie:latest
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
ii   acl                     2.2.52-2                   amd64  Access control list utilities                                              
ii   adduser                 3.113+nmu3                 all    add and remove users and groups                                            
ii   apt                     1.0.9.8.3                  amd64  commandline package manager                                                
ii   base-files              8+deb8u4                   amd64  Debian base system miscellaneous files                                     
ii   base-passwd             3.5.37                     amd64  Debian base system master password and group files                         
ii   bash                    4.3-11+b1                  amd64  GNU Bourne Again SHell                                                     
ii   bsdmainutils            9.0.6                      amd64  collection of more utilities from FreeBSD                                  
ii   bsdutils                1:2.25.2-6                 amd64  basic utilities from 4.4BSD-Lite                                           
ii   ca-certificates         20141019+deb8u1            all    Common CA certificates                                                     
ii   coreutils               8.23-4                     amd64  GNU core utilities                                                         
ii   cron                    3.0pl1-127+deb8u1          amd64  process scheduling daemon                                                  
ii   curl                    7.38.0-4+deb8u3            amd64  command line tool for transferring data with URL syntax                    
ii   dash                    0.5.7-4+b1                 amd64  POSIX-compliant shell                                                      
ii   debconf                 1.5.56                     all    Debian configuration management system                                     
ii   debconf-i18n            1.5.56                     all    full internationalization support for debconf                              
ii   debian-archive-keyring  2014.3                     all    GnuPG archive keys of the Debian archive                                   
ii   debianutils             4.4+b1                     amd64  Miscellaneous utilities specific to Debian                                 
ii   diffutils               1:3.3-1+b1                 amd64  File comparison utilities                                                  
ii   dmsetup                 2:1.02.90-2.2              amd64  Linux Kernel Device Mapper userspace library                               
ii   dpkg                    1.17.26                    amd64  Debian package management system                                           
ii   e2fslibs                1.42.12-1.1                amd64  ext2/ext3/ext4 file system libraries                                       
ii   e2fsprogs               1.42.12-1.1                amd64  ext2/ext3/ext4 file system utilities                                       
ii   etckeeper               1.15                       all    store /etc in git, mercurial, bzr or darcs                                 
ii   findutils               4.4.2-9+b1                 amd64  utilities for finding files--find, xargs                                   
ii   gcc-4.8-base            4.8.4-1                    amd64  GCC, the GNU Compiler Collection (base package)                            
ii   gcc-4.9-base            4.9.2-10                   amd64  GCC, the GNU Compiler Collection (base package)                            
ii   git                     1:2.1.4-2.1+deb8u2         amd64  fast, scalable, distributed revision control system                        
ii   git-man                 1:2.1.4-2.1+deb8u2         all    fast, scalable, distributed revision control system (manual pages)         
ii   gnupg                   1.4.18-7+deb8u1            amd64  GNU privacy guard - a free PGP replacement                                 
ii   gpgv                    1.4.18-7+deb8u1            amd64  GNU privacy guard - signature verification tool                            
ii   grep                    2.20-4.1                   amd64  GNU grep, egrep and fgrep                                                  
ii   groff-base              1.22.2-8                   amd64  GNU troff text-formatting system (base system components)                  
ii   gzip                    1.6-4                      amd64  GNU compression utilities                                                  
ii   hostname                3.15                       amd64  utility to set/show the host name or domain name                           
ii   inetutils-ping          2:1.9.2.39.3a460-3         amd64  ICMP echo tool                                                             
ii   init                    1.22                       amd64  System-V-like init utilities - metapackage                                 
ii   init-system-helpers     1.22                       all    helper tools for all init systems                                          
ii   initscripts             2.88dsf-59                 amd64  scripts for initializing and shutting down the system                      
ii   insserv                 1.14.0-5                   amd64  boot sequence organizer using LSB init.d script dependency information     
ii   iproute2                3.16.0-2                   amd64  networking and traffic control tools                                       
ii   libacl1                 2.2.52-2                   amd64  Access control list shared library                                         
ii   libapt-pkg4.12          1.0.9.8.3                  amd64  package management runtime library                                         
ii   libattr1                1:2.4.47-2                 amd64  Extended attribute shared library                                          
ii   libaudit-common         1:2.4-1                    all    Dynamic library for security auditing - common files                       
ii   libaudit1               1:2.4-1+b1                 amd64  Dynamic library for security auditing                                      
ii   libblkid1               2.25.2-6                   amd64  block device id library                                                    
ii   libbsd0                 0.7.0-2                    amd64  utility functions from BSD systems - shared library                        
ii   libbz2-1.0              1.0.6-7+b3                 amd64  high-quality block-sorting file compressor library - runtime               
ii   libc-bin                2.19-18+deb8u4             amd64  GNU C Library: Binaries                                                    
ii   libc6                   2.19-18+deb8u4             amd64  GNU C Library: Shared libraries                                            
ii   libcap2                 1:2.24-8                   amd64  POSIX 1003.1e capabilities (library)                                       
ii   libcap2-bin             1:2.24-8                   amd64  POSIX 1003.1e capabilities (utilities)                                     
ii   libcomerr2              1.42.12-1.1                amd64  common error description library                                           
ii   libcryptsetup4          2:1.6.6-5                  amd64  disk encryption support - shared library                                   
ii   libcurl3                7.38.0-4+deb8u3            amd64  easy-to-use client-side URL transfer library (OpenSSL flavour)             
ii   libcurl3-gnutls         7.38.0-4+deb8u3            amd64  easy-to-use client-side URL transfer library (GnuTLS flavour)              
ii   libdb5.3                5.3.28-9                   amd64  Berkeley v5.3 Database Libraries [runtime]                                 
ii   libdebconfclient0       0.192                      amd64  Debian Configuration Management System (C-implementation library)          
ii   libdevmapper1.02.1      2:1.02.90-2.2              amd64  Linux Kernel Device Mapper userspace library                               
ii   libedit2                3.1-20140620-2             amd64  BSD editline and history libraries                                         
ii   liberror-perl           0.17-1.1                   all    Perl module for error/exception handling in an OO-ish way                  
ii   libestr0                0.1.9-1.1                  amd64  Helper functions for handling strings (lib)                                
ii   libexpat1               2.1.0-6+deb8u2             amd64  XML parsing C library - runtime library                                    
ii   libffi6                 3.1-2+b2                   amd64  Foreign Function Interface library runtime                                 
ii   libgcc1                 1:4.9.2-10                 amd64  GCC support library                                                        
ii   libgcrypt20             1.6.3-2+deb8u1             amd64  LGPL Crypto library - runtime library                                      
ii   libgdbm3                1.8.3-13.1                 amd64  GNU dbm database routines (runtime version)                                
ii   libgmp10                2:6.0.0+dfsg-6             amd64  Multiprecision arithmetic library                                          
ii   libgnutls-deb0-28       3.3.8-6+deb8u3             amd64  GNU TLS library - main runtime library                                     
ii   libgpg-error0           1.17-3                     amd64  library for common error values and messages in GnuPG components           
ii   libgssapi-krb5-2        1.12.1+dfsg-19+deb8u2      amd64  MIT Kerberos runtime libraries - krb5 GSS-API Mechanism                    
ii   libhogweed2             2.7.1-5+deb8u1             amd64  low level cryptographic library (public-key cryptos)                       
ii   libidn11                1.29-1+deb8u1              amd64  GNU Libidn library, implementation of IETF IDN specifications              
ii   libjson-c2              0.11-4                     amd64  JSON manipulation library - shared library                                 
ii   libk5crypto3            1.12.1+dfsg-19+deb8u2      amd64  MIT Kerberos runtime libraries - Crypto Library                            
ii   libkeyutils1            1.5.9-5+b1                 amd64  Linux Key Management Utilities (library)                                   
ii   libkmod2                18-3                       amd64  libkmod shared library                                                     
ii   libkrb5-3               1.12.1+dfsg-19+deb8u2      amd64  MIT Kerberos runtime libraries                                             
ii   libkrb5support0         1.12.1+dfsg-19+deb8u2      amd64  MIT Kerberos runtime libraries - Support library                           
ii   libldap-2.4-2           2.4.40+dfsg-1+deb8u2       amd64  OpenLDAP libraries                                                         
ii   liblocale-gettext-perl  1.05-8+b1                  amd64  module using libc functions for internationalization in Perl               
ii   liblogging-stdlog0      1.0.4-1                    amd64  easy to use and lightweight logging library                                
ii   liblognorm1             1.0.1-3                    amd64  Log normalizing library                                                    
ii   liblzma5                5.1.1alpha+20120614-2+b3   amd64  XZ-format compression library                                              
ii   libmount1               2.25.2-6                   amd64  device mounting library                                                    
ii   libncurses5             5.9+20140913-1+b1          amd64  shared libraries for terminal handling                                     
ii   libncursesw5            5.9+20140913-1+b1          amd64  shared libraries for terminal handling (wide character support)            
ii   libnettle4              2.7.1-5+deb8u1             amd64  low level cryptographic library (symmetric and one-way cryptos)            
ii   libnewt0.52             0.52.17-1+b1               amd64  Not Erik's Windowing Toolkit - text mode windowing with slang              
ii   libp11-kit0             0.20.7-1                   amd64  Library for loading and coordinating access to PKCS#11 modules - runtime   
ii   libpam-modules          1.1.8-3.1+deb8u1+b1        amd64  Pluggable Authentication Modules for PAM                                   
ii   libpam-modules-bin      1.1.8-3.1+deb8u1+b1        amd64  Pluggable Authentication Modules for PAM - helper binaries                 
ii   libpam-runtime          1.1.8-3.1+deb8u1           all    Runtime support for the PAM library                                        
ii   libpam0g                1.1.8-3.1+deb8u1+b1        amd64  Pluggable Authentication Modules library                                   
ii   libpcre3                2:8.35-3.3+deb8u4          amd64  Perl 5 Compatible Regular Expression Library - runtime files               
ii   libpipeline1            1.4.0-1                    amd64  pipeline manipulation library                                              
ii   libpopt0                1.16-10                    amd64  lib for parsing cmdline parameters                                         
ii   libprocps3              2:3.3.9-9                  amd64  library for accessing process information from /proc                       
ii   libreadline6            6.3-8+b3                   amd64  GNU readline and history libraries, run-time libraries                     
ii   librtmp1                2.4+20150115.gita107cef-1  amd64  toolkit for RTMP streams (shared library)                                  
ii   libsasl2-2              2.1.26.dfsg1-13+deb8u1     amd64  Cyrus SASL - authentication abstraction library                            
ii   libsasl2-modules-db     2.1.26.dfsg1-13+deb8u1     amd64  Cyrus SASL - pluggable authentication modules (DB)                         
ii   libselinux1             2.3-2                      amd64  SELinux runtime shared libraries                                           
ii   libsemanage-common      2.3-1                      all    Common files for SELinux policy management libraries                       
ii   libsemanage1            2.3-1+b1                   amd64  SELinux policy management library                                          
ii   libsepol1               2.3-2                      amd64  SELinux library for manipulating binary security policies                  
ii   libslang2               2.3.0-2                    amd64  S-Lang programming library - runtime version                               
ii   libsmartcols1           2.25.2-6                   amd64  smart column output alignment library                                      
ii   libss2                  1.42.12-1.1                amd64  command-line interface parsing library                                     
ii   libssh2-1               1.4.3-4.1+deb8u1           amd64  SSH2 client-side library                                                   
ii   libssl1.0.0             1.0.1k-3+deb8u5            amd64  Secure Sockets Layer toolkit - shared libraries                            
ii   libstdc++6              4.9.2-10                   amd64  GNU Standard C++ Library v3                                                
ii   libsystemd0             215-17+deb8u4              amd64  systemd utility library                                                    
ii   libtasn1-6              4.2-3+deb8u2               amd64  Manage ASN.1 structures (runtime)                                          
ii   libtext-charwidth-perl  0.04-7+b3                  amd64  get display widths of characters on the terminal                           
ii   libtext-iconv-perl      1.7-5+b2                   amd64  converts between character sets in Perl                                    
ii   libtext-wrapi18n-perl   0.06-7                     all    internationalized substitute of Text::Wrap                                 
ii   libtinfo5               5.9+20140913-1+b1          amd64  shared low-level terminfo library for terminal handling                    
ii   libudev1                215-17+deb8u4              amd64  libudev shared library                                                     
ii   libusb-0.1-4            2:0.1.12-25                amd64  userspace USB programming library                                          
ii   libustr-1.0-1           1.0.4-3+b2                 amd64  Micro string library: shared library                                       
ii   libuuid1                2.25.2-6                   amd64  Universally Unique ID library                                              
ii   libwrap0                7.6.q-25                   amd64  Wietse Venema's TCP wrappers library                                       
ii   localepurge             0.7.3.4                    all    reclaim disk space by removing unneeded localizations                      
ii   locales                 2.19-18+deb8u4             all    GNU C Library: National Language (locale) data [support]                   
ii   login                   1:4.2-3+deb8u1             amd64  system login tools                                                         
ii   lsb-base                4.1+Debian13+nmu1          all    Linux Standard Base 4.1 init script functionality                          
ii   lv                      4.51-2.2                   amd64  Powerful Multilingual File Viewer                                          
ii   man-db                  2.7.0.2-5                  amd64  on-line manual pager                                                       
ii   mawk                    1.3.3-17                   amd64  a pattern scanning and text processing language                            
ii   mount                   2.25.2-6                   amd64  Tools for mounting and manipulating filesystems                            
ii   multiarch-support       2.19-18+deb8u4             amd64  Transitional package to ensure multiarch compatibility                     
ii   ncurses-base            5.9+20140913-1             all    basic terminal type definitions                                            
ii   ncurses-bin             5.9+20140913-1+b1          amd64  terminal-related programs and man pages                                    
ii   net-tools               1.60-26+b1                 amd64  NET-3 networking toolkit                                                   
ii   netbase                 5.3                        all    Basic TCP/IP networking system                                             
ii   openssh-client          1:6.7p1-5+deb8u2           amd64  secure shell (SSH) client, for secure access to remote machines            
ii   openssh-server          1:6.7p1-5+deb8u2           amd64  secure shell (SSH) server, for secure access from remote machines          
ii   openssh-sftp-server     1:6.7p1-5+deb8u2           amd64  secure shell (SSH) sftp server module, for SFTP access from remote machines
ii   openssl                 1.0.1k-3+deb8u5            amd64  Secure Sockets Layer toolkit - cryptographic utility                       
ii   passwd                  1:4.2-3+deb8u1             amd64  change and administer password and group data                              
ii   perl                    5.20.2-3+deb8u4            amd64  Larry Wall's Practical Extraction and Report Language                      
ii   perl-base               5.20.2-3+deb8u4            amd64  minimal Perl system                                                        
ii   perl-modules            5.20.2-3+deb8u4            all    Core Perl modules                                                          
ii   procps                  2:3.3.9-9                  amd64  /proc file system utilities                                                
ii   readline-common         6.3-8                      all    GNU readline and history libraries, common files                           
ii   rsyslog                 8.4.2-1+deb8u2             amd64  reliable system and kernel logging daemon                                  
ii   sed                     4.2.2-4+b1                 amd64  The GNU sed stream editor                                                  
ii   sensible-utils          0.0.9                      all    Utilities for sensible alternative selection                               
ii   startpar                0.59-3                     amd64  run processes in parallel and multiplex their output                       
ii   sudo                    1.8.10p3-1+deb8u3          amd64  Provide limited super user privileges to specific users                    
ii   sysv-rc                 2.88dsf-59                 all    System-V-like runlevel change mechanism                                    
ii   sysvinit-core           2.88dsf-59                 amd64  System-V-like init utilities                                               
ii   sysvinit-utils          2.88dsf-59                 amd64  System-V-like utilities                                                    
ii   tar                     1.27.1-2+b1                amd64  GNU version of the tar archiving utility                                   
ii   tzdata                  2016d-0+deb8u1             all    time zone and daylight-saving time data                                    
ii   ucf                     3.0030                     all    Update Configuration File(s): preserve user changes to config files        
ii   udev                    215-17+deb8u4              amd64  /dev/ and hotplug management daemon                                        
ii   unzip                   6.0-16+deb8u2              amd64  De-archiver for .zip files                                                 
ii   util-linux              2.25.2-6                   amd64  Miscellaneous system utilities                                             
ii   vim-common              2:7.4.488-7                amd64  Vi IMproved - Common files                                                 
ii   vim-tiny                2:7.4.488-7                amd64  Vi IMproved - enhanced vi editor - compact version                         
ii   whiptail                0.52.17-1+b1               amd64  Displays user-friendly dialog boxes from shell scripts                     
ii   zlib1g                  1:1.2.8.dfsg-2+b1          amd64  compression library - runtime                                              
ii   zsh                     5.0.7-5                    amd64  shell with lots of features                                                
ii   zsh-common              5.0.7-5                    all    architecture independent files for Zsh                                     
```
