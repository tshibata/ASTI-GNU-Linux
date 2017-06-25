#!/bin/bash

set -e

cd $HOME/src/

wget --no-clobber http://alpha.gnu.org/gnu/grub/grub-2.02~beta3.tar.xz

rm -rf grub-2.02~beta3/

tar xf grub-2.02~beta3.tar.xz

cd grub-2.02~beta3/

./configure --prefix=$HOME/host \
            --target=i686-cross-linux-gnu \
            --disable-efiemu \
            --disable-werror

make

make install
