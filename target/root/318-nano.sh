#!/bin/bash

set -e

cd nano-2.8.5/

./configure --prefix=/usr

make

make install
