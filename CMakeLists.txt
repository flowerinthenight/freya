cmake_minimum_required(VERSION 3.14)
project(thea)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

file(GLOB_RECURSE sources "${CMAKE_SOURCE_DIR}/c/*.c")

add_executable(thea ${sources})

target_include_directories(thea
                           PUBLIC "{CMAKE_SOURCE_DIR}/c"
                                  "{CMAKE_SOURCE_DIR}/c/flatcc"
                                  "{CMAKE_SOURCE_DIR}/c/flatcc/portable"
                                  "{CMAKE_SOURCE_DIR}/c/nanoarrow")
