#!/bin/bash

set -e

cd openssl-1.0.2l/

# ../configure in build directory fails.

./config --prefix=/usr \
         --openssldir=/etc/ssl \
         shared

make

make install
