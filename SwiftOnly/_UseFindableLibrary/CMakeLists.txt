cmake_minimum_required(VERSION 4.0)

## pull project name from environment (set in build script)
set(PROJECT_NAME $ENV{PROJECT_NAME})
set(MAIN_TARGET_NAME ${PROJECT_NAME})
set(EXAMPLE_LIBRARY_NAME MyFancyResponder)

project(${PROJECT_NAME} 
    LANGUAGES Swift
    # VERSION 0.1.0
)

# exported in the build script
set(INSTALL_PREFIX "$ENV{TEST_INSTALL_DIR}")

find_package(${EXAMPLE_LIBRARY_NAME} 2.0.1 EXACT
             HINTS ${INSTALL_PREFIX}/
)

set(FOUND_FLAG ${${EXAMPLE_LIBRARY_NAME}_FOUND})
message(${FOUND_FLAG})
message(${INSTALL_PREFIX})
IF (${FOUND_FLAG})
   MESSAGE(STATUS "-------------Found ${EXAMPLE_LIBRARY_NAME}.------------------")
ELSE (${FOUND_FLAG})
   MESSAGE(FATAL_ERROR "-------------Could not locate ${EXAMPLE_LIBRARY_NAME}.-------------")
ENDIF (${FOUND_FLAG})

add_subdirectory("src/")

set(CMAKE_Swift_FLAGS "${CMAKE_Swift_FLAGS} -parse-as-library")