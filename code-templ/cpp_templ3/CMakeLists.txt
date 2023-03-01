cmake_minimum_required(VERSION 3.18)

project(project-name)

set(PROJECT_FILES
    src/main.cpp
)

# -----------------------------------------------------------------------------

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_COMPILER /usr/bin/clang++)
add_compile_options(-Wall -Wextra -Wpedantic)

add_executable("${PROJECT_NAME}" "${PROJECT_FILES}")
target_include_directories("${PROJECT_NAME}"
    PUBLIC
	"${CMAKE_CURRENT_SOURCE_DIR}/include"
	"${CMAKE_CURRENT_SOURCE_DIR}"
)

