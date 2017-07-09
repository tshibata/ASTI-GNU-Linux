#!/bin/bash

set -e

export PATH=$HOME/host/bin:$HOME/host/sbin:$PATH

cd $HOME/src/

wget --no-clobber https://www.kernel.org/pub/linux/utils/util-linux/v2.29/util-linux-2.29.tar.xz

rm -rf util-linux-2.29/

tar xf util-linux-2.29.tar.xz

cd util-linux-2.29/

mkdir build

cd build/

# Install only fsck, kill, mount (including umount), mountpoint and sulogin.

../configure PKG_CONFIG='' \
             --host=i686-cross-linux-gnu \
             --prefix=$HOME/target \
             --include=$HOME/target/usr/include \
             --datarootdir=$HOME/target/usr/share \
             --without-python \
             --without-systemd \
             --disable-shared \
             --disable-makeinstall-chown \
             --disable-all-programs \
             --enable-fsck \
             --enable-kill \
             --enable-libblkid \
             --enable-libmount \
             --enable-mount \
             --enable-mountpoint \
             --enable-sulogin

make

make install
