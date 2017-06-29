#!/bin/bash

set -e

export PATH=$HOME/host/bin:$HOME/host/sbin:$PATH

cd $HOME/src/

wget --no-clobber http://ftp.gnu.org/gnu/coreutils/coreutils-8.27.tar.xz

rm -rf coreutils-8.27/

tar xf coreutils-8.27.tar.xz

cd coreutils-8.27/

mkdir build

cd build/

../configure --host=i686-cross-linux-gnu \
             --prefix=$HOME/target/usr \
             --enable-install-program=hostname

cp ../man/dummy-man  ../man/help2man

make

make install

# Move programs used by rcS.d into /bin
mv $HOME/target/usr/bin/{cat,chgrp,chmod,hostname,ln,mkdir,rm,sleep,[} $HOME/target/bin/
