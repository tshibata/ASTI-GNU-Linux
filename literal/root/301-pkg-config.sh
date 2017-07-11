#!/bin/bash

set -e

cd pkg-config-0.29.2

rm -rf build/

mkdir build

cd build

../configure --prefix=/usr \
             --with-internal-glib \
             --disable-compile-warnings

make

make install
