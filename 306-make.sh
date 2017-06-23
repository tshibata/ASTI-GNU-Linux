#!/bin/bash

set -e

export PATH=$HOME/host/bin:$HOME/host/sbin:$PATH

cd $HOME/src/

wget --no-clobber http://ftp.gnu.org/gnu/make/make-4.2.tar.bz2

rm -rf make-4.2/

tar xf make-4.2.tar.bz2

cd make-4.2/

mkdir build

cd build/

../configure --host=i686-pc-linux-gnu \
             --prefix=$HOME/target/usr \
             --without-libiconv-prefix \
             --without-libintl-prefix \
             --without-guile

make

make install
