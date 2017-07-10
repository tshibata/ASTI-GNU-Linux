#!/bin/bash

# To finish gcc, it requires glibc.

set -e

export PATH=$HOSTDIR/bin:$HOSTDIR/sbin:$PATH

cd $SRCDIR

cd gcc-6.3.0/

cd build/

make all

make install
