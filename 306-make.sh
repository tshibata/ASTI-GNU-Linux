#!/bin/bash

set -e

export PATH=$HOSTDIR/bin:$HOSTDIR/sbin:$PATH

cd $SRCDIR

wget --no-clobber http://ftp.gnu.org/gnu/make/make-4.2.1.tar.gz

rm -rf make-4.2.1/

tar xf make-4.2.1.tar.gz

cd make-4.2.1/

mkdir build

cd build/

../configure --host=i686-cross-linux-gnu \
             --prefix=$TARGETDIR/usr \
             --without-libiconv-prefix \
             --without-libintl-prefix \
             --without-guile

make

make install
