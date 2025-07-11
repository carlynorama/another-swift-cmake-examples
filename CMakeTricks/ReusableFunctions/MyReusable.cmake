

function(SIMPLE_TWO REQUIRED_ARG)
    message(STATUS "Simple II arguments: ${REQUIRED_ARG}, followed by ${ARGN}")
    set(${REQUIRED_ARG} "Message From SIMPLE_TWO" PARENT_SCOPE)
    message(("simple_two ra print: ${REQUIRED_ARG}"))
endfunction()