#!/bin/bash

set -e

cd bash-4.4/

rm -rf build/

mkdir build

cd build/

../configure --prefix=/ \
             --includedir=/usr/include/ \
             --datarootdir=/usr/share/ \
             --without-bash-malloc

make

make install
