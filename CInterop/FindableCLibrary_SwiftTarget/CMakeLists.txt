cmake_minimum_required(VERSION 4.0)

## pull project name from environment (set in build script)
## TODO - this is bad pattern??? 
set(PROJECT_NAME $ENV{PROJECT_NAME})
set(MAIN_TARGET_NAME ${PROJECT_NAME})

project(${PROJECT_NAME} LANGUAGES C Swift)

# exported in the build script
set(INSTALL_PREFIX "$ENV{TEST_INSTALL_DIR}")

find_package(MyFancyMath 2.0.1 EXACT
             HINTS ${INSTALL_PREFIX}/
)
IF (${MyFancyMath_FOUND})
   MESSAGE(STATUS "-------------Found MyFancyMath.------------------")
ELSE (${MyFancyMath_FOUND})
   MESSAGE(FATAL_ERROR "-------------Could not locate MyFancyMath.-------------")
ENDIF (${MyFancyMath_FOUND})

add_executable(${MAIN_TARGET_NAME} Hello.swift SwiftMath.swift)
target_link_libraries(${MAIN_TARGET_NAME} 
    PRIVATE  
        MyFancyMath::MyFancyMath
)

## Finding The Fancy Lib v. 1 before the config file
#  set(INSTALL_PREFIX "$ENV{TEST_INSTALL_DIR}")
#  include(GNUInstallDirs)
#  include(${INSTALL_PREFIX}/MyFancyMath/${CMAKE_INSTALL_LIBDIR}/cmake/MyFancyMath/MyFancyMathTargets.cmake)
#  add_executable(${MAIN_TARGET_NAME} Hello.swift SwiftMath.swift)
#  target_link_libraries(${MAIN_TARGET_NAME} 
#         PRIVATE  
#             MyFancyMath::MyFancyMath
#  )
##

## when using struct with an @main
set(CMAKE_Swift_FLAGS "${CMAKE_Swift_FLAGS} -parse-as-library") 
