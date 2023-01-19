cmake_minimum_required(VERSION 3.0.0)

project( cpp-cmake-templ )

file(GLOB_RECURSE SRC_FILES "src/**")

add_library(display STATIC lib/display/display.cpp)
target_include_directories(display PUBLIC
	"${CMAKE_CURRENT_SOURCE_DIR}/lib/display"
)
add_library(calcul STATIC lib/calcul/add.cpp)
target_include_directories(calcul PUBLIC
	"${CMAKE_CURRENT_SOURCE_DIR}/lib/calcul"
)

add_executable("${PROJECT_NAME}" main.cpp "${SRC_FILES}")
target_include_directories("${PROJECT_NAME}" PUBLIC
	"${CMAKE_CURRENT_SOURCE_DIR}/include"
	"${CMAKE_CURRENT_SOURCE_DIR}/lib"
	"${CMAKE_CURRENT_SOURCE_DIR}"
)

target_link_libraries("${PROJECT_NAME}" PUBLIC display calcul)