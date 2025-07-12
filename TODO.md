- [x] swift target, single file
- [x] swift target, swift local library
- [x] swift target, c local library bridging header
- [x] swift target, c local library module map
- [x] swift target, external C library source code
        - as add subdir to external directory
- [x] c target: local swift library
- [-] findable C library


- c target: swift as o file (custom command)
- c target: external swift library
- findable swift library 
- swift target: external swift library (findable package)
- swift target: external C library (like an SDK)
- swift target: external C library - system
- c <-> swift ping-pong like existing C++ example?

- [x] probably shouldn't be using the name cmath
    - [x] name changed to mycmath (also not great)
    - [x] recompile existing 2 examples (2 of 2)
- example compile def: https://cmake.org/cmake/help/latest/guide/tutorial/Adding%20a%20Library.html#exercise-2-adding-an-option

- list(APPEND ...) for Swift args? https://cmake.org/cmake/help/latest/command/list.html
- read https://llvm.org/docs/CMake.html
- Everything should be JSON anyway?
    - https://cmake.org/cmake/help/latest/manual/cmake-presets.7.html
    - https://stackoverflow.com/questions/67385282/cmake-set-compile-options-and-compile-features-per-project
- build script aspirations
    - https://github.com/swiftlang/swift-docker/blob/main/swift-ci/sdks/static-linux/scripts/build.sh