#!/bin/bash

export PICO_SDK_PATH=/workspaces/GDM-Robotics/Mickey/packages/pico/pico-sdk && \
 echo "Environment variable set: ${PICO_SDK_PATH}"
export PICO_EXAMPLES_PATH=/workspaces/GDM-Robotics/Mickey/packages/pico/pico-examples
export PACKAGES_PATH=/workspaces/GDM-Robotics/Mickey/packages/
export LIBUSB_INCLUDE_DIR="/usr/include/libusb-1.0"

# if [ `find -- "$PICO_SDK_PATH" -prune -type d -empty` == true ]; then
if [ `find "$PICO_SDK_PATH" -prune -type d -empty` == `true`]; then
  echo "--- PICO_SDK_PATH is empty, initialising new files..."
  cd $PACKAGES_PATH
  echo "--- pwd: $(pwd)"

  if [ -d ./pico ]
  then 
    echo "deleting pico directory"
    rm -rfv ./pico
    echo "remaining files: "
    ls -l
  fi

  chmod +x ./pico_setup.sh

  ./pico_setup.sh

else
  cd $PICO_SDK_PATH
  echo "--- pwd: $(pwd)"
  echo "--- PICO_SDK_PATH is not empty, updating files..."
  git pull && git submodule update
fi

echo "Configuration complete"

