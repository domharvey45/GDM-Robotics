cmake_minimum_required(VERSION 3.13)

# initialize the SDK based on PICO_SDK_PATH
# note: this must happen before project()
include(/workspaces/GDM-Robotics/Mickey/packages/pico/pico-sdk/external/pico_sdk_import.cmake)

project(mickey)

# initialize the Raspberry Pi Pico SDK
pico_sdk_init()

add_executable(mickey ${CURRENT_SOURCE_DIR}/src/c_toolchain_test.c)

# target_include_directories(mickey
#  PRIVATE
#   include/
#   # second_dir/
#   )
