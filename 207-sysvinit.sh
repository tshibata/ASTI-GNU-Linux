#!/bin/bash

set -e

export PATH=$HOSTDIR/bin:$HOSTDIR/sbin:$PATH

cd $SRCDIR

wget --no-clobber http://download.savannah.gnu.org/releases/sysvinit/sysvinit-2.88dsf.tar.bz2

rm -rf sysvinit-2.88dsf/

tar xf sysvinit-2.88dsf.tar.bz2

cd sysvinit-2.88dsf/

DISTRO=unknown \
CC=i686-cross-linux-gnu-gcc \
ROOT=$TARGETDIR \
make all install
