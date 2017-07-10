#!/bin/bash

# To configure glibc, it requires gcc commands.

set -e

export PATH=$HOSTDIR/bin:$HOSTDIR/sbin:$PATH

cd $SRCDIR

wget --no-clobber http://ftp.gnu.org/gnu/glibc/glibc-2.25.tar.xz
rm -rf glibc-2.25/
tar xf glibc-2.25.tar.xz
cd glibc-2.25/
mkdir build
cd build/

mkdir -p $TARGETDIR/usr/include/gnu
touch $TARGETDIR/usr/include/gnu/stubs.h
touch $TARGETDIR/usr/include/gnu/stubs-32.h

../configure --host=i686-cross-linux-gnu \
             --prefix=/usr \
             --with-headers=$TARGETDIR/usr/include \
             --enable-obsolete-rpc

# Unless --enable-obsolete-rpc, it fails in building PAM.

make install_root=$TARGETDIR install-headers

#cp ../include/gnu/stubs.h $TARGETDIR/usr/include/gnu/
