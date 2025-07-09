cmake_minimum_required(VERSION 4.0)

## pull project name from environment (set in build script)
set(PROJECT_NAME $ENV{PROJECT_NAME})
set(MAIN_TARGET_NAME ${PROJECT_NAME})

project(${PROJECT_NAME} LANGUAGES C Swift)
add_executable(${MAIN_TARGET_NAME} Hello.swift SwiftMath.swift cmath.c)

## when using struct with an @main
set(CMAKE_Swift_FLAGS "${CMAKE_Swift_FLAGS} -parse-as-library") 

## Option 1 for C, treat the header like a bridging header, or make one. 
set(CMAKE_Swift_FLAGS "${CMAKE_Swift_FLAGS} -import-objc-header ${CMAKE_CURRENT_LIST_DIR}/my_bridge_header.h")