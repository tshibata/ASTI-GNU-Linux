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

pushd $HOME/src
wget --no-clobber http://ftp.gnu.org/gnu//ncurses/ncurses-6.0.tar.gz
wget --no-clobber http://ftp.gnu.org/gnu/readline/readline-7.0.tar.gz
wget --no-clobber http://dev.gentoo.org/~blueness/eudev/eudev-3.2.2.tar.gz
wget --no-clobber http://ftp.gnu.org/gnu/inetutils/inetutils-1.9.4.tar.xz
wget --no-clobber http://roy.marples.name/downloads/dhcpcd/dhcpcd-6.11.5.tar.xz
wget --no-clobber http://www.infodrom.org/projects/sysklogd/download/sysklogd-1.5.1.tar.gz
wget --no-clobber https://github.com/shadow-maint/shadow/releases/download/4.5/shadow-4.5.tar.xz
popd

# Prepare for SSL by the target.
$HOME/target/etc/ssl/cacert.sh
