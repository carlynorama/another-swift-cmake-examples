cmake_minimum_required(VERSION 4.0)

## pull project name from environment (set in build script)
set(PROJECT_NAME $ENV{PROJECT_NAME})
set(MAIN_TARGET_NAME ${PROJECT_NAME})

project(${PROJECT_NAME} LANGUAGES C Swift)

add_subdirectory("c_lib/")
add_subdirectory("swift_main/")