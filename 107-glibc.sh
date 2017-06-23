#!/bin/bash

# Compilation of glibc requires libgcc.

set -e

export PATH=$HOME/host/bin:$HOME/host/sbin:$PATH

cd $HOME/src/

cd glibc-2.25/

cd build/

make

make install_root=$HOME/target/ install
