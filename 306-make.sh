#!/bin/bash

set -e

export PATH=$HOSTDIR/bin:$HOSTDIR/sbin:$PATH

cd $SRCDIR

wget --no-clobber http://ftp.gnu.org/gnu/make/make-4.2.tar.bz2

rm -rf make-4.2/

tar xf make-4.2.tar.bz2

cd make-4.2/

mkdir build

cd build/

../configure --host=i686-cross-linux-gnu \
             --prefix=$TARGETDIR/usr \
             --without-libiconv-prefix \
             --without-libintl-prefix \
             --without-guile

make

make install
