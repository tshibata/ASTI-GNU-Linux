#!/bin/bash

set -e

test $(id -u) = 0 || { echo "You must be root user."; exit 1; }

export PATH=$HOME/host/bin:$HOME/host/sbin:$PATH

MNT=`mktemp -d`

mount -v /dev/sdb2 $MNT
rm -rf $MNT/*
mkdir $MNT/boot
mount -v /dev/sdb1 $MNT/boot
rm -rf $MNT/boot/*

cp -r --preserve=mode,timestamps $HOME/target/* $MNT

# Make /root only for root
chmod -v 700 $MNT/root

# Set sticky bit on /tmp
chmod -v 1777 $MNT/tmp

# Allow utmp(13 on the target) to leave records
chgrp 13 $MNT/run/utmp $MNT/var/log/btmp $MNT/var/log/lastlog $MNT/var/log/wtmp
chmod -v 664  $MNT/run/utmp $MNT/var/log/btmp $MNT/var/log/lastlog $MNT/var/log/wtmp

dumpkeys < /dev/tty1 > $MNT/etc/key.map

pushd $MNT/root
tar xf $HOME/src/ncurses-6.0.tar.gz
tar xf $HOME/src/readline-7.0.tar.gz
tar xf $HOME/src/bash-4.4.tar.gz

tar xf $HOME/src/binutils-2.28.tar.bz2
tar xf $HOME/src/mpc-1.0.3.tar.gz
tar xf $HOME/src/gmp-6.1.2.tar.xz
tar xf $HOME/src/mpfr-3.1.5.tar.xz
tar xf $HOME/src/gcc-6.3.0.tar.bz2
ln -s ../mpc-1.0.3 gcc-6.3.0/mpc
ln -s ../gmp-6.1.2 gcc-6.3.0/gmp
ln -s ../mpfr-3.1.5 gcc-6.3.0/mpfr

tar xf $HOME/src/perl-5.24.1.tar.gz
tar xf $HOME/src/autoconf-2.69.tar.xz
tar xf $HOME/src/automake-1.15.tar.xz
tar xf $HOME/src/util-linux-2.29.tar.xz

tar xf $HOME/src/eudev-3.2.2.tar.gz
tar xf $HOME/src/inetutils-1.9.4.tar.xz
tar xf $HOME/src/dhcpcd-6.11.5.tar.xz
tar xf $HOME/src/sysklogd-1.5.1.tar.gz
tar xf $HOME/src/shadow-4.5.tar.xz

tar xf $HOME/src/pkg-config-0.29.2.tar.gz
tar xf $HOME/src/m4-1.4.18.tar.xz
tar xf $HOME/src/bison-3.0.4.tar.xz
tar xf $HOME/src/flex-2.6.3.tar.gz
tar xf $HOME/src/patch-2.7.5.tar.xz
tar xf $HOME/src/texinfo-6.3.tar.xz
tar xf $HOME/src/bc-1.06.95.tar.bz2

tar xf $HOME/src/zlib-1.2.11.tar.xz
tar xf $HOME/src/gzip-1.8.tar.xz
tar xf $HOME/src/bzip2-1.0.6.tar.gz
tar xf $HOME/src/xz-5.2.3.tar.xz
tar xf $HOME/src/openssl-1.0.2l.tar.gz
tar xf $HOME/src/wget-1.19.1.tar.xz
tar xf $HOME/src/curl-7.54.1.tar.gz
tar xf $HOME/src/nano-2.8.5.tar.xz
popd

grub-install --target=i386-pc --boot-directory=$MNT/boot /dev/sdb

umount /dev/sdb1
umount /dev/sdb2

rmdir $MNT

echo ok
