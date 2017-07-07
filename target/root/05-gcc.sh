#!/bin/bash

set -e

cd gcc-6.3.0/

rm -rf build/

mkdir build

cd build/

../configure --prefix=/usr \
             --disable-bootstrap \
             --enable-languages=c,c++

make

make install

ln -s gcc /usr/bin/cc
