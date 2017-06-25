#!/bin/bash

set -e

export PATH=$HOME/host/bin:$HOME/host/sbin:$PATH

cd $HOME/src/

cd gcc-6.3.0/

rm -rf build/

mkdir build

cd build/

../configure --host=i686-cross-linux-gnu \
             --prefix=$HOME/target/usr \
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

cp -r $HOME/host/i686-cross-linux-gnu/include/* $HOME/target/usr/include/
cp -r $HOME/host/i686-cross-linux-gnu/lib/* $HOME/target/usr/lib/
cp -r $HOME/host/lib/* $HOME/target/usr/lib/
#FIXME unnecessary files are also copied...
