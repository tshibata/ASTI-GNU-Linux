#!/bin/bash

set -e

cd bzip2-1.0.6

make

make PREFIX=/usr install
