# about minimum2scp/debian-bullseye image

 * Debian bullseye (11.x) amd64
 * Almost same as debian:bullseye image ([semi official debian image](https://registry.hub.docker.com/_/debian/))

## build minimum2scp/debian-bullseye image

Run following commands on your Debian (requires debootstrap)

```
$ git clone https://github.com/minimum2scp/dockerfiles.git
$ cd dockerfiles/debian-bullseye
$ rake mkimage TAG=minimum2scp/debian-bullseye:latest
```

## packages

installed packages:

```
ii   adduser                 3.118+deb11u1                 all    add and remove users and groups
ii   apt                     2.2.4                         amd64  commandline package manager
ii   base-files              11.1+deb11u9                  amd64  Debian base system miscellaneous files
ii   base-passwd             3.5.51                        amd64  Debian base system master password and group files
ii   bash                    5.1-2+deb11u1                 amd64  GNU Bourne Again SHell
ii   bsdutils                1:2.36.1-8+deb11u1            amd64  basic utilities from 4.4BSD-Lite
ii   coreutils               8.32-4+b1                     amd64  GNU core utilities
ii   dash                    0.5.11+git20200708+dd9ef66-5  amd64  POSIX-compliant shell
ii   debconf                 1.5.77                        all    Debian configuration management system
ii   debian-archive-keyring  2021.1.1+deb11u1              all    GnuPG archive keys of the Debian archive
ii   debianutils             4.11.2                        amd64  Miscellaneous utilities specific to Debian
ii   diffutils               1:3.7-5                       amd64  File comparison utilities
ii   dpkg                    1.20.13                       amd64  Debian package management system
ii   e2fsprogs               1.46.2-2                      amd64  ext2/ext3/ext4 file system utilities
ii   findutils               4.8.0-1                       amd64  utilities for finding files--find, xargs
ii   gcc-10-base             10.2.1-6                      amd64  GCC, the GNU Compiler Collection (base package)
ii   gcc-9-base              9.3.0-22                      amd64  GCC, the GNU Compiler Collection (base package)
ii   gpgv                    2.2.27-2+deb11u2              amd64  GNU privacy guard - signature verification tool
ii   grep                    3.6-1+deb11u1                 amd64  GNU grep, egrep and fgrep
ii   gzip                    1.10-4+deb11u1                amd64  GNU compression utilities
ii   hostname                3.23                          amd64  utility to set/show the host name or domain name
ii   init-system-helpers     1.60                          all    helper tools for all init systems
ii   libacl1                 2.2.53-10                     amd64  access control list - shared library
ii   libapt-pkg6.0           2.2.4                         amd64  package management runtime library
ii   libattr1                1:2.4.48-6                    amd64  extended attribute handling - shared library
ii   libaudit-common         1:3.0-2                       all    Dynamic library for security auditing - common files
ii   libaudit1               1:3.0-2                       amd64  Dynamic library for security auditing
ii   libblkid1               2.36.1-8+deb11u1              amd64  block device ID library
ii   libbz2-1.0              1.0.8-4                       amd64  high-quality block-sorting file compressor library - runtime
ii   libc-bin                2.31-13+deb11u8               amd64  GNU C Library: Binaries
ii   libc6                   2.31-13+deb11u8               amd64  GNU C Library: Shared libraries
ii   libcap-ng0              0.7.9-2.2+b1                  amd64  An alternate POSIX capabilities library
ii   libcom-err2             1.46.2-2                      amd64  common error description library
ii   libcrypt1               1:4.4.18-4                    amd64  libcrypt shared library
ii   libdb5.3                5.3.28+dfsg1-0.8              amd64  Berkeley v5.3 Database Libraries [runtime]
ii   libdebconfclient0       0.260                         amd64  Debian Configuration Management System (C-implementation library)
ii   libext2fs2              1.46.2-2                      amd64  ext2/ext3/ext4 file system libraries
ii   libffi7                 3.3-6                         amd64  Foreign Function Interface library runtime
ii   libgcc-s1               10.2.1-6                      amd64  GCC support library
ii   libgcrypt20             1.8.7-6                       amd64  LGPL Crypto library - runtime library
ii   libgmp10                2:6.2.1+dfsg-1+deb11u1        amd64  Multiprecision arithmetic library
ii   libgnutls30             3.7.1-5+deb11u4               amd64  GNU TLS library - main runtime library
ii   libgpg-error0           1.38-2                        amd64  GnuPG development runtime library
ii   libgssapi-krb5-2        1.18.3-6+deb11u4              amd64  MIT Kerberos runtime libraries - krb5 GSS-API Mechanism
ii   libhogweed6             3.7.3-1                       amd64  low level cryptographic library (public-key cryptos)
ii   libidn2-0               2.3.0-5                       amd64  Internationalized domain names (IDNA2008/TR46) library
ii   libk5crypto3            1.18.3-6+deb11u4              amd64  MIT Kerberos runtime libraries - Crypto Library
ii   libkeyutils1            1.6.1-2                       amd64  Linux Key Management Utilities (library)
ii   libkrb5-3               1.18.3-6+deb11u4              amd64  MIT Kerberos runtime libraries
ii   libkrb5support0         1.18.3-6+deb11u4              amd64  MIT Kerberos runtime libraries - Support library
ii   liblz4-1                1.9.3-2                       amd64  Fast LZ compression algorithm library - runtime
ii   liblzma5                5.2.5-2.1~deb11u1             amd64  XZ-format compression library
ii   libmount1               2.36.1-8+deb11u1              amd64  device mounting library
ii   libnettle8              3.7.3-1                       amd64  low level cryptographic library (symmetric and one-way cryptos)
ii   libnsl2                 1.3.0-2                       amd64  Public client interface for NIS(YP) and NIS+
ii   libp11-kit0             0.23.22-1                     amd64  library for loading and coordinating access to PKCS#11 modules - runtime
ii   libpam-modules          1.4.0-9+deb11u1               amd64  Pluggable Authentication Modules for PAM
ii   libpam-modules-bin      1.4.0-9+deb11u1               amd64  Pluggable Authentication Modules for PAM - helper binaries
ii   libpam-runtime          1.4.0-9+deb11u1               all    Runtime support for the PAM library
ii   libpam0g                1.4.0-9+deb11u1               amd64  Pluggable Authentication Modules library
ii   libpcre2-8-0            10.36-2+deb11u1               amd64  New Perl Compatible Regular Expression Library- 8 bit runtime files
ii   libpcre3                2:8.39-13                     amd64  Old Perl 5 Compatible Regular Expression Library - runtime files
ii   libseccomp2             2.5.1-1+deb11u1               amd64  high level interface to Linux seccomp filter
ii   libselinux1             3.1-3                         amd64  SELinux runtime shared libraries
ii   libsemanage-common      3.1-1                         all    Common files for SELinux policy management libraries
ii   libsemanage1            3.1-1+b2                      amd64  SELinux policy management library
ii   libsepol1               3.1-1                         amd64  SELinux library for manipulating binary security policies
ii   libsmartcols1           2.36.1-8+deb11u1              amd64  smart column output alignment library
ii   libss2                  1.46.2-2                      amd64  command-line interface parsing library
ii   libssl1.1               1.1.1w-0+deb11u1              amd64  Secure Sockets Layer toolkit - shared libraries
ii   libstdc++6              10.2.1-6                      amd64  GNU Standard C++ Library v3
ii   libsystemd0             247.3-7+deb11u4               amd64  systemd utility library
ii   libtasn1-6              4.16.0-2+deb11u1              amd64  Manage ASN.1 structures (runtime)
ii   libtinfo6               6.2+20201114-2+deb11u2        amd64  shared low-level terminfo library for terminal handling
ii   libtirpc-common         1.3.1-1+deb11u1               all    transport-independent RPC library - common files
ii   libtirpc3               1.3.1-1+deb11u1               amd64  transport-independent RPC library
ii   libudev1                247.3-7+deb11u4               amd64  libudev shared library
ii   libunistring2           0.9.10-4                      amd64  Unicode string library for C
ii   libuuid1                2.36.1-8+deb11u1              amd64  Universally Unique ID library
ii   libxxhash0              0.8.0-2                       amd64  shared library for xxhash
ii   libzstd1                1.4.8+dfsg-2.1                amd64  fast lossless compression algorithm
ii   login                   1:4.8.1-1                     amd64  system login tools
ii   logsave                 1.46.2-2                      amd64  save the output of a command in a log file
ii   lsb-base                11.1.0                        all    Linux Standard Base init script functionality
ii   mawk                    1.3.4.20200120-2              amd64  Pattern scanning and text processing language
ii   mount                   2.36.1-8+deb11u1              amd64  tools for mounting and manipulating filesystems
ii   ncurses-base            6.2+20201114-2+deb11u2        all    basic terminal type definitions
ii   ncurses-bin             6.2+20201114-2+deb11u2        amd64  terminal-related programs and man pages
ii   passwd                  1:4.8.1-1                     amd64  change and administer password and group data
ii   perl-base               5.32.1-4+deb11u3              amd64  minimal Perl system
ii   sed                     4.7-1                         amd64  GNU stream editor for filtering/transforming text
ii   sysvinit-utils          2.96-7+deb11u1                amd64  System-V-like utilities
ii   tar                     1.34+dfsg-1+deb11u1           amd64  GNU version of the tar archiving utility
ii   tzdata                  2024a-0+deb11u1               all    time zone and daylight-saving time data
ii   util-linux              2.36.1-8+deb11u1              amd64  miscellaneous system utilities
ii   zlib1g                  1:1.2.11.dfsg-2+deb11u2       amd64  compression library - runtime
```
