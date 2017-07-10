#!/bin/bash

set -e

export SRCDIR=`pwd`/work/src
export HOSTDIR=`pwd`/work/host
export TARGETDIR=`pwd`/work/target

mkdir -p $SRCDIR
mkdir -p $HOSTDIR
mkdir -p $TARGETDIR
rm -rf $HOSTDIR $TARGETDIR

./part1.sh

./part2.sh

./part3.sh

echo all.sh is done.
