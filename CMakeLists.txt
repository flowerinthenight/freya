# This file is only for clangd LSP, not for actual build.

cmake_minimum_required(VERSION 3.14)
project(freya)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

file(GLOB_RECURSE sources "${CMAKE_SOURCE_DIR}/c/*.c")

add_executable(freya ${sources})

target_include_directories(freya
                           PUBLIC "c"
                                  "c/flatcc"
                                  "c/flatcc/portable"
                                  "c/nanoarrow")
