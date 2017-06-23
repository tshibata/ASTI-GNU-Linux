#!/bin/bash

set -e

export PATH=$HOME/host/bin:$HOME/host/sbin:$PATH

cd $HOME/src/

wget --no-clobber http://ftp.gnu.org/gnu/tar/tar-1.29.tar.xz

rm -rf tar-1.29/

tar xf tar-1.29.tar.xz

cd tar-1.29/

mkdir build

cd build

../configure --host=i686-pc-linux-gnu \
             --prefix=$HOME/target/usr

make

make install
