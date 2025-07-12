add_library(${EXAMPLE_LIBRARY_NAME} MySwiftMath.swift)

# Leave in get .o file, leave out get dynlib
set(CMAKE_Swift_FLAGS "${CMAKE_Swift_FLAGS} -parse-as-library ")
# Emit the library
set(CMAKE_Swift_FLAGS "${CMAKE_Swift_FLAGS} -emit-library") 
# Emit headers
set(CMAKE_Swift_FLAGS "${CMAKE_Swift_FLAGS}  -cxx-interoperability-mode=default -emit-clang-header-path ${EXAMPLE_LIBRARY_NAME}/${EXAMPLE_LIBRARY_NAME}-Swift.h") 