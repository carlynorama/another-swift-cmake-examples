#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPOROOT=$(git rev-parse --show-toplevel)
SRCROOT=$SCRIPT_DIR
BUILDROOT=$SRCROOT/build

export TEST_INSTALL_DIR="${REPOROOT}/TestInstalls"

# mkdir -p $BUILDROOT
# cd $BUILDROOT
# cmake ../
# cmake --build .
# cmake --install . --prefix $TEST_INSTALL_DIR/MyFancyResponse
# cd ..

SWIFT_COMP=$(which swiftc)
mkdir -p $BUILDROOT
# cmake -B $BUILDROOT -S . -G Ninja -D "CMAKE_Swift_COMPILER=${SWIFT_COMP}"
cmake -B $BUILDROOT -S . -G Ninja
cmake --build build
cmake --install build --prefix $TEST_INSTALL_DIR/MyFancyResponder
# ninja -C $BUILDROOT


# # cmake -B build -S . -G Ninja -DCMAKE_Swift_COMPILER=<swiftc>
# # cmake --build build
# # DESTDIR=/tmp/staging-dir cmake --install build --prefix /usr

# ninja -C $BUILDROOT
# cmake -G Ninja --install . --prefix $TEST_INSTALL_DIR/MyFancyResponse
# cd ..