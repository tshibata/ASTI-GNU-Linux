#!/bin/bash

# Let's make it ready for self compile.

set -e

./301-binutils.sh
./302-diff.sh
./303-find.sh
./304-gawk.sh
./305-gcc.sh
./306-make.sh
./307-tar.sh
