#!/bin/bash

set -e

cd gzip-1.8

rm -rf build/

mkdir build

cd build

../configure --prefix=/usr

make

make install
