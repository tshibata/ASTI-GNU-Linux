#!/bin/bash

set -e

cd e2fsprogs-1.43.4

mkdir build

cd build

../configure --prefix= \
             --datarootdir=/usr/share

make

make install
