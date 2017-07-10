#!/bin/bash

# To compile libgcc, it requires headers of glibc.

set -e

export PATH=$HOSTDIR/bin:$HOSTDIR/sbin:$PATH

cd $SRCDIR

cd gcc-6.3.0/

cd build/

make all-target-libgcc

make install-target-libgcc
