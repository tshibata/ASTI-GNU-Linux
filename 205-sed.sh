#!/bin/bash

set -e

export PATH=$HOME/host/bin:$HOME/host/sbin:$PATH

cd $HOME/src/

wget --no-clobber http://ftp.gnu.org/gnu/sed/sed-4.4.tar.xz

rm -rf sed-4.4/

tar xf sed-4.4.tar.xz

cd sed-4.4/

mkdir build

cd build

../configure --host=i686-pc-linux-gnu \
             --prefix=$HOME/target \
             --datarootdir=$HOME/target/usr/share

make

make install
