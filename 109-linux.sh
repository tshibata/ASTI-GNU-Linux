#!/bin/bash

set -e

export PATH=$HOSTDIR/bin:$HOSTDIR/sbin:$PATH

cd $SRCDIR

cd linux-4.9.39/

make

make INSTALL_MOD_PATH=$TARGETDIR modules_install

mkdir -p $TARGETDIR/boot

cp arch/x86/boot/bzImage $TARGETDIR/boot/
