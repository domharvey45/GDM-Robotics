cmake_minimum_required(VERSION 3.26)

include($ENV{PICO_SDK_PATH}/pico_sdk_init.cmake)
pico_sdk_init()

project(mickey)

set(CMAKE_CXX_STANDARD 14)

add_executable(mickey ${CMAKE_CURRENT_SOURCE_DIR}/src/c_toolchain_test.c)

target_include_directories(mickey
 PUBLIC
  include/
  # second_dir/
  )
