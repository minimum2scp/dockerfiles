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
ii   apt                     2.7.2              amd64  commandline package manager
ii   base-files              13                 amd64  Debian base system miscellaneous files
ii   base-passwd             3.6.1              amd64  Debian base system master password and group files
ii   bash                    5.2.15-2+b3        amd64  GNU Bourne Again SHell
ii   bsdutils                1:2.39.1-3         amd64  basic utilities from 4.4BSD-Lite
ii   coreutils               9.1-1              amd64  GNU core utilities
ii   dash                    0.5.12-6           amd64  POSIX-compliant shell
ii   debconf                 1.5.82             all    Debian configuration management system
ii   debian-archive-keyring  2023.4             all    GnuPG archive keys of the Debian archive
ii   debianutils             5.8-1              amd64  Miscellaneous utilities specific to Debian
ii   diffutils               1:3.8-4            amd64  File comparison utilities
ii   dpkg                    1.21.22            amd64  Debian package management system
ii   e2fsprogs               1.47.0-2           amd64  ext2/ext3/ext4 file system utilities
ii   findutils               4.9.0-5            amd64  utilities for finding files--find, xargs
ii   gcc-13-base             13.2.0-1           amd64  GCC, the GNU Compiler Collection (base package)
ii   gpgv                    2.2.40-1.1         amd64  GNU privacy guard - signature verification tool
ii   grep                    3.11-2             amd64  GNU grep, egrep and fgrep
ii   gzip                    1.12-1             amd64  GNU compression utilities
ii   hostname                3.23+nmu1          amd64  utility to set/show the host name or domain name
ii   init-system-helpers     1.65.2             all    helper tools for all init systems
ii   libacl1                 2.3.1-3            amd64  access control list - shared library
ii   libapt-pkg6.0           2.7.2              amd64  package management runtime library
ii   libattr1                1:2.5.1-4          amd64  extended attribute handling - shared library
ii   libaudit-common         1:3.1.1-1          all    Dynamic library for security auditing - common files
ii   libaudit1               1:3.1.1-1          amd64  Dynamic library for security auditing
ii   libblkid1               2.39.1-3           amd64  block device ID library
ii   libbz2-1.0              1.0.8-5+b1         amd64  high-quality block-sorting file compressor library - runtime
ii   libc-bin                2.37-6             amd64  GNU C Library: Binaries
ii   libc6                   2.37-6             amd64  GNU C Library: Shared libraries
ii   libcap-ng0              0.8.3-1+b3         amd64  alternate POSIX capabilities library
ii   libcap2                 1:2.66-4           amd64  POSIX 1003.1e capabilities (library)
ii   libcom-err2             1.47.0-2           amd64  common error description library
ii   libcrypt1               1:4.4.36-2         amd64  libcrypt shared library
ii   libdb5.3                5.3.28+dfsg2-1     amd64  Berkeley v5.3 Database Libraries [runtime]
ii   libdebconfclient0       0.270              amd64  Debian Configuration Management System (C-implementation library)
ii   libext2fs2              1.47.0-2           amd64  ext2/ext3/ext4 file system libraries
ii   libffi8                 3.4.4-1            amd64  Foreign Function Interface library runtime
ii   libgcc-s1               13.2.0-1           amd64  GCC support library
ii   libgcrypt20             1.10.2-2           amd64  LGPL Crypto library - runtime library
ii   libgmp10                2:6.3.0+dfsg-2     amd64  Multiprecision arithmetic library
ii   libgnutls30             3.7.9-2            amd64  GNU TLS library - main runtime library
ii   libgpg-error0           1.46-1             amd64  GnuPG development runtime library
ii   libhogweed6             3.9.1-2            amd64  low level cryptographic library (public-key cryptos)
ii   libidn2-0               2.3.4-1            amd64  Internationalized domain names (IDNA2008/TR46) library
ii   liblz4-1                1.9.4-1            amd64  Fast LZ compression algorithm library - runtime
ii   liblzma5                5.4.1-0.2          amd64  XZ-format compression library
ii   libmd0                  1.1.0-1            amd64  message digest functions from BSD systems - shared library
ii   libmount1               2.39.1-3           amd64  device mounting library
ii   libnettle8              3.9.1-2            amd64  low level cryptographic library (symmetric and one-way cryptos)
ii   libp11-kit0             0.25.0-4           amd64  library for loading and coordinating access to PKCS#11 modules - runtime
ii   libpam-modules          1.5.2-6            amd64  Pluggable Authentication Modules for PAM
ii   libpam-modules-bin      1.5.2-6            amd64  Pluggable Authentication Modules for PAM - helper binaries
ii   libpam-runtime          1.5.2-6            all    Runtime support for the PAM library
ii   libpam0g                1.5.2-6            amd64  Pluggable Authentication Modules library
ii   libpcre2-8-0            10.42-2            amd64  New Perl Compatible Regular Expression Library- 8 bit runtime files
ii   libseccomp2             2.5.4-1+b3         amd64  high level interface to Linux seccomp filter
ii   libselinux1             3.5-1              amd64  SELinux runtime shared libraries
ii   libsemanage-common      3.5-1              all    Common files for SELinux policy management libraries
ii   libsemanage2            3.5-1              amd64  SELinux policy management library
ii   libsepol2               3.5-1              amd64  SELinux library for manipulating binary security policies
ii   libsmartcols1           2.39.1-3           amd64  smart column output alignment library
ii   libss2                  1.47.0-2           amd64  command-line interface parsing library
ii   libstdc++6              13.2.0-1           amd64  GNU Standard C++ Library v3
ii   libsystemd0             254-1              amd64  systemd utility library
ii   libtasn1-6              4.19.0-3           amd64  Manage ASN.1 structures (runtime)
ii   libtinfo6               6.4+20230625-2     amd64  shared low-level terminfo library for terminal handling
ii   libudev1                254-1              amd64  libudev shared library
ii   libunistring2           1.0-2              amd64  Unicode string library for C
ii   libuuid1                2.39.1-3           amd64  Universally Unique ID library
ii   libxxhash0              0.8.1-1            amd64  shared library for xxhash
ii   libzstd1                1.5.5+dfsg2-1      amd64  fast lossless compression algorithm
ii   login                   1:4.13+dfsg1-1+b1  amd64  system login tools
ii   logsave                 1.47.0-2           amd64  save the output of a command in a log file
ii   mawk                    1.3.4.20230525-1   amd64  Pattern scanning and text processing language
ii   mount                   2.39.1-3           amd64  tools for mounting and manipulating filesystems
ii   ncurses-base            6.4+20230625-2     all    basic terminal type definitions
ii   ncurses-bin             6.4+20230625-2     amd64  terminal-related programs and man pages
ii   passwd                  1:4.13+dfsg1-1+b1  amd64  change and administer password and group data
ii   perl-base               5.36.0-7           amd64  minimal Perl system
ii   sed                     4.9-1              amd64  GNU stream editor for filtering/transforming text
ii   sysvinit-utils          3.07-1             amd64  System-V-like utilities
ii   tar                     1.34+dfsg-1.2      amd64  GNU version of the tar archiving utility
ii   tzdata                  2023c-7            all    time zone and daylight-saving time data
ii   usr-is-merged           35                 all    Transitional package to assert a merged-/usr system
ii   util-linux              2.39.1-3           amd64  miscellaneous system utilities
ii   zlib1g                  1:1.2.13.dfsg-1    amd64  compression library - runtime
```
