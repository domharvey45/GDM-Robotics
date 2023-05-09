cmake_minimum_required(VERSION 3.26)

include($ENV{PICO_SDK_PATH}/pico_sdk_init.cmake)
pico_sdk_init()

project(mickey)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

add_executable(${PROJECT_NAME} ${CMAKE_CURRENT_SOURCE_DIR}/src/CalibrationAndActuation.c)

target_include_directories(${PROJECT_NAME} PUBLIC include)

# Create map/bin/hex/uf2 files
pico_add_extra_outputs(${PROJECT_NAME})

#Link to pico_stdlib (gpio, time, etc. functions)
target_link_libraries(${PROJECT_NAME}
hardware_pwm pico_stdlib hardware_adc
)

# Enabled usb output, disable uart output 
pico_enable_stdio_usb(${PROJECT_NAME} 0)
pico_enable_stdio_uart(${PROJECT_NAME} 1) #picoprobe is connected to target UART pins and we are USB'd to the probe
