cmake_minimum_required(VERSION 3.18)

project(tp5-livre-recettes-cuisine)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_COMPILER /usr/bin/clang++)
add_compile_options(-Wall -Wextra -Wpedantic)

set(FILES_NAME
		unite
		quantite
		ingredient
		recette
        affichage)

set(SRC_FILES "${FILES_NAME}")
set(INC_FILES "${FILES_NAME}")
list(TRANSFORM SRC_FILES REPLACE "^(.+)$" "${CMAKE_CURRENT_SOURCE_DIR}/src/\\1.cpp")
list(TRANSFORM INC_FILES REPLACE "^(.+)$" "${CMAKE_CURRENT_SOURCE_DIR}/include/\\1.hpp")

add_executable("${PROJECT_NAME}" "${CMAKE_CURRENT_SOURCE_DIR}/main.cpp" "${SRC_FILES}")
target_include_directories("${PROJECT_NAME}" PUBLIC
	"${CMAKE_CURRENT_SOURCE_DIR}/include"
	"${CMAKE_CURRENT_SOURCE_DIR}"
)

