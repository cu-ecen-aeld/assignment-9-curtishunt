#!/bin/bash

# exit with non zero if anything fails
set -e
cd buildroot
make distclean
echo "Buildroot has been cleaned!"
