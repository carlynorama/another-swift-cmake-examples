# Comments are from the docs
# https://cmake.org/cmake/help/latest/guide/importing-exporting/index.html#exporting-targets
cmake_minimum_required(VERSION 4.0)
project(MyFancyMathProject)

# make cache variables for install destinations
#The GNUInstallDirs module is included in order to provide the project with 
#the flexibility to install into different platform layouts by making the 
# directories available as cache variables.
include(GNUInstallDirs)

set(LIBRARY_TARGET_NAME MyFancyMath)
add_library(${LIBRARY_TARGET_NAME} STATIC mycmath.c)

# We need to tell CMake that we want to use different include directories 
# depending on if we're building the library or using it from an installed 
# location. If we don't do this, when CMake creates the export information it 
# will export a path that is specific to the current build directory and will 
# not be valid for other projects. We can use generator expressions to specify 
# that if we're building the library include the current source directory. 
# Otherwise, when installed, include the include directory. 
# See the Creating Relocatable Packages section for more details.
target_include_directories(${LIBRARY_TARGET_NAME}
                           PUBLIC
                           "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>"
                           "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>"
)

# The install(TARGETS) and install(EXPORT) commands work together to install both 
# targets (a library in our case) and a CMake file designed to make it easy to 
# import the targets into another CMake project.
install(TARGETS ${LIBRARY_TARGET_NAME}
        EXPORT ${LIBRARY_TARGET_NAME}Targets
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

install(FILES ${LIBRARY_TARGET_NAME}.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
install(FILES module.modulemap DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

install(EXPORT ${LIBRARY_TARGET_NAME}Targets
        FILE ${LIBRARY_TARGET_NAME}Targets.cmake
        NAMESPACE ${LIBRARY_TARGET_NAME}::
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${LIBRARY_TARGET_NAME}
)

message(${CMAKE_INSTALL_LIBDIR}/cmake/${LIBRARY_TARGET_NAME})
message(${CMAKE_INSTALL_INCLUDEDIR})
message(${CMAKE_INSTALL_BINDIR})

