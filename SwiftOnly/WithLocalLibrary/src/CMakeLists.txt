add_executable(${MAIN_TARGET_NAME} Hello.swift)
set(CMAKE_Swift_FLAGS "${CMAKE_Swift_FLAGS} -parse-as-library")
#target_link_libraries(factorials PRIVATE factorial)