#!/bin/bash

set -e

cd $SRCDIR

wget --no-clobber https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.9.9.tar.xz

rm -rf linux-4.9.9/

tar xf linux-4.9.9.tar.xz

cd linux-4.9.9/

make mrproper

make i386_defconfig

# For frame buffer
sed -i 's/^# CONFIG_FB_BOOT_VESA_SUPPORT is not set$/CONFIG_FB_BOOT_VESA_SUPPORT=y/' .config
sed -i 's/^# CONFIG_FB_VESA is not set$/CONFIG_FB_VESA=y/' .config

make INSTALL_HDR_PATH=$TARGETDIR/usr headers_install
