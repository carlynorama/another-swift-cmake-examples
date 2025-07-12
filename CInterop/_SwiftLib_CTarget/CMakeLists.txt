cmake_minimum_required(VERSION 4.0)

set(PROJECT_NAME $ENV{PROJECT_NAME})
set(MAIN_TARGET_NAME ${PROJECT_NAME})
set(EXAMPLE_LIBRARY_NAME MySwiftMath)

project(${PROJECT_NAME} 
    LANGUAGES C Swift
    # VERSION 0.1.0
)

add_subdirectory("SwiftLib/")
add_subdirectory("src/")