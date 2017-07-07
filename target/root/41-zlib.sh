#!/bin/bash

set -e

cd zlib-1.2.11

rm -rf build/

mkdir build

cd build

../configure --prefix=/usr

make

make install
