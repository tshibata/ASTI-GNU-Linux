#!/bin/bash

set -e

cd util-linux-2.30

rm -rf build/

mkdir build

cd build

../configure --prefix= \
             --include=/usr/include \
             --datarootdir=/usr/share

make

make install
