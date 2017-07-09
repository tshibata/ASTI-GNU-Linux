#!/bin/bash

cd dhcpcd-6.11.5

# ../configure in build directory fails.

./configure --prefix=/usr \
            --sysconfdir=/etc \
            --dbdir=/var/lib/dhcpcd

make

make install
