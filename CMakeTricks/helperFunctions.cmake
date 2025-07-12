macro(cache_set)
    set(${ARGN} CACHE INTERNAL "" FORCE)
endmacro()