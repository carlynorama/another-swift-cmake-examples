cmake_minimum_required(VERSION 4.0)

## pull project name from environment (set in build script)
set(PROJECT_NAME $ENV{PROJECT_NAME})
set(MAIN_TARGET_NAME ${PROJECT_NAME})

project(${PROJECT_NAME} LANGUAGES Swift)

#add_subdirectory("lib/")
add_subdirectory("src/")
#add_executable(${MAIN_TARGET_NAME} Hello.swift)
 
## when using struct with an @main
#set(CMAKE_Swift_FLAGS "${CMAKE_Swift_FLAGS} -parse-as-library")