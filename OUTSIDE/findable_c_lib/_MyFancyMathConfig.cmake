# Could also be called myfancymath-config.cmake


add_library(MyFancyMath STATIC IMPORTED GLOBAL)

set_target_properties(MyFancyMath PROPERTIES 
     IMPORTED_LOCATION "${CMAKE_CURRENT_SOURCE_DIR}/.build/libMyFancyMath.a"
#     IMPORTED_LINK_INTERFACE_LIBRARIES "${ZLIB_LIBRARIES};${CMAKE_THREAD_LIBS_INIT}"
    INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}/")

# include(GenerateExportHeader)
# cmake_minimum_required(VERSION 4.0)
# add_library(MyFancyMath mycmath.c)
# generate_export_header(MyFancyMath)