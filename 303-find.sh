#!/bin/bash

set -e

export PATH=$HOSTDIR/bin:$HOSTDIR/sbin:$PATH

cd $SRCDIR

wget --no-clobber http://ftp.gnu.org/gnu/findutils/findutils-4.6.0.tar.gz

rm -rf findutils-4.6.0/

tar xf findutils-4.6.0.tar.gz

cd findutils-4.6.0/

mkdir build

cd build

../configure --host=i686-cross-linux-gnu \
             --prefix=$TARGETDIR/usr

make

make install
