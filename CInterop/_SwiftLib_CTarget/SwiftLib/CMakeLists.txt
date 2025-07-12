add_library(${EXAMPLE_LIBRARY_NAME} MySwiftMath.swift)

set(CMAKE_Swift_FLAGS "${CMAKE_Swift_FLAGS} -parse-as-library")