#!/bin/bash

set -e

export PATH=$HOME/host/bin:$HOME/host/sbin:$PATH

cd $HOME/src/

wget --no-clobber http://ftp.gnu.org/gnu/grep/grep-3.0.tar.xz

rm -rf grep-3.0/

tar xf grep-3.0.tar.xz

cd grep-3.0/

mkdir build

cd build

../configure --host=i686-cross-linux-gnu \
             --prefix=$HOME/target \
             --datarootdir=$HOME/target/usr/share

make

make install
