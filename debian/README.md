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
ii   apt                      3.0.0                        amd64  commandline package manager
ii   base-files               13.7                         amd64  Debian base system miscellaneous files
ii   base-passwd              3.6.7                        amd64  Debian base system master password and group files
ii   bash                     5.2.37-2                     amd64  GNU Bourne Again SHell
ii   bsdutils                 1:2.41-4                     amd64  basic utilities from 4.4BSD-Lite
ii   coreutils                9.7-1                        amd64  GNU core utilities
ii   dash                     0.5.12-12                    amd64  POSIX-compliant shell
ii   debconf                  1.5.91                       all    Debian configuration management system
ii   debian-archive-keyring   2025.1                       all    OpenPGP archive certificates of the Debian archive
ii   debianutils              5.21                         amd64  Miscellaneous utilities specific to Debian
ii   diffutils                1:3.10-3                     amd64  File comparison utilities
ii   dpkg                     1.22.18                      amd64  Debian package management system
ii   findutils                4.10.0-3                     amd64  utilities for finding files--find, xargs
ii   gcc-14-base              14.2.0-19                    amd64  GCC, the GNU Compiler Collection (base package)
ii   grep                     3.11-4                       amd64  GNU grep, egrep and fgrep
ii   gzip                     1.13-1                       amd64  GNU compression utilities
ii   hostname                 3.25                         amd64  utility to set/show the host name or domain name
ii   init-system-helpers      1.68                         all    helper tools for all init systems
ii   libacl1                  2.3.2-2+b1                   amd64  access control list - shared library
ii   libapt-pkg7.0            3.0.0                        amd64  package management runtime library
ii   libattr1                 1:2.5.2-3                    amd64  extended attribute handling - shared library
ii   libaudit-common          1:4.0.2-2                    all    Dynamic library for security auditing - common files
ii   libaudit1                1:4.0.2-2+b2                 amd64  Dynamic library for security auditing
ii   libblkid1                2.41-4                       amd64  block device ID library
ii   libbsd0                  0.12.2-2                     amd64  utility functions from BSD systems - shared library
ii   libbz2-1.0               1.0.8-6                      amd64  high-quality block-sorting file compressor library - runtime
ii   libc-bin                 2.41-6                       amd64  GNU C Library: Binaries
ii   libc6                    2.41-6                       amd64  GNU C Library: Shared libraries
ii   libcap-ng0               0.8.5-4+b1                   amd64  alternate POSIX capabilities library
ii   libcap2                  1:2.75-5                     amd64  POSIX 1003.1e capabilities (library)
ii   libcrypt1                1:4.4.38-1                   amd64  libcrypt shared library
ii   libdb5.3t64              5.3.28+dfsg2-9               amd64  Berkeley v5.3 Database Libraries [runtime]
ii   libdebconfclient0        0.278                        amd64  Debian Configuration Management System (C-implementation library)
ii   libgcc-s1                14.2.0-19                    amd64  GCC support library
ii   libgmp10                 2:6.3.0+dfsg-3               amd64  Multiprecision arithmetic library
ii   libhogweed6t64           3.10.1-1                     amd64  low level cryptographic library (public-key cryptos)
ii   liblastlog2-2            2.41-4                       amd64  lastlog2 database shared library
ii   liblz4-1                 1.10.0-4                     amd64  Fast LZ compression algorithm library - runtime
ii   liblzma5                 5.8.1-1                      amd64  XZ-format compression library
ii   libmd0                   1.1.0-2+b1                   amd64  message digest functions from BSD systems - shared library
ii   libmount1                2.41-4                       amd64  device mounting library
ii   libnettle8t64            3.10.1-1                     amd64  low level cryptographic library (symmetric and one-way cryptos)
ii   libpam-modules           1.7.0-3                      amd64  Pluggable Authentication Modules for PAM
ii   libpam-modules-bin       1.7.0-3                      amd64  Pluggable Authentication Modules for PAM - helper binaries
ii   libpam-runtime           1.7.0-3                      all    Runtime support for the PAM library
ii   libpam0g                 1.7.0-3                      amd64  Pluggable Authentication Modules library
ii   libpcre2-8-0             10.45-1                      amd64  New Perl Compatible Regular Expression Library- 8 bit runtime files
ii   libseccomp2              2.6.0-2                      amd64  high level interface to Linux seccomp filter
ii   libselinux1              3.8.1-1                      amd64  SELinux runtime shared libraries
ii   libsemanage-common       3.8.1-1                      all    Common files for SELinux policy management libraries
ii   libsemanage2             3.8.1-1                      amd64  SELinux policy management library
ii   libsepol2                3.8.1-1                      amd64  SELinux library for manipulating binary security policies
ii   libsmartcols1            2.41-4                       amd64  smart column output alignment library
ii   libsqlite3-0             3.46.1-3                     amd64  SQLite 3 shared library
ii   libssl3t64               3.5.0-1                      amd64  Secure Sockets Layer toolkit - shared libraries
ii   libstdc++6               14.2.0-19                    amd64  GNU Standard C++ Library v3
ii   libsystemd0              257.5-2                      amd64  systemd utility library
ii   libtinfo6                6.5+20250216-2               amd64  shared low-level terminfo library for terminal handling
ii   libudev1                 257.5-2                      amd64  libudev shared library
ii   libuuid1                 2.41-4                       amd64  Universally Unique ID library
ii   libxxhash0               0.8.3-2                      amd64  shared library for xxhash
ii   libzstd1                 1.5.7+dfsg-1                 amd64  fast lossless compression algorithm
ii   login                    1:4.16.0-2+really2.41-4      amd64  system login tools
ii   login.defs               1:4.17.4-1                   all    system user management configuration
ii   mawk                     1.3.4.20250131-1             amd64  Pattern scanning and text processing language
ii   mount                    2.41-4                       amd64  tools for mounting and manipulating filesystems
ii   ncurses-base             6.5+20250216-2               all    basic terminal type definitions
ii   ncurses-bin              6.5+20250216-2               amd64  terminal-related programs and man pages
ii   openssl-provider-legacy  3.5.0-1                      amd64  Secure Sockets Layer toolkit - cryptographic utility
ii   passwd                   1:4.17.4-1                   amd64  change and administer password and group data
ii   perl-base                5.40.1-2                     amd64  minimal Perl system
ii   sed                      4.9-2                        amd64  GNU stream editor for filtering/transforming text
ii   sqv                      1.3.0-1                      amd64  Simple OpenPGP signature verification program
ii   sysvinit-utils           3.14-4                       amd64  System-V-like utilities
ii   tar                      1.35+dfsg-3.1                amd64  GNU version of the tar archiving utility
ii   tzdata                   2025b-1                      all    time zone and daylight-saving time data
ii   util-linux               2.41-4                       amd64  miscellaneous system utilities
ii   zlib1g                   1:1.3.dfsg+really1.3.1-1+b1  amd64  compression library - runtime
```
