#!/bin/bash

set -e

export PATH=$HOSTDIR/bin:$HOSTDIR/sbin:$PATH

cd $SRCDIR

wget --no-clobber http://ftp.gnu.org/gnu/gperf/gperf-3.1.tar.gz
rm -rf gperf-3.1/
tar xf gperf-3.1.tar.gz
cd gperf-3.1/
mkdir build
cd build/

../configure --host=i686-cross-linux-gnu \
             --prefix=$TARGETDIR/usr \
             --disable-shared

make

make install
