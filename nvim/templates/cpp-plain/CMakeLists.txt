cmake_minimum_required (VERSION 3.25)
project("cpp-plain")

# add project-local module directory to cmake module path
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# compile time
if (TRUE)
	set_property(GLOBAL PROPERTY
        RULE_LAUNCH_COMPILE "\"${CMAKE_COMMAND}\" -E time")
	set_property(GLOBAL PROPERTY
        RULE_LAUNCH_LINK "\"${CMAKE_COMMAND}\" -E time")
endif()

add_subdirectory("src")
