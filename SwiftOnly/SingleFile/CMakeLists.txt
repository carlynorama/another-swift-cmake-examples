cmake_minimum_required(VERSION 4.0)
## In build script 
#set(PROJECT_NAME hello)
set(MAIN_TARGET_NAME $ENV{PROJECT_NAME})

## example uses default
# set (CMAKE_Swift_COMPILER /usr/bin/swift)

## when using struct with an @main
set(CMAKE_Swift_FLAGS "${CMAKE_Swift_FLAGS} -parse-as-library") 

project($ENV{PROJECT_NAME} LANGUAGES Swift)
add_executable(${MAIN_TARGET_NAME} Hello.swift)