- [x] swift target, single file
- [x] swift target, swift local library
- [x] swift target, c local library bridging header
- [x] swift target, c local library module map
- [x] swift target, external C library source code
        - as add subdir to external directory
- [x] c target: local swift library
- [x] findable C library
- [-] findable swift library 
    - https://github.com/swiftlang/swift-cmake-examples/blob/b54c92af747894be710337410c371d04dc2cf485/3_bidirectional_cxx_interop/cmake/modules/AddSwift.cmake#L65
    - https://github.com/swiftlang/swift/blob/2211d9fcd7ec99b2eb4b6a89b017424a57ce2ea6/Runtimes/Core/cmake/modules/EmitSwiftInterface.cmake#L4


- c target: swift as o file (custom command)
    - similar to a cross compile: https://cmake.org/cmake/help/book/mastering-cmake/chapter/Cross%20Compiling%20With%20CMake.html

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
    - https://github.com/swiftlang/llvm-project/blob/43e0675c1d92eadc36b668c86d02ab5c567e60f0/libcxx/utils/ci/apple-install-libcxx.sh#L130
- read WHOLE PAGE
    - https://github.com/swiftlang/swift/blob/2211d9fcd7ec99b2eb4b6a89b017424a57ce2ea6/Runtimes/Core/Readme.md?plain=1#L25
    - https://github.com/swiftlang/swift-testing/blob/d2a238d4659792e3ce969b1466d05897e5f219ae/CONTRIBUTING.md?plain=1#L130
    - https://forums.swift.org/t/how-to-use-swiftc-with-a-static-toolchain-in-cmake/74266/8



- Handy Github Searches
    - https://github.com/search?q=org%3Aswiftlang%20GNUInstallDirs&type=code