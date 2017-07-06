#!/bin/bash

set -e

./01-ncurses.sh
./02-readline.sh
./03-bash.sh
./04-binutils.sh
./05-gcc.sh
./06-util-linux.sh
# TBD: Shall we re-compile everything?
./11-eudev.sh
./12-sysklogd.sh
./13-inetutil.sh
./14-dhcpcd.sh
./15-shadow.sh
./21-runlevel3.sh
