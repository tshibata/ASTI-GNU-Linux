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
             --prefix=$HOME/target \
             --libexecdir=$HOME/target/usr/libexec \
             --datarootdir=$HOME/target/usr \
             --enable-install-program=hostname

cp ../man/dummy-man  ../man/help2man

make

make install

# It is expected to have /usr/bin/install while sysklogd installation.
mv $HOME/target/bin/install $HOME/target/usr/bin/install
