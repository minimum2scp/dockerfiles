[![Docker Stars](https://img.shields.io/docker/stars/minimum2scp/debian.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/minimum2scp/debian.svg)]()
[![Docker Automated Build](https://img.shields.io/docker/automated/minimum2scp/debian.svg)]()

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
ii   adduser                 3.118                all    add and remove users and groups
ii   apt                     1.8.4                amd64  commandline package manager
ii   base-files              11                   amd64  Debian base system miscellaneous files
ii   base-passwd             3.5.47               amd64  Debian base system master password and group files
ii   bash                    5.0-6                amd64  GNU Bourne Again SHell
ii   bsdutils                1:2.34-0.1           amd64  basic utilities from 4.4BSD-Lite
ii   coreutils               8.30-3+b1            amd64  GNU core utilities
ii   dash                    0.5.10.2-6           amd64  POSIX-compliant shell
ii   debconf                 1.5.73               all    Debian configuration management system
ii   debian-archive-keyring  2019.1               all    GnuPG archive keys of the Debian archive
ii   debianutils             4.9.1                amd64  Miscellaneous utilities specific to Debian
ii   diffutils               1:3.7-3              amd64  File comparison utilities
ii   dpkg                    1.19.7               amd64  Debian package management system
ii   e2fsprogs               1.45.5-2             amd64  ext2/ext3/ext4 file system utilities
ii   fdisk                   2.34-0.1             amd64  collection of partitioning utilities
ii   findutils               4.7.0-1              amd64  utilities for finding files--find, xargs
ii   gcc-10-base             10-20200222-1        amd64  GCC, the GNU Compiler Collection (base package)
ii   gcc-9-base              9.2.1-30             amd64  GCC, the GNU Compiler Collection (base package)
ii   gpgv                    2.2.19-1             amd64  GNU privacy guard - signature verification tool
ii   grep                    3.4-1                amd64  GNU grep, egrep and fgrep
ii   gzip                    1.9-3+b1             amd64  GNU compression utilities
ii   hostname                3.23                 amd64  utility to set/show the host name or domain name
ii   inetutils-ping          2:1.9.4-11           amd64  ICMP echo tool
ii   init-system-helpers     1.57                 all    helper tools for all init systems
ii   iproute2                5.5.0-1              amd64  networking and traffic control tools
ii   libacl1                 2.2.53-5             amd64  access control list - shared library
ii   libapt-pkg5.0           1.8.4                amd64  package management runtime library
ii   libattr1                1:2.4.48-5           amd64  extended attribute handling - shared library
ii   libaudit-common         1:2.8.5-2            all    Dynamic library for security auditing - common files
ii   libaudit1               1:2.8.5-2+b1         amd64  Dynamic library for security auditing
ii   libblkid1               2.34-0.1             amd64  block device ID library
ii   libbsd0                 0.10.0-1             amd64  utility functions from BSD systems - shared library
ii   libbz2-1.0              1.0.8-2              amd64  high-quality block-sorting file compressor library - runtime
ii   libc-bin                2.29-10              amd64  GNU C Library: Binaries
ii   libc6                   2.29-10              amd64  GNU C Library: Shared libraries
ii   libcap-ng0              0.7.9-2.1+b1         amd64  An alternate POSIX capabilities library
ii   libcap2                 1:2.32-1             amd64  POSIX 1003.1e capabilities (library)
ii   libcap2-bin             1:2.32-1             amd64  POSIX 1003.1e capabilities (utilities)
ii   libcom-err2             1.45.5-2             amd64  common error description library
ii   libcrypt1               1:4.4.10-10          amd64  libcrypt shared library
ii   libdb5.3                5.3.28+dfsg1-0.6     amd64  Berkeley v5.3 Database Libraries [runtime]
ii   libdebconfclient0       0.251                amd64  Debian Configuration Management System (C-implementation library)
ii   libelf1                 0.176-1.1            amd64  library to read and write ELF files
ii   libext2fs2              1.45.5-2             amd64  ext2/ext3/ext4 file system libraries
ii   libfdisk1               2.34-0.1             amd64  fdisk partitioning library
ii   libffi7                 3.3-3                amd64  Foreign Function Interface library runtime
ii   libgcc-s1               10-20200222-1        amd64  GCC support library
ii   libgcc1                 1:10-20200222-1      amd64  GCC support library (dependency package)
ii   libgcrypt20             1.8.5-5              amd64  LGPL Crypto library - runtime library
ii   libgmp10                2:6.2.0+dfsg-4       amd64  Multiprecision arithmetic library
ii   libgnutls30             3.6.12-2             amd64  GNU TLS library - main runtime library
ii   libgpg-error0           1.37-1               amd64  GnuPG development runtime library
ii   libhogweed5             3.5.1+really3.5.1-2  amd64  low level cryptographic library (public-key cryptos)
ii   libidn11                1.33-2.2             amd64  GNU Libidn library, implementation of IETF IDN specifications
ii   libidn2-0               2.2.0-2              amd64  Internationalized domain names (IDNA2008/TR46) library
ii   liblz4-1                1.9.2-2              amd64  Fast LZ compression algorithm library - runtime
ii   liblzma5                5.2.4-1+b1           amd64  XZ-format compression library
ii   libmnl0                 1.0.4-2+b1           amd64  minimalistic Netlink communication library
ii   libmount1               2.34-0.1             amd64  device mounting library
ii   libncursesw6            6.1+20191019-1       amd64  shared libraries for terminal handling (wide character support)
ii   libnettle7              3.5.1+really3.5.1-2  amd64  low level cryptographic library (symmetric and one-way cryptos)
ii   libp11-kit0             0.23.20-1            amd64  library for loading and coordinating access to PKCS#11 modules - runtime
ii   libpam-modules          1.3.1-5              amd64  Pluggable Authentication Modules for PAM
ii   libpam-modules-bin      1.3.1-5              amd64  Pluggable Authentication Modules for PAM - helper binaries
ii   libpam-runtime          1.3.1-5              all    Runtime support for the PAM library
ii   libpam0g                1.3.1-5              amd64  Pluggable Authentication Modules library
ii   libpcre2-8-0            10.34-7              amd64  New Perl Compatible Regular Expression Library- 8 bit runtime files
ii   libpcre3                2:8.39-12+b1         amd64  Old Perl 5 Compatible Regular Expression Library - runtime files
ii   libseccomp2             2.4.2-2              amd64  high level interface to Linux seccomp filter
ii   libselinux1             3.0-1+b1             amd64  SELinux runtime shared libraries
ii   libsemanage-common      3.0-1                all    Common files for SELinux policy management libraries
ii   libsemanage1            3.0-1+b1             amd64  SELinux policy management library
ii   libsepol1               3.0-1                amd64  SELinux library for manipulating binary security policies
ii   libsmartcols1           2.34-0.1             amd64  smart column output alignment library
ii   libss2                  1.45.5-2             amd64  command-line interface parsing library
ii   libstdc++6              10-20200222-1        amd64  GNU Standard C++ Library v3
ii   libsystemd0             244.3-1              amd64  systemd utility library
ii   libtasn1-6              4.16.0-2             amd64  Manage ASN.1 structures (runtime)
ii   libtinfo6               6.1+20191019-1       amd64  shared low-level terminfo library for terminal handling
ii   libudev1                244.3-1              amd64  libudev shared library
ii   libunistring2           0.9.10-2             amd64  Unicode string library for C
ii   libuuid1                2.34-0.1             amd64  Universally Unique ID library
ii   libxtables12            1.8.4-3              amd64  netfilter xtables library
ii   libzstd1                1.4.4+dfsg-3         amd64  fast lossless compression algorithm
ii   login                   1:4.8.1-1            amd64  system login tools
ii   logsave                 1.45.5-2             amd64  save the output of a command in a log file
ii   lsb-base                11.1.0               all    Linux Standard Base init script functionality
ii   mawk                    1.3.4.20200120-2     amd64  Pattern scanning and text processing language
ii   mount                   2.34-0.1             amd64  tools for mounting and manipulating filesystems
ii   ncurses-base            6.1+20191019-1       all    basic terminal type definitions
ii   ncurses-bin             6.1+20191019-1       amd64  terminal-related programs and man pages
ii   netbase                 6.1                  all    Basic TCP/IP networking system
ii   passwd                  1:4.8.1-1            amd64  change and administer password and group data
ii   perl-base               5.30.0-9             amd64  minimal Perl system
ii   sed                     4.7-1                amd64  GNU stream editor for filtering/transforming text
ii   sysvinit-utils          2.96-2.1             amd64  System-V-like utilities
ii   tar                     1.30+dfsg-6+b1       amd64  GNU version of the tar archiving utility
ii   tzdata                  2019c-3              all    time zone and daylight-saving time data
ii   util-linux              2.34-0.1             amd64  miscellaneous system utilities
ii   zlib1g                  1:1.2.11.dfsg-2      amd64  compression library - runtime
```
