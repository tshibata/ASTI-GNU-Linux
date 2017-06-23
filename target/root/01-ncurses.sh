#!/bin/bash

set -e

cd ncurses-6.0/

rm -rf build/

mkdir build

cd build/

../configure --prefix=/ \
             --includedir=/usr/include/ \
             --datarootdir=/usr/share/ \
             --enable-widec

#             --enable-overwrite

make

make install
