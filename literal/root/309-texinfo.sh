#!/bin/bash

set -e

cd texinfo-6.3

./configure --prefix=/usr

make

make install
