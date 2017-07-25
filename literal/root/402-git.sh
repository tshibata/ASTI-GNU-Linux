#!/bin/bash

set -e

cd git-2.13.3/

# ../configure in build directory fails.

./configure --prefix=/usr \
			--without-tcltk

make

make install
