# about minimum2scp/debian-wheezy image

 * Debian wheezy (7.x) amd64
 * Almost same as debian:wheezy image ([semi official debian image](https://registry.hub.docker.com/_/debian/))

## build minimum2scp/debian-wheezy image

Run following commands on your Debian (requires debootstrap)

```
$ git clone https://github.com/minimum2scp/dockerfiles.git
$ cd dockerfiles/debian-wheezy
$ rake mkimage TAG=minimum2scp/debian-wheezy:latest
```

## packages

installed packages (`docker run --rm minimum2scp/debian-wheezy:latest bash -c "LANG=C COLUMNS=120 dpkg -l"`)

```
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name                     Version           Architecture      Description
+++-========================-=================-=================-=====================================================
ii  apt                      0.9.7.9+deb7u7    amd64             commandline package manager
ii  base-files               7.1wheezy8        amd64             Debian base system miscellaneous files
ii  base-passwd              3.5.26            amd64             Debian base system master password and group files
ii  bash                     4.2+dfsg-0.1+deb7 amd64             GNU Bourne Again SHell
ii  bsdutils                 1:2.20.1-5.3      amd64             Basic utilities from 4.4BSD-Lite
ii  coreutils                8.13-3.5          amd64             GNU core utilities
ii  dash                     0.5.7-3           amd64             POSIX-compliant shell
ii  debconf                  1.5.49            all               Debian configuration management system
ii  debconf-i18n             1.5.49            all               full internationalization support for debconf
ii  debian-archive-keyring   2014.3~deb7u1     all               GnuPG archive keys of the Debian archive
ii  debianutils              4.3.2             amd64             Miscellaneous utilities specific to Debian
ii  diffutils                1:3.2-6           amd64             File comparison utilities
ii  dpkg                     1.16.16           amd64             Debian package management system
ii  e2fslibs:amd64           1.42.5-1.1+deb7u1 amd64             ext2/ext3/ext4 file system libraries
ii  e2fsprogs                1.42.5-1.1+deb7u1 amd64             ext2/ext3/ext4 file system utilities
ii  findutils                4.4.2-4           amd64             utilities for finding files--find, xargs
ii  gcc-4.7-base:amd64       4.7.2-5           amd64             GCC, the GNU Compiler Collection (base package)
ii  gnupg                    1.4.12-7+deb7u7   amd64             GNU privacy guard - a free PGP replacement
ii  gpgv                     1.4.12-7+deb7u7   amd64             GNU privacy guard - signature verification tool
ii  grep                     2.12-2            amd64             GNU grep, egrep and fgrep
ii  gzip                     1.5-1.1           amd64             GNU compression utilities
ii  hostname                 3.11              amd64             utility to set/show the host name or domain name
ii  inetutils-ping           2:1.9-2           amd64             ICMP echo tool
ii  initscripts              2.88dsf-41+deb7u1 amd64             scripts for initializing and shutting down the system
ii  insserv                  1.14.0-5          amd64             boot sequence organizer using LSB init.d script depen
ii  iproute                  20120521-3+b3     amd64             networking and traffic control tools
ii  libacl1:amd64            2.2.51-8          amd64             Access control list shared library
ii  libapt-pkg4.12:amd64     0.9.7.9+deb7u7    amd64             package managment runtime library
ii  libattr1:amd64           1:2.4.46-8        amd64             Extended attribute shared library
ii  libblkid1:amd64          2.20.1-5.3        amd64             block device id library
ii  libbz2-1.0:amd64         1.0.6-4           amd64             high-quality block-sorting file compressor library - 
ii  libc-bin                 2.13-38+deb7u8    amd64             Embedded GNU C Library: Binaries
ii  libc6:amd64              2.13-38+deb7u8    amd64             Embedded GNU C Library: Shared libraries
ii  libcomerr2:amd64         1.42.5-1.1+deb7u1 amd64             common error description library
ii  libdb5.1:amd64           5.1.29-5          amd64             Berkeley v5.1 Database Libraries [runtime]
ii  libgcc1:amd64            1:4.7.2-5         amd64             GCC support library
ii  liblocale-gettext-perl   1.05-7+b1         amd64             module using libc functions for internationalization 
ii  liblzma5:amd64           5.1.1alpha+201206 amd64             XZ-format compression library
ii  libmount1                2.20.1-5.3        amd64             block device id library
ii  libncurses5:amd64        5.9-10            amd64             shared libraries for terminal handling
ii  libpam-modules:amd64     1.1.3-7.1         amd64             Pluggable Authentication Modules for PAM
ii  libpam-modules-bin       1.1.3-7.1         amd64             Pluggable Authentication Modules for PAM - helper bin
ii  libpam-runtime           1.1.3-7.1         all               Runtime support for the PAM library
ii  libpam0g:amd64           1.1.3-7.1         amd64             Pluggable Authentication Modules library
ii  libreadline6:amd64       6.2+dfsg-0.1      amd64             GNU readline and history libraries, run-time librarie
ii  libselinux1:amd64        2.1.9-5           amd64             SELinux runtime shared libraries
ii  libsemanage-common       2.1.6-6           all               Common files for SELinux policy management libraries
ii  libsemanage1:amd64       2.1.6-6           amd64             SELinux policy management library
ii  libsepol1:amd64          2.1.4-3           amd64             SELinux library for manipulating binary security poli
ii  libslang2:amd64          2.2.4-15          amd64             S-Lang programming library - runtime version
ii  libss2:amd64             1.42.5-1.1+deb7u1 amd64             command-line interface parsing library
ii  libstdc++6:amd64         4.7.2-5           amd64             GNU Standard C++ Library v3
ii  libtext-charwidth-perl   0.04-7+b1         amd64             get display widths of characters on the terminal
ii  libtext-iconv-perl       1.7-5             amd64             converts between character sets in Perl
ii  libtext-wrapi18n-perl    0.06-7            all               internationalized substitute of Text::Wrap
ii  libtinfo5:amd64          5.9-10            amd64             shared low-level terminfo library for terminal handli
ii  libusb-0.1-4:amd64       2:0.1.12-20+nmu1  amd64             userspace USB programming library
ii  libustr-1.0-1:amd64      1.0.4-3           amd64             Micro string library: shared library
ii  libuuid1:amd64           2.20.1-5.3        amd64             Universally Unique ID library
ii  login                    1:4.1.5.1-1       amd64             system login tools
ii  lsb-base                 4.1+Debian8+deb7u all               Linux Standard Base 4.1 init script functionality
ii  mawk                     1.3.3-17          amd64             a pattern scanning and text processing language
ii  mount                    2.20.1-5.3        amd64             Tools for mounting and manipulating filesystems
ii  multiarch-support        2.13-38+deb7u8    amd64             Transitional package to ensure multiarch compatibilit
ii  ncurses-base             5.9-10            all               basic terminal type definitions
ii  ncurses-bin              5.9-10            amd64             terminal-related programs and man pages
ii  netbase                  5.0               all               Basic TCP/IP networking system
ii  passwd                   1:4.1.5.1-1       amd64             change and administer password and group data
ii  perl-base                5.14.2-21+deb7u2  amd64             minimal Perl system
ii  readline-common          6.2+dfsg-0.1      all               GNU readline and history libraries, common files
ii  sed                      4.2.1-10          amd64             The GNU sed stream editor
ii  sensible-utils           0.0.7             all               Utilities for sensible alternative selection
ii  sysv-rc                  2.88dsf-41+deb7u1 all               System-V-like runlevel change mechanism
ii  sysvinit                 2.88dsf-41+deb7u1 amd64             System-V-like init utilities
ii  sysvinit-utils           2.88dsf-41+deb7u1 amd64             System-V-like utilities
ii  tar                      1.26+dfsg-0.1     amd64             GNU version of the tar archiving utility
ii  tzdata                   2015e-0+deb7u1    all               time zone and daylight-saving time data
ii  util-linux               2.20.1-5.3        amd64             Miscellaneous system utilities
ii  xz-utils                 5.1.1alpha+201206 amd64             XZ-format compression utilities
ii  zlib1g:amd64             1:1.2.7.dfsg-13   amd64             compression library - runtime
```
