#!/bin/bash

set -e

cp -r target/* $HOME/target/
rm `find $HOME/target/ -name .gitkeep`

echo "$(hostname)" > $HOME/target/etc/hostname
echo "127.0.0.1 localhost $(hostname)" > $HOME/target/etc/hosts

chmod -v 666 $HOME/target/var/log/lastlog
