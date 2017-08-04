#!/bin/bash

set -e

# Get ready for self compile
./101-ncurses.sh
./102-readline.sh
./103-bash.sh
./104-binutils.sh
./105-gcc.sh

# Replace mock
./106-util-linux.sh # for fsck, swapon and swapoff.
# TBD: Shall we re-compile everything?
./107-e2fsprogs.sh # for eudev
./108-gperf.sh # for eudev
./109-eudev.sh # for udevadm and udevd

# Go beyond single user mode
./201-sysklogd.sh
./202-inetutil.sh
./203-dhcpcd.sh
./204-shadow.sh
./205-runlevel.sh

# Get ready for self reproduction
./301-pkg-config.sh
./302-perl.sh
./303-m4.sh
./304-autoconf.sh
./305-automake.sh
./306-bison.sh
./307-flex.sh
./308-patch.sh
./309-texinfo.sh
./310-bc.sh
./311-zlib.sh
./312-gzip.sh
./313-bzip2.sh
./314-xz.sh
./315-openssl.sh
./316-curl.sh
./317-wget.sh
# TBD: Do I really need both of curl and wget?

# Get ready for self development
./401-gettext.sh
./402-git.sh
./403-nano.sh
./404-parted.sh
