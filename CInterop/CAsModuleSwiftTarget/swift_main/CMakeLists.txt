add_executable(${MAIN_TARGET_NAME} Hello.swift SwiftMath.swift)

target_link_libraries(${MAIN_TARGET_NAME} PUBLIC BackingC)

set(CMAKE_Swift_FLAGS "${CMAKE_Swift_FLAGS} -parse-as-library")

target_include_directories(${MAIN_TARGET_NAME} PUBLIC
                          "${CMAKE_SOURCE_DIR}/c_lib"
                          )

# (CMAKE_SOURCE_DIR) for header (CMAKE_BINARY_DIR) for o file? 