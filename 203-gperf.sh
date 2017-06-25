#!/bin/bash

set -e

export PATH=$HOME/host/bin:$HOME/host/sbin:$PATH

cd $HOME/src/

wget --no-clobber http://ftp.gnu.org/gnu/gperf/gperf-3.1.tar.gz
rm -rf gperf-3.1/
tar xf gperf-3.1.tar.gz
cd gperf-3.1/
mkdir build
cd build/

../configure --host=i686-cross-linux-gnu \
             --prefix=$HOME/target/usr \
             --disable-shared

make

make install
