#!/bin/bash

set -e

mkdir -p $HOME/src
rm -rf $HOME/host/ $HOME/target/
mkdir $HOME/host
mkdir $HOME/target

./part1.sh

./part2.sh

./part3.sh

echo all.sh is done.
