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
ii   apt                     2.9.4                     amd64  commandline package manager
ii   base-files              13.2                      amd64  Debian base system miscellaneous files
ii   base-passwd             3.6.3                     amd64  Debian base system master password and group files
ii   bash                    5.2.21-2+b1               amd64  GNU Bourne Again SHell
ii   bsdutils                1:2.40.1-2                amd64  basic utilities from 4.4BSD-Lite
ii   coreutils               9.4-3.1                   amd64  GNU core utilities
ii   dash                    0.5.12-8                  amd64  POSIX-compliant shell
ii   debconf                 1.5.86                    all    Debian configuration management system
ii   debian-archive-keyring  2023.4                    all    GnuPG archive keys of the Debian archive
ii   debianutils             5.17                      amd64  Miscellaneous utilities specific to Debian
ii   diffutils               1:3.10-1                  amd64  File comparison utilities
ii   dpkg                    1.22.6                    amd64  Debian package management system
ii   e2fsprogs               1.47.1-1                  amd64  ext2/ext3/ext4 file system utilities
ii   findutils               4.9.0-5                   amd64  utilities for finding files--find, xargs
ii   gcc-14-base             14.1.0-1                  amd64  GCC, the GNU Compiler Collection (base package)
ii   gpgv                    2.2.43-6                  amd64  GNU privacy guard - signature verification tool
ii   grep                    3.11-4                    amd64  GNU grep, egrep and fgrep
ii   gzip                    1.12-1.1                  amd64  GNU compression utilities
ii   hostname                3.23+nmu2                 amd64  utility to set/show the host name or domain name
ii   init-system-helpers     1.66                      all    helper tools for all init systems
ii   libacl1                 2.3.2-2                   amd64  access control list - shared library
ii   libapt-pkg6.0t64        2.9.4                     amd64  package management runtime library
ii   libattr1                1:2.5.2-1                 amd64  extended attribute handling - shared library
ii   libaudit-common         1:3.1.2-2.1               all    Dynamic library for security auditing - common files
ii   libaudit1               1:3.1.2-2.1               amd64  Dynamic library for security auditing
ii   libblkid1               2.40.1-2                  amd64  block device ID library
ii   libbz2-1.0              1.0.8-5.1                 amd64  high-quality block-sorting file compressor library - runtime
ii   libc-bin                2.38-11                   amd64  GNU C Library: Binaries
ii   libc6                   2.38-11                   amd64  GNU C Library: Shared libraries
ii   libcap-ng0              0.8.5-1                   amd64  alternate POSIX capabilities library
ii   libcap2                 1:2.66-5                  amd64  POSIX 1003.1e capabilities (library)
ii   libcom-err2             1.47.1-1                  amd64  common error description library
ii   libcrypt1               1:4.4.36-4                amd64  libcrypt shared library
ii   libdb5.3t64             5.3.28+dfsg2-7            amd64  Berkeley v5.3 Database Libraries [runtime]
ii   libdebconfclient0       0.271+b3                  amd64  Debian Configuration Management System (C-implementation library)
ii   libext2fs2t64           1.47.1-1                  amd64  ext2/ext3/ext4 file system libraries
ii   libffi8                 3.4.6-1                   amd64  Foreign Function Interface library runtime
ii   libgcc-s1               14.1.0-1                  amd64  GCC support library
ii   libgcrypt20             1.10.3-3                  amd64  LGPL Crypto library - runtime library
ii   libgmp10                2:6.3.0+dfsg-2+b1         amd64  Multiprecision arithmetic library
ii   libgnutls30t64          3.8.5-2                   amd64  GNU TLS library - main runtime library
ii   libgpg-error0           1.49-2                    amd64  GnuPG development runtime library
ii   libhogweed6t64          3.9.1-2.2                 amd64  low level cryptographic library (public-key cryptos)
ii   libidn2-0               2.3.7-2                   amd64  Internationalized domain names (IDNA2008/TR46) library
ii   liblz4-1                1.9.4-2                   amd64  Fast LZ compression algorithm library - runtime
ii   liblzma5                5.6.1+really5.4.5-1       amd64  XZ-format compression library
ii   libmd0                  1.1.0-2                   amd64  message digest functions from BSD systems - shared library
ii   libmount1               2.40.1-2                  amd64  device mounting library
ii   libnettle8t64           3.9.1-2.2                 amd64  low level cryptographic library (symmetric and one-way cryptos)
ii   libp11-kit0             0.25.3-5                  amd64  library for loading and coordinating access to PKCS#11 modules - runtime
ii   libpam-modules          1.5.3-7                   amd64  Pluggable Authentication Modules for PAM
ii   libpam-modules-bin      1.5.3-7                   amd64  Pluggable Authentication Modules for PAM - helper binaries
ii   libpam-runtime          1.5.3-7                   all    Runtime support for the PAM library
ii   libpam0g                1.5.3-7                   amd64  Pluggable Authentication Modules library
ii   libpcre2-8-0            10.42-4+b1                amd64  New Perl Compatible Regular Expression Library- 8 bit runtime files
ii   libseccomp2             2.5.5-1                   amd64  high level interface to Linux seccomp filter
ii   libselinux1             3.5-2+b2                  amd64  SELinux runtime shared libraries
ii   libsemanage-common      3.5-1                     all    Common files for SELinux policy management libraries
ii   libsemanage2            3.5-1+b3                  amd64  SELinux policy management library
ii   libsepol2               3.5-2+b1                  amd64  SELinux library for manipulating binary security policies
ii   libsmartcols1           2.40.1-2                  amd64  smart column output alignment library
ii   libss2                  1.47.1-1                  amd64  command-line interface parsing library
ii   libssl3t64              3.2.1-3                   amd64  Secure Sockets Layer toolkit - shared libraries
ii   libstdc++6              14.1.0-1                  amd64  GNU Standard C++ Library v3
ii   libsystemd0             256~rc3-4                 amd64  systemd utility library
ii   libtasn1-6              4.19.0-3+b2               amd64  Manage ASN.1 structures (runtime)
ii   libtinfo6               6.5-2                     amd64  shared low-level terminfo library for terminal handling
ii   libudev1                256~rc3-4                 amd64  libudev shared library
ii   libunistring5           1.2-1                     amd64  Unicode string library for C
ii   libuuid1                2.40.1-2                  amd64  Universally Unique ID library
ii   libxxhash0              0.8.2-2+b1                amd64  shared library for xxhash
ii   libzstd1                1.5.5+dfsg2-2             amd64  fast lossless compression algorithm
ii   login                   1:4.13+dfsg1-4            amd64  system login tools
ii   logsave                 1.47.1-1                  amd64  save the output of a command in a log file
ii   mawk                    1.3.4.20240123-1          amd64  Pattern scanning and text processing language
ii   mount                   2.40.1-2                  amd64  tools for mounting and manipulating filesystems
ii   ncurses-base            6.5-2                     all    basic terminal type definitions
ii   ncurses-bin             6.5-2                     amd64  terminal-related programs and man pages
ii   passwd                  1:4.13+dfsg1-4            amd64  change and administer password and group data
ii   perl-base               5.38.2-4                  amd64  minimal Perl system
ii   sed                     4.9-2                     amd64  GNU stream editor for filtering/transforming text
ii   sysvinit-utils          3.09-1                    amd64  System-V-like utilities
ii   tar                     1.35+dfsg-3               amd64  GNU version of the tar archiving utility
ii   tzdata                  2024a-4                   all    time zone and daylight-saving time data
ii   usr-is-merged           39                        all    Transitional package to assert a merged-/usr system
ii   util-linux              2.40.1-2                  amd64  miscellaneous system utilities
ii   zlib1g                  1:1.3.dfsg+really1.3.1-1  amd64  compression library - runtime
```
