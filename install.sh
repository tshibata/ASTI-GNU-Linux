#!/bin/bash

set -e

export SRCDIR=`pwd`/work/src
export HOSTDIR=`pwd`/work/host
export TARGETDIR=`pwd`/work/target

test $(id -u) = 0 || { echo "You must be root user."; exit 1; }

export PATH=$HOSTDIR/bin:$HOSTDIR/sbin:$PATH

MNT=`mktemp -d`

mount -v /dev/sdb2 $MNT
rm -rf $MNT/*
mkdir $MNT/boot
mount -v /dev/sdb1 $MNT/boot
rm -rf $MNT/boot/*

cp -r --preserve=mode,timestamps literal/* mock/* $MNT
rm `find $MNT -name .gitkeep`

cp -r --preserve=mode,timestamps $TARGETDIR/* $MNT

echo "$(hostname)" > $MNT/etc/hostname
echo "127.0.0.1 localhost $(hostname)" > $MNT/etc/hosts

# Prepare for SSL by the target.
$MNT/etc/ssl/cacert.sh

# Make /root only for root
chmod -v 700 $MNT/root

# Set sticky bit on /tmp
chmod -v 1777 $MNT/tmp

# Allow utmp(13 on the target) to leave records
chgrp 13 $MNT $MNT/var/log/lastlog
chmod -v 664 $MNT/var/log/lastlog

dumpkeys < /dev/tty1 > $MNT/etc/key.map

pushd $MNT/root
tar xf $SRCDIR/ncurses-6.0.tar.gz
tar xf $SRCDIR/readline-7.0.tar.gz
tar xf $SRCDIR/bash-4.4.tar.gz
for PATCH in bash44-{001..012}
do
  patch --directory=bash-4.4 -p0 -i $SRCDIR/$PATCH
done

tar xf $SRCDIR/binutils-2.28.tar.bz2
tar xf $SRCDIR/mpc-1.0.3.tar.gz
tar xf $SRCDIR/gmp-6.1.2.tar.xz
tar xf $SRCDIR/mpfr-3.1.5.tar.xz
tar xf $SRCDIR/gcc-6.3.0.tar.bz2
ln -s ../mpc-1.0.3 gcc-6.3.0/mpc
ln -s ../gmp-6.1.2 gcc-6.3.0/gmp
ln -s ../mpfr-3.1.5 gcc-6.3.0/mpfr

tar xf $SRCDIR/perl-5.24.1.tar.gz
tar xf $SRCDIR/autoconf-2.69.tar.xz
tar xf $SRCDIR/automake-1.15.tar.xz
tar xf $SRCDIR/util-linux-2.30.tar.xz
tar xf $SRCDIR/e2fsprogs-1.43.4.tar.gz

tar xf $SRCDIR/gperf-3.1.tar.gz
tar xf $SRCDIR/eudev-3.2.2.tar.gz
tar xf $SRCDIR/inetutils-1.9.4.tar.xz
tar xf $SRCDIR/dhcpcd-6.11.5.tar.xz
tar xf $SRCDIR/sysklogd-1.5.1.tar.gz
tar xf $SRCDIR/shadow-4.5.tar.xz

tar xf $SRCDIR/pkg-config-0.29.2.tar.gz
tar xf $SRCDIR/m4-1.4.18.tar.xz
tar xf $SRCDIR/bison-3.0.4.tar.xz
tar xf $SRCDIR/flex-2.6.3.tar.gz
tar xf $SRCDIR/patch-2.7.5.tar.xz
tar xf $SRCDIR/texinfo-6.3.tar.xz
tar xf $SRCDIR/bc-1.06.95.tar.bz2

tar xf $SRCDIR/zlib-1.2.11.tar.xz
tar xf $SRCDIR/gzip-1.8.tar.xz
tar xf $SRCDIR/bzip2-1.0.6.tar.gz
tar xf $SRCDIR/xz-5.2.3.tar.xz
tar xf $SRCDIR/openssl-1.0.2l.tar.gz
tar xf $SRCDIR/wget-1.19.1.tar.xz
tar xf $SRCDIR/curl-7.54.1.tar.gz
tar xf $SRCDIR/gettext-0.19.8.1.tar.xz
tar xf $SRCDIR/git-2.13.3.tar.xz
tar xf $SRCDIR/nano-2.8.5.tar.xz
tar xf $SRCDIR/parted-3.1.tar.xz
popd

grub-install --target=i386-pc --boot-directory=$MNT/boot /dev/sdb

umount /dev/sdb1
umount /dev/sdb2

rmdir $MNT

echo ok
