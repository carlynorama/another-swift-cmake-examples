cmake_minimum_required(VERSION 4.0)

## pull project name from environment (set in build script)
set(PROJECT_NAME $ENV{PROJECT_NAME})
set(MAIN_TARGET_NAME ${PROJECT_NAME})

set(OUTSIDE_LIBS_LOCATION ../../OUTSIDE)

project(${PROJECT_NAME} LANGUAGES C Swift)

# Use EXCLUDE_FROM_ALL if want to build by hand
# Assumes folder has CMake file. 
add_subdirectory(
    ${OUTSIDE_LIBS_LOCATION}/outside_c_lib
    ${CMAKE_CURRENT_BINARY_DIR}/BackingC
)

add_executable(${MAIN_TARGET_NAME} Hello.swift SwiftMath.swift)
target_link_libraries(${MAIN_TARGET_NAME} PUBLIC BackingC)

## where are the headers for -I 
target_include_directories(${MAIN_TARGET_NAME} PUBLIC
                          "${OUTSIDE_LIBS_LOCATION}/outside_c_lib")

## when using struct with an @main
set(CMAKE_Swift_FLAGS "${CMAKE_Swift_FLAGS} -parse-as-library") 
