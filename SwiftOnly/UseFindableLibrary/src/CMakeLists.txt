add_executable(${MAIN_TARGET_NAME} Hello.swift Extra.swift)
# The example code namespaces so doing it here.
target_link_libraries(${MAIN_TARGET_NAME} 
    PRIVATE 
    ${EXAMPLE_LIBRARY_NAME}::${EXAMPLE_LIBRARY_NAME}
)
