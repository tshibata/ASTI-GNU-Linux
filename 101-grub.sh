#!/bin/bash

set -e

cd $SRCDIR

wget --no-clobber http://alpha.gnu.org/gnu/grub/grub-2.02~beta3.tar.xz

rm -rf grub-2.02~beta3/

tar xf grub-2.02~beta3.tar.xz

cd grub-2.02~beta3/

./configure --prefix=$HOSTDIR \
            --disable-werror

# Unless --disable-werror, it fails in self reproduction.

make

make install
