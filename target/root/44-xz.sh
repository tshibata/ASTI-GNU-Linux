#!/bin/bash

set -e

cd xz-5.2.3

mkdir build

cd build

../configure --prefix=/usr

make

make install
