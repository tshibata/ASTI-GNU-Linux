#!/bin/bash

set -e

export PATH=$HOSTDIR/bin:$HOSTDIR/sbin:$PATH

cd $SRCDIR

cd gcc-6.3.0/

rm -rf build/

mkdir build

cd build/

../configure --host=i686-cross-linux-gnu \
             --prefix=$TARGETDIR/usr \
             --disable-shared \
             --disable-threads \
             --disable-libatomic \
             --disable-libgomp \
             --disable-libmpx \
             --disable-libquadmath \
             --disable-libssp \
             --disable-libvtv \
             --enable-languages=c,c++

make all-gcc

make install-gcc

cp -r $HOSTDIR/i686-cross-linux-gnu/include/* $TARGETDIR/usr/include/
cp -r $HOSTDIR/i686-cross-linux-gnu/lib/* $TARGETDIR/usr/lib/
cp -r $HOSTDIR/lib/* $TARGETDIR/usr/lib/
#FIXME unnecessary files are also copied...
