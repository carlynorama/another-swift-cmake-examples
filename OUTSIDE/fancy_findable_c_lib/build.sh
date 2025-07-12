#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPOROOT=$(git rev-parse --show-toplevel)
SRCROOT=$SCRIPT_DIR
BUILDROOT=$SRCROOT/build

export TEST_INSTALL_DIR="${REPOROOT}/TestInstalls"

mkdir -p $BUILDROOT
cd $BUILDROOT
cmake ../
cmake --build .
cmake --install . --prefix $TEST_INSTALL_DIR
cd ..