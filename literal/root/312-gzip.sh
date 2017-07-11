#!/bin/bash

set -e

cd gzip-1.8

mkdir build

cd build

../configure --prefix=/usr

make

make install
