#!/bin/bash

set -e

cd automake-1.15/

./configure --prefix=/usr

make

make install
