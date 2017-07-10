#!/bin/bash

set -e

cp -r target/* $TARGETDIR
rm `find $TARGETDIR -name .gitkeep`

echo "$(hostname)" > $TARGETDIR/etc/hostname
echo "127.0.0.1 localhost $(hostname)" > $TARGETDIR/etc/hosts
