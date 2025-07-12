add_executable(${MAIN_TARGET_NAME} main_program.c)

target_link_libraries(${MAIN_TARGET_NAME} PRIVATE ${EXAMPLE_LIBRARY_NAME})
target_include_directories(${MAIN_TARGET_NAME} PRIVATE ${CMAKE_BINARY_DIR}/${EXAMPLE_LIBRARY_NAME})
