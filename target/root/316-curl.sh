#!/bin/bash

set -e

# It requires openssl

cd curl-7.54.1

rm -rf build/

mkdir build

cd build

../configure --prefix=/usr \
             --enable-threaded-resolver \
             --with-ca-path=/etc/ssl/certs

make

make install
