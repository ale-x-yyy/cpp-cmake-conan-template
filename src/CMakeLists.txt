cmake_minimum_required(VERSION 3.16)

project(CPPCMAKECONAN_MD5 LANGUAGES C CXX)

add_executable(md5 md5.cpp)
set_target_compile_warnings(md5)

target_link_libraries(
  md5
  PRIVATE md5_helpers
)
