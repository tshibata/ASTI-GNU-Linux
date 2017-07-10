#!/bin/bash

set -e

export PATH=$HOSTDIR/bin:$HOSTDIR/sbin:$PATH

cd $SRCDIR

wget --no-clobber http://ftp.gnu.org/gnu/tar/tar-1.29.tar.xz

rm -rf tar-1.29/

tar xf tar-1.29.tar.xz

cd tar-1.29/

mkdir build

cd build

../configure --host=i686-cross-linux-gnu \
             --prefix=$TARGETDIR/usr

make

make install
