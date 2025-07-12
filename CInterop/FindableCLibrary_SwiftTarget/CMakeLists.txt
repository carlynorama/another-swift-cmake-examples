cmake_minimum_required(VERSION 4.0)

## pull project name from environment (set in build script)
## TODO - this is bad pattern??? 
set(PROJECT_NAME $ENV{PROJECT_NAME})
set(MAIN_TARGET_NAME ${PROJECT_NAME})

project(${PROJECT_NAME} LANGUAGES C Swift)

# exported in the libs install script
set(INSTALL_PREFIX "$ENV{TEST_INSTALL_DIR}")
message("----------${INSTALL_PREFIX}----------------")

## Finding The Fancy Lib
 include(GNUInstallDirs)
 include(${INSTALL_PREFIX}/MyFancyMath/${CMAKE_INSTALL_LIBDIR}/cmake/MyFancyMath/MyFancyMathTargets.cmake)
 add_executable(${MAIN_TARGET_NAME} Hello.swift SwiftMath.swift)
 target_link_libraries(${MAIN_TARGET_NAME} 
        PRIVATE  
            MyFancyMath::MyFancyMath
 )
##

message("----------${CMAKE_INSTALL_INCLUDEDIR}----------------")

## when using struct with an @main
set(CMAKE_Swift_FLAGS "${CMAKE_Swift_FLAGS} -parse-as-library") 
