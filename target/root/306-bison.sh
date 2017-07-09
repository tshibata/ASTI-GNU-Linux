#!/bin/bash

# bison
#   A parser generator

set -e

cd bison-3.0.4

./configure --prefix=/usr

make

make install
