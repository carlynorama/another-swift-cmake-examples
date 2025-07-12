#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPOROOT=$(git rev-parse --show-toplevel)
SRCROOT=$SCRIPT_DIR
BUILDROOT=$SRCROOT/.build

PROJECT=hello
EXPECTED_EXECUTABLE=$BUILDROOT/$PROJECT

export PROJECT_NAME=$PROJECT

#### THE BUILD ####
mkdir -p $BUILDROOT

## Must use ninja or xcode as generators if using swift mode
cmake -B $BUILDROOT -G Ninja .

## OPTION 1
## let cmake build what ninja generated
# cmake --build $BUILDROOT

## OPTION 2
# alternate to below, build with Ninja
## WARNING AND TODO - this drops the build down to a single thread
## to deprive ninja of its concurrency to enforce that the lib gets 
# built first. There has to be a better way. 
ninja -C $BUILDROOT $PROJECT -j 1