#!/bin/bash

cd dhcpcd-6.11.5

./configure --prefix=/usr \
			--dbdir=/var/lib/dhcpcd

#            --libexecdir=/lib/dhcpcd \

make

make install
