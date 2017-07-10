#!/bin/bash
set -e

export PATH=$HOSTDIR/bin:$HOSTDIR/sbin:$PATH

cd $SRCDIR

cd binutils-2.28/

rm -rf build

mkdir build

cd build/

../configure --host=i686-cross-linux-gnu \
             --prefix=$TARGETDIR/usr \
             --disable-shared \
             --disable-nls

make

make install
