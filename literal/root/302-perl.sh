#!/bin/bash

set -e

cd perl-5.24.1

./Configure -des \
            -Dprefix=/usr \
            -Dusethreads

make

make install
