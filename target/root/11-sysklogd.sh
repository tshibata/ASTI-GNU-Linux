#!/bin/bash

set -e

cd sysklogd-1.5.1/

sed -i '/Error loading kernel symbols/{n;n;d}' ksym_mod.c
sed -i 's/union wait/int/' syslogd.c

make

make BINDIR=/sbin install_exec

# /usr/sbin
