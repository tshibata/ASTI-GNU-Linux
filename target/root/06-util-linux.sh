#!/bin/bash

set -e

cd util-linux-2.29

mkdir build

cd build

../configure --prefix= \
             --include=/usr/include \
             --datarootdir=/usr/share

make

make install
