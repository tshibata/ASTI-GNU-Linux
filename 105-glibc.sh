#!/bin/bash

# To configure glibc, it requires gcc commands.

set -e

export PATH=$HOME/host/bin:$HOME/host/sbin:$PATH

cd $HOME/src/

wget --no-clobber http://ftp.gnu.org/gnu/glibc/glibc-2.25.tar.xz
rm -rf glibc-2.25/
tar xf glibc-2.25.tar.xz
cd glibc-2.25/
mkdir build
cd build/

mkdir -p $HOME/target/usr/include/gnu
touch $HOME/target/usr/include/gnu/stubs.h
touch $HOME/target/usr/include/gnu/stubs-32.h

../configure --host=i686-cross-linux-gnu \
             --prefix=/usr \
             --with-headers=$HOME/target/usr/include

make install_root=$HOME/target/ install-headers

#cp ../include/gnu/stubs.h $HOME/target/usr/include/gnu/
