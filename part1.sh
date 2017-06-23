#!/bin/bash

# Let's make it is ready for boot.

set -e

./101-grub.sh
./102-linux.sh
./103-binutils.sh
./104-gcc.sh
./105-glibc.sh
./106-gcc.sh
./107-glibc.sh
./108-gcc.sh
./109-linux.sh

export PATH=$HOME/host/bin:$HOME/host/sbin:$PATH

# Pseudo /sbin/init
#x86_64-pc-linux-gnu-gcc -o $HOME/target/sbin/init $HOME/src/hello.c
i686-pc-linux-gnu-gcc -o $HOME/target/sbin/init hello.c
