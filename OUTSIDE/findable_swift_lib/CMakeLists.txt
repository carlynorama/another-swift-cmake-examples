# Comments are from the docs
# https://cmake.org/cmake/help/latest/guide/importing-exporting/index.html#exporting-targets
cmake_minimum_required(VERSION 4.0)
project(MyFancyResponderProject LANGUAGES Swift)

set(LIBRARY_TARGET_NAME MyFancyResponder)
add_library(${LIBRARY_TARGET_NAME} STATIC ResponseHandler.swift)
# set_target_properties(${LIBRARY_TARGET_NAME} PROPERTIES 
#     LINKER_LANGUAGE Swift
# )

# TODO: use properties or compile options to do this?
# set(CMAKE_Swift_FLAGS "${CMAKE_Swift_FLAGS} -parse-as-library")

# make cache variables for install destinations
#The GNUInstallDirs module is included in order to provide the project with 
#the flexibility to install into different platform layouts by making the 
# directories available as cache variables.
include(GNUInstallDirs)

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

# move the modulemap and all the needed headers
# TODO: Swift for swift doesn't need headers??
# install(FILES mycmath.h 
#               module.modulemap 
#         DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

install(EXPORT ${LIBRARY_TARGET_NAME}Targets
        FILE ${LIBRARY_TARGET_NAME}Targets.cmake
        NAMESPACE ${LIBRARY_TARGET_NAME}::
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${LIBRARY_TARGET_NAME}
)

message(${CMAKE_INSTALL_LIBDIR}/cmake/${LIBRARY_TARGET_NAME})
message(${CMAKE_INSTALL_INCLUDEDIR})
message(${CMAKE_INSTALL_BINDIR})

# -------------------------------------  Create Actual Package
# BEFORE THIS CODE CALL SITE LOOKS LIKE:
##
#  set(INSTALL_PREFIX "$ENV{TEST_INSTALL_DIR}")
#  include(GNUInstallDirs)
#  include(${INSTALL_PREFIX}/MyFancyMath/${CMAKE_INSTALL_LIBDIR}/cmake/MyFancyMath/MyFancyMathTargets.cmake)
#  add_executable(${MAIN_TARGET_NAME} Hello.swift SwiftMath.swift)
#  target_link_libraries(${MAIN_TARGET_NAME} 
#         PRIVATE  
#             MyFancyMath::MyFancyMath
#  )
##

include(CMakePackageConfigHelpers)

# Use the configure_package_config_file() command provided by the 
# CMakePackageConfigHelpers to generate the package configuration file. Note 
# that this command should be used instead of the plain configure_file() 
# command. It helps to ensure that the resulting package is relocatable by 
# avoiding hardcoded paths in the installed configuration file. The path given 
# to INSTALL_DESTINATION must be the destination where the 
# MathFunctionsConfig.cmake file will be installed. We will examine the contents
# of the package configuration file in the next section.
# configure_package_config_file(<input> <output>
#   INSTALL_DESTINATION <path>
#   [PATH_VARS <var1> <var2> ... <varN>]
#   [NO_SET_AND_CHECK_MACRO]
#   [NO_CHECK_REQUIRED_COMPONENTS_MACRO]
#   [INSTALL_PREFIX <path>]
#   )
configure_package_config_file(${CMAKE_CURRENT_SOURCE_DIR}/Config.cmake.in
  "${CMAKE_CURRENT_BINARY_DIR}/${LIBRARY_TARGET_NAME}Config.cmake"
  INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${LIBRARY_TARGET_NAME}
)

install(FILES
          "${CMAKE_CURRENT_BINARY_DIR}/${LIBRARY_TARGET_NAME}Config.cmake"
          "${CMAKE_CURRENT_BINARY_DIR}/${LIBRARY_TARGET_NAME}ConfigVersion.cmake"
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${LIBRARY_TARGET_NAME}
)

# if using a version file like the install files has above
set(version 2.0.1)

set_property(TARGET ${LIBRARY_TARGET_NAME} PROPERTY VERSION ${version})
set_property(TARGET ${LIBRARY_TARGET_NAME} PROPERTY SOVERSION 2)
set_property(TARGET ${LIBRARY_TARGET_NAME} PROPERTY
  INTERFACE_${LIBRARY_TARGET_NAME}_MAJOR_VERSION 2)
set_property(TARGET ${LIBRARY_TARGET_NAME} APPEND PROPERTY
  COMPATIBLE_INTERFACE_STRING ${LIBRARY_TARGET_NAME}_MAJOR_VERSION
)

# generate the version file for the config file
write_basic_package_version_file(
  "${CMAKE_CURRENT_BINARY_DIR}/${LIBRARY_TARGET_NAME}ConfigVersion.cmake"
  VERSION "${version}"
  COMPATIBILITY AnyNewerVersion
)

# So the caller can do the export?

# It is possible to create a suitable package configuration file and package 
# version file to define a package for the build tree which may be used without 
# installation. Consumers of the build tree can simply ensure that the 
# CMAKE_PREFIX_PATH contains the build directory, or set the MathFunctions_DIR 
# to <build_dir>/MathFunctions in the cache.
# An example application of this feature is for building an executable on a host 
# platform when cross-compiling. The project containing the executable may be 
# built on the host platform and then the project that is being cross-compiled 
# for another platform may load it.
 
export(EXPORT ${LIBRARY_TARGET_NAME}Targets
       FILE "${CMAKE_CURRENT_BINARY_DIR}/cmake/${LIBRARY_TARGET_NAME}Targets.cmake"
       NAMESPACE ${LIBRARY_TARGET_NAME}::
)