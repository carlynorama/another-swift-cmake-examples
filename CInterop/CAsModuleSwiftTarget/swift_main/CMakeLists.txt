add_executable(${MAIN_TARGET_NAME} Hello.swift SwiftMath.swift)
set(CMAKE_Swift_FLAGS "${CMAKE_Swift_FLAGS} -parse-as-library")

target_link_libraries(${MAIN_TARGET_NAME} PUBLIC BackingC)
## where are the headers for -I 
target_include_directories(${MAIN_TARGET_NAME} PUBLIC
                          "${CMAKE_SOURCE_DIR}/c_lib"
                          )