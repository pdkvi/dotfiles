add_executable(${PROJECT_NAME})

target_compile_options(${PROJECT_NAME} PRIVATE "-Wall" "-Wextra")

set_target_properties(${PROJECT_NAME} PROPERTIES
    CXX_STANDARD 23
    CXX_STANDARD_REQUIRED TRUE
    CXX_EXTENSIONS FALSE
)

target_include_directories(${PROJECT_NAME}
    PRIVATE "${CMAKE_SOURCE_DIR}/include")

target_precompile_headers(${PROJECT_NAME}
    PRIVATE "${CMAKE_SOURCE_DIR}/include/pch.hpp")

target_sources(${PROJECT_NAME}
    PRIVATE
	"./main.cpp"
)
