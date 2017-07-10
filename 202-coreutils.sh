#!/bin/bash

set -e

export PATH=$HOSTDIR/bin:$HOSTDIR/sbin:$PATH

cd $SRCDIR

wget --no-clobber http://ftp.gnu.org/gnu/coreutils/coreutils-8.27.tar.xz

rm -rf coreutils-8.27/

tar xf coreutils-8.27.tar.xz

cd coreutils-8.27/

mkdir build

cd build/

../configure --host=i686-cross-linux-gnu \
             --prefix=$TARGETDIR/usr \
             --enable-install-program=hostname

cp ../man/dummy-man  ../man/help2man

make

make install

# Move programs used by rcS.d into /bin
mv $TARGETDIR/usr/bin/{cat,chgrp,chmod,hostname,ln,mkdir,rm,sleep,[} $TARGETDIR/bin/
