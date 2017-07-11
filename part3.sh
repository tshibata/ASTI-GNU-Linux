#!/bin/bash

# Let's make it ready for self compile.

set -e

./301-binutils.sh
./302-diff.sh
./303-find.sh
./304-gawk.sh
./305-gcc.sh
./306-make.sh
./307-tar.sh

pushd $SRCDIR
for PATCH in bash44-{001..012}
do
  wget --no-clobber http://ftp.gnu.org/gnu/bash/bash-4.4-patches/$PATCH
done
wget --no-clobber http://ftp.gnu.org/gnu//ncurses/ncurses-6.0.tar.gz
wget --no-clobber http://ftp.gnu.org/gnu/readline/readline-7.0.tar.gz
wget --no-clobber http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz
wget --no-clobber http://ftp.gnu.org/gnu/automake/automake-1.15.tar.xz
wget --no-clobber http://dev.gentoo.org/~blueness/eudev/eudev-3.2.2.tar.gz
wget --no-clobber http://ftp.gnu.org/gnu/inetutils/inetutils-1.9.4.tar.xz
wget --no-clobber http://roy.marples.name/downloads/dhcpcd/dhcpcd-6.11.5.tar.xz
wget --no-clobber http://www.infodrom.org/projects/sysklogd/download/sysklogd-1.5.1.tar.gz
wget --no-clobber https://github.com/shadow-maint/shadow/releases/download/4.5/shadow-4.5.tar.xz
wget --no-clobber https://pkg-config.freedesktop.org/releases/pkg-config-0.29.2.tar.gz
wget --no-clobber http://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.xz
wget --no-clobber http://ftp.gnu.org/gnu/bison/bison-3.0.4.tar.xz
wget --no-clobber https://github.com/westes/flex/releases/download/v2.6.3/flex-2.6.3.tar.gz
wget --no-clobber http://ftp.gnu.org/gnu/patch/patch-2.7.5.tar.xz
wget --no-clobber http://ftp.gnu.org/gnu/texinfo/texinfo-6.3.tar.xz
wget --no-clobber http://alpha.gnu.org/gnu/bc/bc-1.06.95.tar.bz2
wget --no-clobber http://zlib.net/zlib-1.2.11.tar.xz
wget --no-clobber http://ftp.gnu.org/gnu/gzip/gzip-1.8.tar.xz
wget --no-clobber http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz
wget --no-clobber https://tukaani.org/xz/xz-5.2.3.tar.xz
wget --no-clobber http://www.cpan.org/src/5.0/perl-5.24.1.tar.gz
wget --no-clobber https://www.openssl.org/source/openssl-1.0.2l.tar.gz
wget --no-clobber https://curl.haxx.se/download/curl-7.54.1.tar.gz
wget --no-clobber http://ftp.gnu.org/gnu/wget/wget-1.19.1.tar.xz
wget --no-clobber https://nano-editor.org/dist/v2.8/nano-2.8.5.tar.xz
popd
