#!/bin/bash

set -e

cd eudev-3.2.2/

rm -rf build/

mkdir build

cd build

../configure --prefix= \
             --includedir=/usr/include \
             --datarootdir=/usr/share

make

make install
