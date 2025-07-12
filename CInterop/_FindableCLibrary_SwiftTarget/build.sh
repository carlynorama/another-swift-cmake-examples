#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPOROOT=$(git rev-parse --show-toplevel)
SRCROOT=$SCRIPT_DIR
BUILDROOT=$SRCROOT/.build

PROJECT=hello
EXPECTED_EXECUTABLE=$BUILDROOT/$PROJECT

export PROJECT_NAME=$PROJECT
export TEST_INSTALL_DIR="${REPOROOT}/TestInstalls"

#### THE BUILD ####
mkdir -p $BUILDROOT

## Must use ninja or xcode as generators if using swift mode
cmake -B $BUILDROOT -G Ninja .

## OPTION 1
## let cmake build what ninja generated
# cmake --build $BUILDROOT

## OPTION 2
# alternate to below, build with Ninja
ninja -C $BUILDROOT $PROJECT