#!/bin/bash

set -e

export PATH=$HOSTDIR/bin:$HOSTDIR/sbin:$PATH

cd $SRCDIR

wget --no-clobber http://ftp.gnu.org/gnu/bash/bash-4.4.tar.gz
rm -rf bash-4.4/
tar xf bash-4.4.tar.gz
cd bash-4.4/

./configure --host=i686-cross-linux-gnu \
            --prefix=$TARGETDIR \
            --includedir=$TARGETDIR/usr/include/ \
            --datarootdir=$TARGETDIR/usr/share/ \
            --without-bash-malloc

make

make install

ln -sv /bin/bash $TARGETDIR/bin/sh
