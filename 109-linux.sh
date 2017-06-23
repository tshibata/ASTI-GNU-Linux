#!/bin/bash

set -e

export PATH=$HOME/host/bin:$HOME/host/sbin:$PATH

cd $HOME/src/

cd linux-4.9.9/

make

make INSTALL_MOD_PATH=$HOME/target modules_install

mkdir -p $HOME/target/boot

cp arch/x86/boot/bzImage $HOME/target/boot/
