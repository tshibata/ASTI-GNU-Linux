#!/bin/bash

set -e

cd autoconf-2.69/

./configure --prefix=/usr

make

make install
