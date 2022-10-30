find_program(CONAN_EXECUTABLE "conan")

if(NOT CONAN_EXECUTABLE)
  message(FATAL_ERROR "The required build tool `conan` is not in the PATH")
endif()

message(STATUS "Found conan - proceeding with dependencies...")

if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
  message(NOTICE "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
  file(
    DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/develop/conan.cmake"
    "${CMAKE_BINARY_DIR}/conan.cmake"
  )
endif()

include(${CMAKE_BINARY_DIR}/conan.cmake)

option(CONAN_USE_PREBUILT_BINARIES "Allow Conan to build only missing binaries" ON)

if(CONAN_USE_PREBUILT_BINARIES)
  set(CONAN_BUILD_POLICY "missing")
else()
  set(CONAN_BUILD_POLICY "all")
endif()

if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
  conan_cmake_detect_vs_runtime(CONAN_COMPILER_RUNTIME)
  if(STATIC_RUNTIME_LIBRARY)
    set(CONAN_COMPILER_RUNTIME "MT")
    if(CMAKE_BUILD_TYPE STREQUAL "Debug")
      string(APPEND CONAN_COMPILER_RUNTIME "d")
    endif()
    message(NOTICE "Overwrite VS runtime to: ${CONAN_COMPILER_RUNTIME}")
  endif()
else()
  set(CONAN_COMPILER_RUNTIME "")
endif()

conan_cmake_run(
  CONANFILE conanfile.txt
  BASIC_SETUP
  CMAKE_TARGETS
  BUILD ${CONAN_BUILD_POLICY}
  SETTINGS "compiler.runtime=${CONAN_COMPILER_RUNTIME}"
)

# Append Conan Generated Modules
set(CMAKE_MODULE_PATH "${CMAKE_BINARY_DIR}"
  "${CMAKE_MODULE_PATH}")
