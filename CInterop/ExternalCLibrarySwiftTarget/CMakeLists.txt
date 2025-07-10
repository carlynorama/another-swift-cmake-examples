cmake_minimum_required(VERSION 4.0)

## pull project name from environment (set in build script)
## TODO - this is bad pattern??? 
set(PROJECT_NAME $ENV{PROJECT_NAME})
set(MAIN_TARGET_NAME ${PROJECT_NAME})

set(OUTSIDE_LIBS_LOCATION ../../OUTSIDE)

project(${PROJECT_NAME} LANGUAGES C Swift)

find_library(MY_C_CODE REQUIRED
    NAMES MyFancyMath
    PATH "${OUTSIDE_LIBS_LOCATION}/findable_c_lib"
)



add_executable(${MAIN_TARGET_NAME} Hello.swift SwiftMath.swift)
target_link_libraries(${MAIN_TARGET_NAME} PUBLIC ${MY_C_CODE})

## where are the headers for -I 
target_include_directories(${MAIN_TARGET_NAME} PUBLIC
                          "${OUTSIDE_LIBS_LOCATION}/findable_c_lib")

## when using struct with an @main
set(CMAKE_Swift_FLAGS "${CMAKE_Swift_FLAGS} -parse-as-library") 
