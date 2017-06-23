#!/bin/bash

cd inetutils-1.9.4

rm -rf build/

mkdir build

cd build

../configure --prefix=/usr \
             --localstatedir=/var \
             --disable-logger \
             --disable-whois \
             --disable-rcp \
             --disable-rexec \
             --disable-rlogin \
             --disable-rsh \
             --disable-servers

make

make install
