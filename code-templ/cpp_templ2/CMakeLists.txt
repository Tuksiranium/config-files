cmake_minimum_required(VERSION 3.14)
project(cpp-templ2)

set(TEST_NAME "${PROJECT_NAME}.test")
set(MAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/main/main.cpp")
set(CMAKE_CXX_STANDARD 14)

include(FetchContent)
FetchContent_Declare(
    googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG v1.13.0
)
FetchContent_MakeAvailable(googletest)

file(GLOB_RECURSE SRC_FILES "${PROJECT_SOURCE_DIR}/main/src/**")
file(GLOB_RECURSE TEST_FILES "${PROJECT_SOURCE_DIR}/test/**")

# TESTING ---------------------
enable_testing()
add_executable("${TEST_NAME}" "${TEST_FILES}" "${SRC_FILES}")
target_link_libraries("${TEST_NAME}" GTest::gtest_main)
include(GoogleTest)
gtest_discover_tests("${TEST_NAME}")
target_include_directories("${TEST_NAME}" PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}/main/include"
    "${CMAKE_CURRENT_SOURCE_DIR}"
)

# BUILDING MAIN ---------------
add_executable("${PROJECT_NAME}" "${MAIN_FILE}" "${SRC_FILES}")
target_include_directories("${PROJECT_NAME}" PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}/main/include"
    "${CMAKE_CURRENT_SOURCE_DIR}"
)
