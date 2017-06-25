#!/bin/bash
set -e

export PATH=$HOME/host/bin:$HOME/host/sbin:$PATH

cd $HOME/src/

cd binutils-2.28/

rm -rf build

mkdir build

cd build/

../configure --host=i686-cross-linux-gnu \
             --prefix=$HOME/target/usr \
             --disable-shared \
             --disable-nls

make

make install
