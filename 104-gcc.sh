#!/bin/bash

set -e

export PATH=$HOME/host/bin:$HOME/host/sbin:$PATH

cd $HOME/src/

wget --no-clobber http://www.multiprecision.org/mpc/download/mpc-1.0.3.tar.gz
rm -rf mpc-1.0.3/
tar xf mpc-1.0.3.tar.gz

wget --no-clobber http://ftp.gnu.org/gnu/gmp/gmp-6.1.2.tar.xz
rm -rf gmp-6.1.2/
tar xf gmp-6.1.2.tar.xz

wget --no-clobber http://www.mpfr.org/mpfr-3.1.5/mpfr-3.1.5.tar.xz
rm -rf mpfr-3.1.5/
tar xf mpfr-3.1.5.tar.xz

wget --no-clobber http://ftp.gnu.org/gnu/gcc/gcc-6.3.0/gcc-6.3.0.tar.bz2
rm -rf gcc-6.3.0/
tar xf gcc-6.3.0.tar.bz2

cd gcc-6.3.0/

ln -s ../mpc-1.0.3 mpc
ln -s ../gmp-6.1.2 gmp
ln -s ../mpfr-3.1.5 mpfr

mkdir build

cd build/

../configure --target=i686-pc-linux-gnu \
             --prefix=$HOME/host \
             --with-sysroot=$HOME/target \
             --with-local-prefix=/usr \
             --with-native-system-header-dir=/usr/include \
             --disable-shared \
             --disable-threads \
             --disable-libatomic \
             --disable-libgomp \
             --disable-libmpx \
             --disable-libquadmath \
             --disable-libssp \
             --disable-libvtv \
             --disable-multilib \
             --enable-languages=c,c++

make all-gcc

make install-gcc

# Unless --disable-shared
# /home/tshibata/host/bin/i686-pc-linux-gnu-ld: cannot find crti.o: No such file or directory
# /home/tshibata/host/bin/i686-pc-linux-gnu-ld: cannot find -lc
# /home/tshibata/host/bin/i686-pc-linux-gnu-ld: cannot find crtn.o: No such file or directory
# collect2: error: ld returned 1 exit status

# Unless --disable-threads,
# ./gthr-default.h:35:21: fatal error: pthread.h: No such file or directory

# Unless --disable-libatomic, --disable-libgomp and --disable-libvtv,
# configure: error: C compiler cannot create executables

# Unless --disable-libmpx or --with-headers
# ../../../../libmpx/mpxrt/mpxrt-utils.c:69:23: error: 'PATH_MAX' undeclared here (not in a function)

# Unless --disable-libquadmath, --disable-libstdcxx and --disable-libssp,
# checking dynamic linker characteristics... configure: error: Link tests are not allowed after GCC_NO_EXECUTABLES.
