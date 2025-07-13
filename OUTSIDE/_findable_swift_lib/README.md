
A findable swift library to be consumed byt other swift libraries. 

This library follows the process outlined in 

- https://cmake.org/cmake/help/latest/guide/importing-exporting/index.html#exporting-targets

which installs the library in a folder of your choice. 

This build script and the build script of the caller must both know where that folder is. 

The caller script doesn't point here, but at the exported folder. 


TROUBLE On first compile from /opt/homebrew/Cellar/cmake/4.0.3/share/cmake/Modules/GNUInstallDirs.cmake
```cmake
 if (NOT DEFINED CMAKE_SYSTEM_NAME OR NOT DEFINED CMAKE_SIZEOF_VOID_P)
    message(AUTHOR_WARNING
      "Unable to determine default CMAKE_INSTALL_LIBDIR directory because no target architecture is known. "
      "Please enable at least one language before including GNUInstallDirs.")
  endif()
  ```


  - https://github.com/swiftlang/swift/blob/2211d9fcd7ec99b2eb4b6a89b017424a57ce2ea6/Runtimes/Core/CMakeLists.txt#L237
  - https://github.com/swiftlang/swift-cmark/blob/b97d09472e847a416629f026eceae0e2afcfad65/CMakeLists.txt#L113