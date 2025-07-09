cmake_minimum_required(VERSION 4.0)

## pull project name from environment (set in build script)
set(PROJECT_NAME $ENV{PROJECT_NAME})
set(MAIN_TARGET_NAME ${PROJECT_NAME})
set(EXAMPLE_LIBRARY_NAME BeholdMyGloriousName)

project(${PROJECT_NAME} LANGUAGES Swift)

add_subdirectory("lib/")
add_subdirectory("src/")