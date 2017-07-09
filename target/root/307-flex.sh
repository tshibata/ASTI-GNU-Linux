#!/bin/bash

# flex
#   Fast lexical analyser

set -e

cd flex-2.6.3

./configure --prefix=/usr

make

make install
