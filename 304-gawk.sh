#!/bin/bash

set -e

export PATH=$HOSTDIR/bin:$HOSTDIR/sbin:$PATH

cd $SRCDIR

wget --no-clobber http://ftp.gnu.org/gnu/gawk/gawk-4.1.4.tar.xz
rm -rf gawk-4.1.4/
tar xf gawk-4.1.4.tar.xz
cd gawk-4.1.4/
mkdir build
cd build/

../configure --host=i686-cross-linux-gnu \
             --prefix=$TARGETDIR/usr

make

make install
