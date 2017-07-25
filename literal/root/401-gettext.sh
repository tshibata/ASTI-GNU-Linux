#!/bin/bash

set -e

cd gettext-0.19.8.1

rm -rf build/

mkdir build

cd build

../configure --prefix=/usr

make

make install
