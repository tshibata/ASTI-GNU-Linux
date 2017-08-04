#!/bin/bash

# It is required to build eudev.

set -e

cd gperf-3.1/

rm -rf build/

mkdir build

cd build/

../configure --prefix=/usr

make

make install
