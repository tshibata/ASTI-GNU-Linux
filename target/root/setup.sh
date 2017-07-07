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
./31-pkg-config.sh
./41-zlib.sh
./42-gzip.sh
./43-bzip2.sh
./44-xz.sh
./45-perl.sh
./46-openssl.sh
./47-curl.sh
./48-wget.sh
# TBD: Do I really need both of curl and wget?
./49-nano.sh
