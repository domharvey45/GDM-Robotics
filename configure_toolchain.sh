#!/bin/bash

export PICO_SDK_PATH=/workspaces/GDM-Robotics/Mickey/packages/pico/pico-sdk && \
 echo "Environment variable set: ${PICO_SDK_PATH}"
export PICO_EXAMPLES_PATH=/workspaces/GDM-Robotics/Mickey/packages/pico/pico-examples
export PACKAGES_PATH=/workspaces/GDM-Robotics/Mickey/packages/
export LIBUSB_INCLUDE_DIR="/usr/include/libusb-1.0"

if [find -- "$PICO_SDK_PATH" -prune -type d -empty | grep -q '^']; then
  echo "$PICO_SDK_PATH is an empty directory"
else
  echo "$PICO_SDK_PATH is not empty, or is not a directory"
fi


# if [ $(ls -A "$PICO_SDK_PATH" | wc -l) -ne 0]
# then
#   cd $PICO_SDK_PATH
#   echo "--- pwd: $(pwd)"
#   echo "--- PICO_SDK_PATH is not empty, updating files..."
#   git pull && git submodule update
# else
#   echo "--- PICO_SDK_PATH is empty, initialising new files..."
#   cd $PACKAGES_PATH
#   echo "--- pwd: $(pwd)"

#   # if [ -d ./pico ]
#   # then 
#   #   echo "deleting pico directory"
#   #   rm -rf ./pico
#   #   echo "remaining files: "
#   #   ls -l
#   # fi

#   # ./pico_setup.sh

# fi

# if [find $PICO_EXAMPLES_PATH -maxdepth 0 -empty]
# then
#   cd "${PICO_EXAMPLES_PATH}\build"
#   echo "--- pwd: $(pwd)"
#   git pull
#   cmake ..
# else
#   git clone https://github.com/raspberrypi/pico-examples.git --branch master
#   cd ./pico-examples
#   mkdir ./build
#   cd build
#   cmake ..
# fi

# # update pico-sdk



