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
ii   adduser                 3.118                         all    add and remove users and groups
ii   apt                     2.3.9                         amd64  commandline package manager
ii   base-files              12                            amd64  Debian base system miscellaneous files
ii   base-passwd             3.5.52                        amd64  Debian base system master password and group files
ii   bash                    5.1-3+b2                      amd64  GNU Bourne Again SHell
ii   bsdutils                1:2.37.2-3                    amd64  basic utilities from 4.4BSD-Lite
ii   coreutils               8.32-4+b1                     amd64  GNU core utilities
ii   dash                    0.5.11+git20210120+802ebd4-1  amd64  POSIX-compliant shell
ii   debconf                 1.5.77                        all    Debian configuration management system
ii   debian-archive-keyring  2021.1.1                      all    GnuPG archive keys of the Debian archive
ii   debianutils             5.5-1                         amd64  Miscellaneous utilities specific to Debian
ii   diffutils               1:3.7-5                       amd64  File comparison utilities
ii   dpkg                    1.20.9                        amd64  Debian package management system
ii   e2fsprogs               1.46.4-1                      amd64  ext2/ext3/ext4 file system utilities
ii   findutils               4.8.0-1                       amd64  utilities for finding files--find, xargs
ii   gcc-10-base             10.3.0-11                     amd64  GCC, the GNU Compiler Collection (base package)
ii   gcc-11-base             11.2.0-8                      amd64  GCC, the GNU Compiler Collection (base package)
ii   gcc-9-base              9.4.0-3                       amd64  GCC, the GNU Compiler Collection (base package)
ii   gpgv                    2.2.27-2                      amd64  GNU privacy guard - signature verification tool
ii   grep                    3.7-1                         amd64  GNU grep, egrep and fgrep
ii   gzip                    1.10-4                        amd64  GNU compression utilities
ii   hostname                3.23                          amd64  utility to set/show the host name or domain name
ii   init-system-helpers     1.60                          all    helper tools for all init systems
ii   libacl1                 2.3.1-1                       amd64  access control list - shared library
ii   libapt-pkg6.0           2.3.9                         amd64  package management runtime library
ii   libattr1                1:2.5.1-1                     amd64  extended attribute handling - shared library
ii   libaudit-common         1:3.0.5-1                     all    Dynamic library for security auditing - common files
ii   libaudit1               1:3.0.5-1                     amd64  Dynamic library for security auditing
ii   libblkid1               2.37.2-3                      amd64  block device ID library
ii   libbz2-1.0              1.0.8-4                       amd64  high-quality block-sorting file compressor library - runtime
ii   libc-bin                2.32-4                        amd64  GNU C Library: Binaries
ii   libc6                   2.32-4                        amd64  GNU C Library: Shared libraries
ii   libcap-ng0              0.7.9-2.2+b1                  amd64  An alternate POSIX capabilities library
ii   libcap2                 1:2.44-1                      amd64  POSIX 1003.1e capabilities (library)
ii   libcom-err2             1.46.4-1                      amd64  common error description library
ii   libcrypt1               1:4.4.25-2                    amd64  libcrypt shared library
ii   libdb5.3                5.3.28+dfsg1-0.8              amd64  Berkeley v5.3 Database Libraries [runtime]
ii   libdebconfclient0       0.260                         amd64  Debian Configuration Management System (C-implementation library)
ii   libext2fs2              1.46.4-1                      amd64  ext2/ext3/ext4 file system libraries
ii   libffi8                 3.4.2-2                       amd64  Foreign Function Interface library runtime
ii   libgcc-s1               11.2.0-8                      amd64  GCC support library
ii   libgcrypt20             1.9.4-3+b1                    amd64  LGPL Crypto library - runtime library
ii   libgmp10                2:6.2.1+dfsg-2                amd64  Multiprecision arithmetic library
ii   libgnutls30             3.7.2-2                       amd64  GNU TLS library - main runtime library
ii   libgpg-error0           1.42-3                        amd64  GnuPG development runtime library
ii   libgssapi-krb5-2        1.18.3-7                      amd64  MIT Kerberos runtime libraries - krb5 GSS-API Mechanism
ii   libhogweed6             3.7.3-1                       amd64  low level cryptographic library (public-key cryptos)
ii   libidn2-0               2.3.2-2                       amd64  Internationalized domain names (IDNA2008/TR46) library
ii   libk5crypto3            1.18.3-7                      amd64  MIT Kerberos runtime libraries - Crypto Library
ii   libkeyutils1            1.6.1-2                       amd64  Linux Key Management Utilities (library)
ii   libkrb5-3               1.18.3-7                      amd64  MIT Kerberos runtime libraries
ii   libkrb5support0         1.18.3-7                      amd64  MIT Kerberos runtime libraries - Support library
ii   liblz4-1                1.9.3-2                       amd64  Fast LZ compression algorithm library - runtime
ii   liblzma5                5.2.5-2                       amd64  XZ-format compression library
ii   libmount1               2.37.2-3                      amd64  device mounting library
ii   libnettle8              3.7.3-1                       amd64  low level cryptographic library (symmetric and one-way cryptos)
ii   libnsl2                 1.3.0-2                       amd64  Public client interface for NIS(YP) and NIS+
ii   libp11-kit0             0.24.0-3                      amd64  library for loading and coordinating access to PKCS#11 modules - runtime
ii   libpam-modules          1.4.0-10                      amd64  Pluggable Authentication Modules for PAM
ii   libpam-modules-bin      1.4.0-10                      amd64  Pluggable Authentication Modules for PAM - helper binaries
ii   libpam-runtime          1.4.0-10                      all    Runtime support for the PAM library
ii   libpam0g                1.4.0-10                      amd64  Pluggable Authentication Modules library
ii   libpcre2-8-0            10.36-2                       amd64  New Perl Compatible Regular Expression Library- 8 bit runtime files
ii   libpcre3                2:8.39-13                     amd64  Old Perl 5 Compatible Regular Expression Library - runtime files
ii   libseccomp2             2.5.2-2                       amd64  high level interface to Linux seccomp filter
ii   libselinux1             3.1-3                         amd64  SELinux runtime shared libraries
ii   libsemanage-common      3.1-1                         all    Common files for SELinux policy management libraries
ii   libsemanage1            3.1-1+b2                      amd64  SELinux policy management library
ii   libsepol1               3.1-1                         amd64  SELinux library for manipulating binary security policies
ii   libsmartcols1           2.37.2-3                      amd64  smart column output alignment library
ii   libss2                  1.46.4-1                      amd64  command-line interface parsing library
ii   libssl1.1               1.1.1l-1                      amd64  Secure Sockets Layer toolkit - shared libraries
ii   libstdc++6              11.2.0-8                      amd64  GNU Standard C++ Library v3
ii   libsystemd0             247.9-4                       amd64  systemd utility library
ii   libtasn1-6              4.17.0-2                      amd64  Manage ASN.1 structures (runtime)
ii   libtinfo6               6.2+20210905-1                amd64  shared low-level terminfo library for terminal handling
ii   libtirpc-common         1.3.2-2                       all    transport-independent RPC library - common files
ii   libtirpc3               1.3.2-2                       amd64  transport-independent RPC library
ii   libudev1                247.9-4                       amd64  libudev shared library
ii   libunistring2           0.9.10-6                      amd64  Unicode string library for C
ii   libuuid1                2.37.2-3                      amd64  Universally Unique ID library
ii   libxxhash0              0.8.0-2                       amd64  shared library for xxhash
ii   libzstd1                1.4.8+dfsg-3                  amd64  fast lossless compression algorithm
ii   login                   1:4.8.1-1                     amd64  system login tools
ii   logsave                 1.46.4-1                      amd64  save the output of a command in a log file
ii   lsb-base                11.1.0                        all    Linux Standard Base init script functionality
ii   mawk                    1.3.4.20200120-2              amd64  Pattern scanning and text processing language
ii   mount                   2.37.2-3                      amd64  tools for mounting and manipulating filesystems
ii   ncurses-base            6.2+20210905-1                all    basic terminal type definitions
ii   ncurses-bin             6.2+20210905-1                amd64  terminal-related programs and man pages
ii   passwd                  1:4.8.1-1                     amd64  change and administer password and group data
ii   perl-base               5.32.1-6                      amd64  minimal Perl system
ii   sed                     4.8-1                         amd64  GNU stream editor for filtering/transforming text
ii   sysvinit-utils          3.00-1                        amd64  System-V-like utilities
ii   tar                     1.34+dfsg-1                   amd64  GNU version of the tar archiving utility
ii   tzdata                  2021c-1                       all    time zone and daylight-saving time data
ii   util-linux              2.37.2-3                      amd64  miscellaneous system utilities
ii   zlib1g                  1:1.2.11.dfsg-2               amd64  compression library - runtime
```
