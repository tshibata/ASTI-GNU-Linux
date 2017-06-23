#!/bin/bash

# Let's make it ready for single user mode.

set -e

./201-bash.sh
./202-coreutils.sh
./203-gperf.sh
./204-grep.sh
./205-sed.sh
./206-shadow.sh # FIXME not yet needed?
./207-sysvinit.sh
./208-util-linux.sh
./209-configuration.sh
