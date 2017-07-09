#!/bin/bash

set -e

cd patch-2.7.5

./configure --prefix=/usr

make

make install
