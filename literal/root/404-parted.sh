#!/bin/bash

set -e

cd parted-3.1/

rm -rf build/

mkdir build

cd build/

../configure --prefix=/usr \
             --disable-device-mapper \
             --without-readline

# Unless --without-readline, you need termcap

make

make install
