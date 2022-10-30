cmake_minimum_required(VERSION 3.16)

project(CPPCMAKECONAN LANGUAGES C CXX)

set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake"
  "${CMAKE_MODULE_PATH}")

include(PreventInSourceBuilds)
include(StandardProjectSettings)
include(CompileOptions)
include(ConanConfig)

add_subdirectory(lib)
add_subdirectory(src)
