#!/bin/bash

set -e

export PATH=$HOSTDIR/bin:$HOSTDIR/sbin:$PATH

cd $SRCDIR

wget --no-clobber http://ftp.gnu.org/gnu/sed/sed-4.4.tar.xz

rm -rf sed-4.4/

tar xf sed-4.4.tar.xz

cd sed-4.4/

mkdir build

cd build

../configure --host=i686-cross-linux-gnu \
             --prefix=$TARGETDIR \
             --datarootdir=$TARGETDIR/usr/share

make

make install
