#!/bin/bash

set -e

cd $HOME/src/

wget --no-clobber https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.9.9.tar.xz

rm -rf linux-4.9.9/

tar xf linux-4.9.9.tar.xz

cd linux-4.9.9/

make mrproper

make i386_defconfig

make INSTALL_HDR_PATH=$HOME/target/usr headers_install
