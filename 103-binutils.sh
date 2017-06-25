#!/bin/bash

set -e

export PATH=$HOME/host/bin:$HOME/host/sbin:$PATH

cd $HOME/src/

wget --no-clobber http://ftp.gnu.org/gnu/binutils/binutils-2.28.tar.bz2

rm -rf binutils-2.28/

tar xf binutils-2.28.tar.bz2

cd binutils-2.28/

mkdir build

cd build/

../configure --target=i686-cross-linux-gnu \
             --program-prefix=i686-cross-linux-gnu- \
             --prefix=$HOME/host \
             --with-sysroot=$HOME/target

make

make install
