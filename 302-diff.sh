#!/bin/bash

set -e

export PATH=$HOME/host/bin:$HOME/host/sbin:$PATH

cd $HOME/src/

wget --no-clobber http://ftp.gnu.org/gnu/diffutils/diffutils-3.6.tar.xz

rm -rf diffutils-3.6/

tar xf diffutils-3.6.tar.xz

cd diffutils-3.6/

mkdir build

cd build

../configure --host=i686-pc-linux-gnu \
             --prefix=$HOME/target/usr

make

make install
