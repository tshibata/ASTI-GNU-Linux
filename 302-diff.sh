#!/bin/bash

set -e

export PATH=$HOSTDIR/bin:$HOSTDIR/sbin:$PATH

cd $SRCDIR

wget --no-clobber http://ftp.gnu.org/gnu/diffutils/diffutils-3.6.tar.xz

rm -rf diffutils-3.6/

tar xf diffutils-3.6.tar.xz

cd diffutils-3.6/

mkdir build

cd build

../configure --host=i686-cross-linux-gnu \
             --prefix=$TARGETDIR/usr

make

make install
