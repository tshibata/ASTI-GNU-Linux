#!/bin/bash

# Let's make it ready for boot.

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

export PATH=$HOSTDIR/bin:$HOSTDIR/sbin:$PATH

# Pseudo /sbin/init
i686-cross-linux-gnu-gcc -o $TARGETDIR/sbin/init hello.c
