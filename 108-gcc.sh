#!/bin/bash

# To finish gcc, it requires glibc.

set -e

export PATH=$HOME/host/bin:$HOME/host/sbin:$PATH

cd $HOME/src/

cd gcc-6.3.0/

cd build/

make all

make install
