#!/bin/bash

set -e

# It requires openssl and pkg-config

cd wget-1.19.1

rm -rf build/

mkdir build

cd build

../configure --prefix=/usr \
             --sysconfdir=/etc \
             --with-ssl=openssl

make

make install
