# about minimum2scp/debian image

 * Debian sid amd64, this image follows updates of debian sid, almost every day.
 * Almost same as debian:sid image ([semi official debian image](https://registry.hub.docker.com/_/debian/))

## build minimum2scp/debian image

Run following commands on your Debian (requires debootstrap)

```
$ git clone https://github.com/minimum2scp/dockerfiles.git
$ cd dockerfiles/debian
$ rake mkimage TAG=minimum2scp/debian:latest
```

## packages

installed packages:

```
ii   adduser                 3.113+nmu3               all    add and remove users and groups                                       
ii   apt                     1.2.3                    amd64  commandline package manager                                           
ii   base-files              9.5                      amd64  Debian base system miscellaneous files                                
ii   base-passwd             3.5.39                   amd64  Debian base system master password and group files                    
ii   bash                    4.3-14+b1                amd64  GNU Bourne Again SHell                                                
ii   bsdutils                1:2.27.1-3               amd64  basic utilities from 4.4BSD-Lite                                      
ii   coreutils               8.25-2                   amd64  GNU core utilities                                                    
ii   dash                    0.5.8-2.1                amd64  POSIX-compliant shell                                                 
ii   debconf                 1.5.58                   all    Debian configuration management system                                
ii   debconf-i18n            1.5.58                   all    full internationalization support for debconf                         
ii   debian-archive-keyring  2014.3                   all    GnuPG archive keys of the Debian archive                              
ii   debianutils             4.7                      amd64  Miscellaneous utilities specific to Debian                            
ii   diffutils               1:3.3-3                  amd64  File comparison utilities                                             
ii   dmsetup                 2:1.02.116-1             amd64  Linux Kernel Device Mapper userspace library                          
ii   dpkg                    1.18.4                   amd64  Debian package management system                                      
ii   e2fslibs                1.42.13-1                amd64  ext2/ext3/ext4 file system libraries                                  
ii   e2fsprogs               1.42.13-1                amd64  ext2/ext3/ext4 file system utilities                                  
ii   findutils               4.6.0+git+20160126-2     amd64  utilities for finding files--find, xargs                              
ii   gcc-4.8-base            4.8.5-4                  amd64  GCC, the GNU Compiler Collection (base package)                       
ii   gcc-4.9-base            4.9.3-12                 amd64  GCC, the GNU Compiler Collection (base package)                       
ii   gcc-5-base              5.3.1-9                  amd64  GCC, the GNU Compiler Collection (base package)                       
ii   gnupg                   1.4.20-4                 amd64  GNU privacy guard - a free PGP replacement                            
ii   gpgv                    1.4.20-4                 amd64  GNU privacy guard - signature verification tool                       
ii   grep                    2.23-1                   amd64  GNU grep, egrep and fgrep                                             
ii   gzip                    1.6-4                    amd64  GNU compression utilities                                             
ii   hostname                3.17                     amd64  utility to set/show the host name or domain name                      
ii   inetutils-ping          2:1.9.4-1+b1             amd64  ICMP echo tool                                                        
ii   init                    1.28                     amd64  System-V-like init utilities - metapackage                            
ii   init-system-helpers     1.28                     all    helper tools for all init systems                                     
ii   initscripts             2.88dsf-59.3             amd64  scripts for initializing and shutting down the system                 
ii   insserv                 1.14.0-5.2               amd64  boot sequence organizer using LSB init.d script dependency information
ii   iproute2                4.3.0-1                  amd64  networking and traffic control tools                                  
ii   libacl1                 2.2.52-3                 amd64  Access control list shared library                                    
ii   libapparmor1            2.10-3                   amd64  changehat AppArmor library                                            
ii   libapt-pkg5.0           1.2.3                    amd64  package management runtime library                                    
ii   libattr1                1:2.4.47-2               amd64  Extended attribute shared library                                     
ii   libaudit-common         1:2.4.5-1                all    Dynamic library for security auditing - common files                  
ii   libaudit1               1:2.4.5-1                amd64  Dynamic library for security auditing                                 
ii   libblkid1               2.27.1-3                 amd64  block device ID library                                               
ii   libbz2-1.0              1.0.6-8                  amd64  high-quality block-sorting file compressor library - runtime          
ii   libc-bin                2.21-9                   amd64  GNU C Library: Binaries                                               
ii   libc6                   2.21-9                   amd64  GNU C Library: Shared libraries                                       
ii   libcap2                 1:2.24-12                amd64  POSIX 1003.1e capabilities (library)                                  
ii   libcap2-bin             1:2.24-12                amd64  POSIX 1003.1e capabilities (utilities)                                
ii   libcomerr2              1.42.13-1                amd64  common error description library                                      
ii   libcryptsetup4          2:1.7.0-2                amd64  disk encryption support - shared library                              
ii   libdb5.3                5.3.28-11                amd64  Berkeley v5.3 Database Libraries [runtime]                            
ii   libdebconfclient0       0.205                    amd64  Debian Configuration Management System (C-implementation library)     
ii   libdevmapper1.02.1      2:1.02.116-1             amd64  Linux Kernel Device Mapper userspace library                          
ii   libfdisk1               2.27.1-3                 amd64  fdisk partitioning library                                            
ii   libgcc1                 1:5.3.1-9                amd64  GCC support library                                                   
ii   libgcrypt20             1.6.5-2                  amd64  LGPL Crypto library - runtime library                                 
ii   libgpg-error0           1.21-2                   amd64  library for common error values and messages in GnuPG components      
ii   libkmod2                22-1                     amd64  libkmod shared library                                                
ii   liblocale-gettext-perl  1.07-1+b1                amd64  module using libc functions for internationalization in Perl          
ii   liblz4-1                0.0~r131-2               amd64  Fast LZ compression algorithm library - runtime                       
ii   liblzma5                5.1.1alpha+20120614-2.1  amd64  XZ-format compression library                                         
ii   libmount1               2.27.1-3                 amd64  device mounting library                                               
ii   libncurses5             6.0+20160213-1           amd64  shared libraries for terminal handling                                
ii   libncursesw5            6.0+20160213-1           amd64  shared libraries for terminal handling (wide character support)       
ii   libpam-modules          1.1.8-3.2                amd64  Pluggable Authentication Modules for PAM                              
ii   libpam-modules-bin      1.1.8-3.2                amd64  Pluggable Authentication Modules for PAM - helper binaries            
ii   libpam-runtime          1.1.8-3.2                all    Runtime support for the PAM library                                   
ii   libpam0g                1.1.8-3.2                amd64  Pluggable Authentication Modules library                              
ii   libpcre3                2:8.38-1                 amd64  Perl 5 Compatible Regular Expression Library - runtime files          
ii   libreadline6            6.3-8+b4                 amd64  GNU readline and history libraries, run-time libraries                
ii   libseccomp2             2.2.3-3                  amd64  high level interface to Linux seccomp filter                          
ii   libselinux1             2.4-3                    amd64  SELinux runtime shared libraries                                      
ii   libsemanage-common      2.4-3                    all    Common files for SELinux policy management libraries                  
ii   libsemanage1            2.4-3                    amd64  SELinux policy management library                                     
ii   libsepol1               2.4-2                    amd64  SELinux library for manipulating binary security policies             
ii   libsmartcols1           2.27.1-3                 amd64  smart column output alignment library                                 
ii   libss2                  1.42.13-1                amd64  command-line interface parsing library                                
ii   libstdc++6              5.3.1-9                  amd64  GNU Standard C++ Library v3                                           
ii   libsystemd0             229-1                    amd64  systemd utility library                                               
ii   libtext-charwidth-perl  0.04-7+b4                amd64  get display widths of characters on the terminal                      
ii   libtext-iconv-perl      1.7-5+b3                 amd64  converts between character sets in Perl                               
ii   libtext-wrapi18n-perl   0.06-7.1                 all    internationalized substitute of Text::Wrap                            
ii   libtinfo5               6.0+20160213-1           amd64  shared low-level terminfo library for terminal handling               
ii   libudev1                229-1                    amd64  libudev shared library                                                
ii   libusb-0.1-4            2:0.1.12-28              amd64  userspace USB programming library                                     
ii   libustr-1.0-1           1.0.4-5                  amd64  Micro string library: shared library                                  
ii   libuuid1                2.27.1-3                 amd64  Universally Unique ID library                                         
ii   login                   1:4.2-3.1                amd64  system login tools                                                    
ii   lsb-base                9.20160110               all    Linux Standard Base init script functionality                         
ii   mawk                    1.3.3-17                 amd64  a pattern scanning and text processing language                       
ii   mount                   2.27.1-3                 amd64  tools for mounting and manipulating filesystems                       
ii   multiarch-support       2.21-9                   amd64  Transitional package to ensure multiarch compatibility                
ii   ncurses-base            6.0+20160213-1           all    basic terminal type definitions                                       
ii   ncurses-bin             6.0+20160213-1           amd64  terminal-related programs and man pages                               
ii   netbase                 5.3                      all    Basic TCP/IP networking system                                        
ii   passwd                  1:4.2-3.1                amd64  change and administer password and group data                         
ii   perl-base               5.22.1-7                 amd64  minimal Perl system                                                   
ii   readline-common         6.3-8                    all    GNU readline and history libraries, common files                      
ii   sed                     4.2.2-7                  amd64  The GNU sed stream editor                                             
ii   sensible-utils          0.0.9                    all    Utilities for sensible alternative selection                          
ii   startpar                0.59-3                   amd64  run processes in parallel and multiplex their output                  
ii   systemd                 229-1                    amd64  system and service manager                                            
ii   systemd-sysv            229-1                    amd64  system and service manager - SysV links                               
ii   sysv-rc                 2.88dsf-59.3             all    System-V-like runlevel change mechanism                               
ii   sysvinit-utils          2.88dsf-59.3             amd64  System-V-like utilities                                               
ii   tar                     1.28-2.1                 amd64  GNU version of the tar archiving utility                              
ii   tzdata                  2016a-1                  all    time zone and daylight-saving time data                               
ii   util-linux              2.27.1-3                 amd64  miscellaneous system utilities                                        
ii   zlib1g                  1:1.2.8.dfsg-2+b1        amd64  compression library - runtime                                         
```
