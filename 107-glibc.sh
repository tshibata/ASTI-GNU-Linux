#!/bin/bash

# Compilation of glibc requires libgcc.

set -e

export PATH=$HOSTDIR/bin:$HOSTDIR/sbin:$PATH

cd $SRCDIR

cd glibc-2.25/

cd build/

make

make install_root=$TARGETDIR install
