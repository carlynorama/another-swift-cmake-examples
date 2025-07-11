# https://cliutils.gitlab.io/modern-cmake/chapters/basics/functions.html
cmake_minimum_required(VERSION 4.0)


function(SIMPLE REQUIRED_ARG)
    message(STATUS "Simple arguments: ${REQUIRED_ARG}, followed by ${ARGN}")
    set(${REQUIRED_ARG} "Message From SIMPLE" PARENT_SCOPE)
endfunction()

function(COMPLEX)
    cmake_parse_arguments(
        COMPLEX_PREFIX
        "SINGLE;ANOTHER"
        "ONE_VALUE;ALSO_ONE_VALUE"
        "MULTI_VALUES"
        ${ARGN}
    )
    message("Complex Output: 
                             ${COMPLEX_PREFIX_SINGLE}, 
                             ${COMPLEX_PREFIX_ANOTHER}, 
                             ${COMPLEX_PREFIX_ONE_VALUE},
                             ${COMPLEX_PREFIX_ALSO_ONE_VALUE},
                             ${COMPLEX_PREFIX_MULTI_VALUES},
                             ${COMPLEX_PREFIX_UNPARSED_ARGUMENTS}")

endfunction()


add_subdirectory(SomeSubDir)
# message(${arg_REQUIRED_ARG})