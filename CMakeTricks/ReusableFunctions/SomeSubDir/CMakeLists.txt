simple(SIMPLE_MESSAGE Foo Bar)
message("Output in Subdir Post simple: ${SIMPLE_MESSAGE}")

simple_two(ANOTHER_SIMPLE_MESSAGE foooootastic barlicious)
message("Output in Subdir Post simple_two:: ${ANOTHER_SIMPLE_MESSAGE}")

complex(SINGLE ONE_VALUE value MULTI_VALUES some other values)
# COMPLEX_PREFIX_SINGLE = TRUE
# COMPLEX_PREFIX_ANOTHER = FALSE
# COMPLEX_PREFIX_ONE_VALUE = "value"
# COMPLEX_PREFIX_ALSO_ONE_VALUE = <UNDEFINED>
# COMPLEX_PREFIX_MULTI_VALUES = "some;other;values"