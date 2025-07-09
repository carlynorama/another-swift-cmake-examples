#!/bin/bash

REPOROOT=$(git rev-parse --show-toplevel)
SRCROOT=$REPOROOT/SwiftOnly/SingleFile
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
ninja -C $BUILDROOT $PROJECT