#!/bin/bash

cd shadow-4.5/

rm -rf build/

mkdir build

cd build/

../configure --prefix=/usr \
             --sysconfdir=/etc

make

make install

# Activate shadow password.
pwconv

# Suppress warning.
useradd -D --gid 999
