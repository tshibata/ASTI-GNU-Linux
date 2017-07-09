#!/bin/bash

cd shadow-4.5/

mkdir build

cd build/

../configure --prefix=/usr \
             --sysconfdir=/etc

make

make install
