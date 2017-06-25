#!/bin/bash

set -e

export PATH=$HOME/host/bin:$HOME/host/sbin:$PATH

cd $HOME/src/

wget --no-clobber https://github.com/shadow-maint/shadow/releases/download/4.5/shadow-4.5.tar.xz

rm -rf shadow-4.5/

tar xf shadow-4.5.tar.xz

cd shadow-4.5/

mkdir build

cd build/

../configure --host=i686-cross-linux-gnu \
             --prefix=$HOME/target \
             --datarootdir=$HOME/target/usr/share \
             --disable-shared

make

make install
