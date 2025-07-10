# https://www.youtube.com/watch?v=08f5Dav72aE&t=857s

cmake_minimum_required(VERSION 4.0)
project(LibraryProject C)

add_library(MyFancyMath mycmath.c)

# set_target_properties(MyFancyMath
#     PROPERTIES

# )
# cache variables for installation destinations
include(GNUInstallDirs)

target_include_directories(MyFancyMath
    PUBLIC
    "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>"
    "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>"
)

install(TARGETS MyFancyMath
    EXPORT MyFancyMathTargets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

install(FILES src/useful.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

install(EXPORT MyFancyMathTargets
    FILE MyFancyMathTargets.cmake
    NAMESPACE MyFancyMath::
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/MyFancyMath
)

# include the package config helpers and generate the file below
include(CMakePackageConfigHelpers)

configure_package_config_file(${CMAKE_CURRENT_SOURCE_DIR}/Config.cmake.in
  "${CMAKE_CURRENT_BINARY_DIR}/MyFancyMathConfig.cmake"
  INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/MyFancyMath
)

install(FILES
    "${CMAKE_CURRENT_BINARY_DIR}/MyFancyMathConfig.cmake"
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/MyFancyMath
)