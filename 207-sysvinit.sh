#!/bin/bash

set -e

export PATH=$HOME/host/bin:$HOME/host/sbin:$PATH

cd $HOME/src/

wget --no-clobber http://download.savannah.gnu.org/releases/sysvinit/sysvinit-2.88dsf.tar.bz2

rm -rf sysvinit-2.88dsf/

tar xf sysvinit-2.88dsf.tar.bz2

cd sysvinit-2.88dsf/

DISTRO=unknown \
CC=i686-pc-linux-gnu-gcc \
ROOT=$HOME/target \
make all install
