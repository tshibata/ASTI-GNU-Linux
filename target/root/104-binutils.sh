#!/bin/bash
set -e

cd binutils-2.28/

rm -rf build

mkdir build

cd build/

../configure --prefix=/usr

make

make install
