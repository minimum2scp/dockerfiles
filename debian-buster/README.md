# about minimum2scp/debian-buster image

 * Debian buster (10.x) amd64
 * Almost same as debian:buster image ([semi official debian image](https://registry.hub.docker.com/_/debian/))

## build minimum2scp/debian-buster image

Run following commands on your Debian (requires debootstrap)

```
$ git clone https://github.com/minimum2scp/dockerfiles.git
$ cd dockerfiles/debian-buster
$ rake mkimage TAG=minimum2scp/debian-buster:latest
```

## packages

installed packages:

```
ii   adduser                 3.118                    all    add and remove users and groups
ii   apt                     1.8.2.3                  amd64  commandline package manager
ii   base-files              10.3+deb10u13            amd64  Debian base system miscellaneous files
ii   base-passwd             3.5.46                   amd64  Debian base system master password and group files
ii   bash                    5.0-4                    amd64  GNU Bourne Again SHell
ii   bsdutils                1:2.33.1-0.1             amd64  basic utilities from 4.4BSD-Lite
ii   coreutils               8.30-3                   amd64  GNU core utilities
ii   dash                    0.5.10.2-5               amd64  POSIX-compliant shell
ii   debconf                 1.5.71+deb10u1           all    Debian configuration management system
ii   debian-archive-keyring  2019.1+deb10u1           all    GnuPG archive keys of the Debian archive
ii   debianutils             4.8.6.1                  amd64  Miscellaneous utilities specific to Debian
ii   diffutils               1:3.7-3                  amd64  File comparison utilities
ii   dpkg                    1.19.8                   amd64  Debian package management system
ii   e2fsprogs               1.44.5-1+deb10u3         amd64  ext2/ext3/ext4 file system utilities
ii   fdisk                   2.33.1-0.1               amd64  collection of partitioning utilities
ii   findutils               4.6.0+git+20190209-2     amd64  utilities for finding files--find, xargs
ii   gcc-8-base              8.3.0-6                  amd64  GCC, the GNU Compiler Collection (base package)
ii   gpgv                    2.2.12-1+deb10u2         amd64  GNU privacy guard - signature verification tool
ii   grep                    3.3-1                    amd64  GNU grep, egrep and fgrep
ii   gzip                    1.9-3+deb10u1            amd64  GNU compression utilities
ii   hostname                3.21                     amd64  utility to set/show the host name or domain name
ii   init-system-helpers     1.56+nmu1                all    helper tools for all init systems
ii   iproute2                4.20.0-2+deb10u1         amd64  networking and traffic control tools
ii   iputils-ping            3:20180629-2+deb10u2     amd64  Tools to test the reachability of network hosts
ii   libacl1                 2.2.53-4                 amd64  access control list - shared library
ii   libapt-pkg5.0           1.8.2.3                  amd64  package management runtime library
ii   libattr1                1:2.4.48-4               amd64  extended attribute handling - shared library
ii   libaudit-common         1:2.8.4-3                all    Dynamic library for security auditing - common files
ii   libaudit1               1:2.8.4-3                amd64  Dynamic library for security auditing
ii   libblkid1               2.33.1-0.1               amd64  block device ID library
ii   libbz2-1.0              1.0.6-9.2~deb10u2        amd64  high-quality block-sorting file compressor library - runtime
ii   libc-bin                2.28-10+deb10u1          amd64  GNU C Library: Binaries
ii   libc6                   2.28-10+deb10u1          amd64  GNU C Library: Shared libraries
ii   libcap-ng0              0.7.9-2                  amd64  An alternate POSIX capabilities library
ii   libcap2                 1:2.25-2                 amd64  POSIX 1003.1e capabilities (library)
ii   libcap2-bin             1:2.25-2                 amd64  POSIX 1003.1e capabilities (utilities)
ii   libcom-err2             1.44.5-1+deb10u3         amd64  common error description library
ii   libdb5.3                5.3.28+dfsg1-0.5         amd64  Berkeley v5.3 Database Libraries [runtime]
ii   libdebconfclient0       0.249                    amd64  Debian Configuration Management System (C-implementation library)
ii   libelf1                 0.176-1.1                amd64  library to read and write ELF files
ii   libext2fs2              1.44.5-1+deb10u3         amd64  ext2/ext3/ext4 file system libraries
ii   libfdisk1               2.33.1-0.1               amd64  fdisk partitioning library
ii   libffi6                 3.2.1-9                  amd64  Foreign Function Interface library runtime
ii   libgcc1                 1:8.3.0-6                amd64  GCC support library
ii   libgcrypt20             1.8.4-5+deb10u1          amd64  LGPL Crypto library - runtime library
ii   libgmp10                2:6.1.2+dfsg-4+deb10u1   amd64  Multiprecision arithmetic library
ii   libgnutls30             3.6.7-4+deb10u9          amd64  GNU TLS library - main runtime library
ii   libgpg-error0           1.35-1                   amd64  GnuPG development runtime library
ii   libhogweed4             3.4.1-1+deb10u1          amd64  low level cryptographic library (public-key cryptos)
ii   libidn2-0               2.0.5-1+deb10u1          amd64  Internationalized domain names (IDNA2008/TR46) library
ii   liblz4-1                1.8.3-1+deb10u1          amd64  Fast LZ compression algorithm library - runtime
ii   liblzma5                5.2.4-1+deb10u1          amd64  XZ-format compression library
ii   libmnl0                 1.0.4-2                  amd64  minimalistic Netlink communication library
ii   libmount1               2.33.1-0.1               amd64  device mounting library
ii   libncursesw6            6.1+20181013-2+deb10u2   amd64  shared libraries for terminal handling (wide character support)
ii   libnettle6              3.4.1-1+deb10u1          amd64  low level cryptographic library (symmetric and one-way cryptos)
ii   libp11-kit0             0.23.15-2+deb10u1        amd64  library for loading and coordinating access to PKCS#11 modules - runtime
ii   libpam-modules          1.3.1-5                  amd64  Pluggable Authentication Modules for PAM
ii   libpam-modules-bin      1.3.1-5                  amd64  Pluggable Authentication Modules for PAM - helper binaries
ii   libpam-runtime          1.3.1-5                  all    Runtime support for the PAM library
ii   libpam0g                1.3.1-5                  amd64  Pluggable Authentication Modules library
ii   libpcre3                2:8.39-12                amd64  Old Perl 5 Compatible Regular Expression Library - runtime files
ii   libseccomp2             2.3.3-4                  amd64  high level interface to Linux seccomp filter
ii   libselinux1             2.8-1+b1                 amd64  SELinux runtime shared libraries
ii   libsemanage-common      2.8-2                    all    Common files for SELinux policy management libraries
ii   libsemanage1            2.8-2                    amd64  SELinux policy management library
ii   libsepol1               2.8-1                    amd64  SELinux library for manipulating binary security policies
ii   libsmartcols1           2.33.1-0.1               amd64  smart column output alignment library
ii   libss2                  1.44.5-1+deb10u3         amd64  command-line interface parsing library
ii   libstdc++6              8.3.0-6                  amd64  GNU Standard C++ Library v3
ii   libsystemd0             241-7~deb10u8            amd64  systemd utility library
ii   libtasn1-6              4.13-3                   amd64  Manage ASN.1 structures (runtime)
ii   libtinfo6               6.1+20181013-2+deb10u2   amd64  shared low-level terminfo library for terminal handling
ii   libudev1                241-7~deb10u8            amd64  libudev shared library
ii   libunistring2           0.9.10-1                 amd64  Unicode string library for C
ii   libuuid1                2.33.1-0.1               amd64  Universally Unique ID library
ii   libxtables12            1.8.2-4                  amd64  netfilter xtables library
ii   libzstd1                1.3.8+dfsg-3+deb10u2     amd64  fast lossless compression algorithm
ii   login                   1:4.5-1.1                amd64  system login tools
ii   mawk                    1.3.3-17+b3              amd64  a pattern scanning and text processing language
ii   mount                   2.33.1-0.1               amd64  tools for mounting and manipulating filesystems
ii   ncurses-base            6.1+20181013-2+deb10u2   all    basic terminal type definitions
ii   ncurses-bin             6.1+20181013-2+deb10u2   amd64  terminal-related programs and man pages
ii   passwd                  1:4.5-1.1                amd64  change and administer password and group data
ii   perl-base               5.28.1-6+deb10u1         amd64  minimal Perl system
ii   sed                     4.7-1                    amd64  GNU stream editor for filtering/transforming text
ii   sysvinit-utils          2.93-8                   amd64  System-V-like utilities
ii   tar                     1.30+dfsg-6              amd64  GNU version of the tar archiving utility
ii   tzdata                  2021a-0+deb10u7          all    time zone and daylight-saving time data
ii   util-linux              2.33.1-0.1               amd64  miscellaneous system utilities
ii   zlib1g                  1:1.2.11.dfsg-1+deb10u2  amd64  compression library - runtime
```
