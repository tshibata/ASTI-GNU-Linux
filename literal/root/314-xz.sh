#!/bin/bash

set -e

cd xz-5.2.3

rm -rf build/

mkdir build

cd build

../configure --prefix=/usr

make

make install
