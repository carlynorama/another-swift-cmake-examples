#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "MyFancyMath::MyFancyMath" for configuration ""
set_property(TARGET MyFancyMath::MyFancyMath APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(MyFancyMath::MyFancyMath PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "C"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libMyFancyMath.a"
  )

list(APPEND _cmake_import_check_targets MyFancyMath::MyFancyMath )
list(APPEND _cmake_import_check_files_for_MyFancyMath::MyFancyMath "${_IMPORT_PREFIX}/lib/libMyFancyMath.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
