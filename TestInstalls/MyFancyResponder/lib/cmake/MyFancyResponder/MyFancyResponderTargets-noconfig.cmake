#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "MyFancyResponder::MyFancyResponder" for configuration ""
set_property(TARGET MyFancyResponder::MyFancyResponder APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(MyFancyResponder::MyFancyResponder PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "Swift"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libMyFancyResponder.a"
  )

list(APPEND _cmake_import_check_targets MyFancyResponder::MyFancyResponder )
list(APPEND _cmake_import_check_files_for_MyFancyResponder::MyFancyResponder "${_IMPORT_PREFIX}/lib/libMyFancyResponder.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
