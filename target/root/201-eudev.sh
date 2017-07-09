#!/bin/bash

set -e

cd eudev-3.2.2/

mkdir build

cd build


../configure --prefix=/usr \
             --sysconfdir=/etc

make

make install
