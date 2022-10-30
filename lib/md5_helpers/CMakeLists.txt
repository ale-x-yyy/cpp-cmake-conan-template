cmake_minimum_required(VERSION 3.16)

project(CPPCMAKECONAN_MD5_HELPERS LANGUAGES C CXX)

add_library(md5_helpers STATIC
  include/md5_helpers/utils.h
  src/utils.cpp
)

set_target_compile_warnings(md5_helpers)

target_include_directories(
  md5_helpers
  PUBLIC include
  PRIVATE src
)

target_link_libraries(
  md5_helpers
  PRIVATE CONAN_PKG::poco
)
