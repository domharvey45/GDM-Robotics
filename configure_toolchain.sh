#!/bin/bash

export PICO_SDK_PATH=/workspaces/GDM-Robotics/Mickey/packages/pico/pico-sdk && \
 echo "Environment variable set: ${PICO_SDK_PATH}"

# update pico-sdk
cd /workspaces/GDM-Robotics/Mickey/packages/pico/pico-sdk 
echo "--- pwd: $(pwd)"
git pull && git submodule update


cd /workspaces/GDM-Robotics/Mickey/packages/pico/pico-examples/build
echo "--- pwd: $(pwd)"
cmake ..

