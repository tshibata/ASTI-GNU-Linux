#!/bin/bash

set -e

cd readline-7.0/

rm -rf build/

mkdir build

cd build/

../configure --prefix=/ \
             --includedir=/usr/include/ \
             --datarootdir=/usr/share/

#make SHLIB_LIBS=-lncurses

#make SHLIB_LIBS=-lncurses install

make

make install
