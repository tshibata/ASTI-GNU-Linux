#!/bin/bash

set -e

export PATH=$HOSTDIR/bin:$HOSTDIR/sbin:$PATH

cd $SRCDIR

wget --no-clobber https://www.kernel.org/pub/linux/utils/util-linux/v2.30/util-linux-2.30.tar.xz

rm -rf util-linux-2.30/

tar xf util-linux-2.30.tar.xz

cd util-linux-2.30/

mkdir build

cd build/

# Install only hwclock, kill, mount (including umount), mountpoint and sulogin.
# Omit fsck because it fails in execution unless e2fsprogs.
# It does not recognize '--enable-swapon'.

../configure PKG_CONFIG='' \
             --host=i686-cross-linux-gnu \
             --prefix=$TARGETDIR \
             --include=$TARGETDIR/usr/include \
             --datarootdir=$TARGETDIR/usr/share \
             --without-python \
             --without-systemd \
             --disable-shared \
             --disable-makeinstall-chown \
             --disable-all-programs \
             --enable-hwclock \
             --enable-kill \
             --enable-libblkid \
             --enable-libmount \
             --enable-mount \
             --enable-mountpoint \
             --enable-sulogin

make

make install
