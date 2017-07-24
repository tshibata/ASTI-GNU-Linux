#!/bin/bash

set -e

cd $SRCDIR

wget --no-clobber http://ftp.gnu.org/gnu/grub/grub-2.02.tar.xz

rm -rf grub-2.02/

tar xf grub-2.02.tar.xz

cd grub-2.02/

./configure --prefix=$HOSTDIR \
            --disable-werror

# Unless --disable-werror, it fails in self reproduction.

make

make install
