#!/bin/bash

set -e

cd ncurses-6.0/

rm -rf build/

mkdir build

cd build/

../configure --prefix=/usr \
             --bindir=/bin \
             --libdir=/lib \
             --enable-widec

make

make install

# If prefix is /, it says:
# ** Include-directory is not in a standard location
# Even --includedir=/usr/include does not help.
