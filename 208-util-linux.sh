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

../configure PKG_CONFIG='' \
             --host=i686-cross-linux-gnu \
             --disable-makeinstall-chown \
             --prefix=$HOME/target \
             --include=$HOME/target/usr/include \
             --datarootdir=$HOME/target/usr/share \
             --without-python \
             --without-systemd \
             --disable-shared

make

make install
