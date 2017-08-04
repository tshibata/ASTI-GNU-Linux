#!/bin/bash

set -e

export PATH=$HOSTDIR/bin:$HOSTDIR/sbin:$PATH

cd $SRCDIR

wget --no-clobber https://www.kernel.org/pub/linux/utils/kbd/kbd-2.0.4.tar.xz

rm -rf kbd-2.0.4/

tar xf kbd-2.0.4.tar.xz

cd kbd-2.0.4/

mkdir build

cd build/

../configure PKG_CONFIG='' \
             --host=i686-cross-linux-gnu \
             --prefix=$TARGETDIR \
             --datarootdir=$TARGETDIR/usr/share \
             --disable-vlock

# Unless --disable-vlock, you need PEM

make

make install
