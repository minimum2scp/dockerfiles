[![Docker Stars](https://img.shields.io/docker/stars/minimum2scp/debian-stretch.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/minimum2scp/debian-stretch.svg)]()
[![Docker Automated Build](https://img.shields.io/docker/automated/minimum2scp/debian-stretch.svg)]()

# about minimum2scp/debian-stretch image

 * Debian stretch (9.x) amd64
 * Almost same as debian:stretch image ([semi official debian image](https://registry.hub.docker.com/_/debian/))

## build minimum2scp/debian-stretch image

Run following commands on your Debian (requires debootstrap)

```
$ git clone https://github.com/minimum2scp/dockerfiles.git
$ cd dockerfiles/debian-stretch
$ rake mkimage TAG=minimum2scp/debian-stretch:latest
```

## packages

installed packages:

```
ii   adduser                 3.115                  all    add and remove users and groups
ii   apt                     1.4.9                  amd64  commandline package manager
ii   base-files              9.9+deb9u11            amd64  Debian base system miscellaneous files
ii   base-passwd             3.5.43                 amd64  Debian base system master password and group files
ii   bash                    4.4-5                  amd64  GNU Bourne Again SHell
ii   bsdutils                1:2.29.2-1+deb9u1      amd64  basic utilities from 4.4BSD-Lite
ii   coreutils               8.26-3                 amd64  GNU core utilities
ii   dash                    0.5.8-2.4              amd64  POSIX-compliant shell
ii   debconf                 1.5.61                 all    Debian configuration management system
ii   debian-archive-keyring  2017.5+deb9u1          all    GnuPG archive keys of the Debian archive
ii   debianutils             4.8.1.1                amd64  Miscellaneous utilities specific to Debian
ii   diffutils               1:3.5-3                amd64  File comparison utilities
ii   dpkg                    1.18.25                amd64  Debian package management system
ii   e2fslibs                1.43.4-2               amd64  ext2/ext3/ext4 file system libraries
ii   e2fsprogs               1.43.4-2               amd64  ext2/ext3/ext4 file system utilities
ii   findutils               4.6.0+git+20161106-2   amd64  utilities for finding files--find, xargs
ii   gcc-6-base              6.3.0-18+deb9u1        amd64  GCC, the GNU Compiler Collection (base package)
ii   gpgv                    2.1.18-8~deb9u4        amd64  GNU privacy guard - signature verification tool
ii   grep                    2.27-2                 amd64  GNU grep, egrep and fgrep
ii   gzip                    1.6-5+b1               amd64  GNU compression utilities
ii   hostname                3.18+b1                amd64  utility to set/show the host name or domain name
ii   inetutils-ping          2:1.9.4-2+b1           amd64  ICMP echo tool
ii   init-system-helpers     1.48                   all    helper tools for all init systems
ii   iproute2                4.9.0-1+deb9u1         amd64  networking and traffic control tools
ii   libacl1                 2.2.52-3+b1            amd64  Access control list shared library
ii   libapt-pkg5.0           1.4.9                  amd64  package management runtime library
ii   libattr1                1:2.4.47-2+b2          amd64  Extended attribute shared library
ii   libaudit-common         1:2.6.7-2              all    Dynamic library for security auditing - common files
ii   libaudit1               1:2.6.7-2              amd64  Dynamic library for security auditing
ii   libblkid1               2.29.2-1+deb9u1        amd64  block device ID library
ii   libbz2-1.0              1.0.6-8.1              amd64  high-quality block-sorting file compressor library - runtime
ii   libc-bin                2.24-11+deb9u4         amd64  GNU C Library: Binaries
ii   libc6                   2.24-11+deb9u4         amd64  GNU C Library: Shared libraries
ii   libcap-ng0              0.7.7-3+b1             amd64  An alternate POSIX capabilities library
ii   libcomerr2              1.43.4-2               amd64  common error description library
ii   libdb5.3                5.3.28-12+deb9u1       amd64  Berkeley v5.3 Database Libraries [runtime]
ii   libdebconfclient0       0.227                  amd64  Debian Configuration Management System (C-implementation library)
ii   libelf1                 0.168-1                amd64  library to read and write ELF files
ii   libfdisk1               2.29.2-1+deb9u1        amd64  fdisk partitioning library
ii   libgcc1                 1:6.3.0-18+deb9u1      amd64  GCC support library
ii   libgcrypt20             1.7.6-2+deb9u3         amd64  LGPL Crypto library - runtime library
ii   libgpg-error0           1.26-2                 amd64  library for common error values and messages in GnuPG components
ii   liblz4-1                0.0~r131-2+b1          amd64  Fast LZ compression algorithm library - runtime
ii   liblzma5                5.2.2-1.2+b1           amd64  XZ-format compression library
ii   libmnl0                 1.0.4-2                amd64  minimalistic Netlink communication library
ii   libmount1               2.29.2-1+deb9u1        amd64  device mounting library
ii   libncursesw5            6.0+20161126-1+deb9u2  amd64  shared libraries for terminal handling (wide character support)
ii   libpam-modules          1.1.8-3.6              amd64  Pluggable Authentication Modules for PAM
ii   libpam-modules-bin      1.1.8-3.6              amd64  Pluggable Authentication Modules for PAM - helper binaries
ii   libpam-runtime          1.1.8-3.6              all    Runtime support for the PAM library
ii   libpam0g                1.1.8-3.6              amd64  Pluggable Authentication Modules library
ii   libpcre3                2:8.39-3               amd64  Old Perl 5 Compatible Regular Expression Library - runtime files
ii   libselinux1             2.6-3+b3               amd64  SELinux runtime shared libraries
ii   libsemanage-common      2.6-2                  all    Common files for SELinux policy management libraries
ii   libsemanage1            2.6-2                  amd64  SELinux policy management library
ii   libsepol1               2.6-2                  amd64  SELinux library for manipulating binary security policies
ii   libsmartcols1           2.29.2-1+deb9u1        amd64  smart column output alignment library
ii   libss2                  1.43.4-2               amd64  command-line interface parsing library
ii   libstdc++6              6.3.0-18+deb9u1        amd64  GNU Standard C++ Library v3
ii   libsystemd0             232-25+deb9u12         amd64  systemd utility library
ii   libtinfo5               6.0+20161126-1+deb9u2  amd64  shared low-level terminfo library for terminal handling
ii   libudev1                232-25+deb9u12         amd64  libudev shared library
ii   libustr-1.0-1           1.0.4-6                amd64  Micro string library: shared library
ii   libuuid1                2.29.2-1+deb9u1        amd64  Universally Unique ID library
ii   login                   1:4.4-4.1              amd64  system login tools
ii   lsb-base                9.20161125             all    Linux Standard Base init script functionality
ii   mawk                    1.3.3-17+b3            amd64  a pattern scanning and text processing language
ii   mount                   2.29.2-1+deb9u1        amd64  tools for mounting and manipulating filesystems
ii   multiarch-support       2.24-11+deb9u4         amd64  Transitional package to ensure multiarch compatibility
ii   ncurses-base            6.0+20161126-1+deb9u2  all    basic terminal type definitions
ii   ncurses-bin             6.0+20161126-1+deb9u2  amd64  terminal-related programs and man pages
ii   netbase                 5.4                    all    Basic TCP/IP networking system
ii   passwd                  1:4.4-4.1              amd64  change and administer password and group data
ii   perl-base               5.24.1-3+deb9u5        amd64  minimal Perl system
ii   sed                     4.4-1                  amd64  GNU stream editor for filtering/transforming text
ii   sensible-utils          0.0.9+deb9u1           all    Utilities for sensible alternative selection
ii   sysvinit-utils          2.88dsf-59.9           amd64  System-V-like utilities
ii   tar                     1.29b-1.1              amd64  GNU version of the tar archiving utility
ii   tzdata                  2019c-0+deb9u1         all    time zone and daylight-saving time data
ii   util-linux              2.29.2-1+deb9u1        amd64  miscellaneous system utilities
ii   zlib1g                  1:1.2.8.dfsg-5         amd64  compression library - runtime
```
