cmake_minimum_required(VERSION 3.1.0)

project(mylib VERSION 0.1.0 DESCRIPTION "mylib library project")

if(CMAKE_VERSION VERSION_LESS "3.7.0")
    set(CMAKE_INCLUDE_CURRENT_DIR ON)
endif()

add_subdirectory(src)
add_subdirectory(examples)

