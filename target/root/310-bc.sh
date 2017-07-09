#!/bin/bash

set -e

cd bc-1.06.95

./configure --prefix=/usr

make

make install
