#!/bin/bash

set -e

export PATH=$HOSTDIR/bin:$HOSTDIR/sbin:$PATH

cd $SRCDIR

wget --no-clobber http://ftp.gnu.org/gnu/grep/grep-3.1.tar.xz

rm -rf grep-3.1/

tar xf grep-3.1.tar.xz

cd grep-3.1/

mkdir build

cd build

../configure --host=i686-cross-linux-gnu \
             --prefix=$TARGETDIR \
             --datarootdir=$TARGETDIR/usr/share

make

make install
