#!/bin/bash

set -e

cd m4-1.4.18/

./configure --prefix=/usr

make

make install
