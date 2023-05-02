# Give Me A Hand: Code Breakdown

This is a breakdown and information hub of the project code into distinct sections based on the previously created flowcharts.

## Language

Arduino is just a set of libraries that simplify some C++14 processes. This means we can write C/C++ code and just `#include` the required libraries.

Since a number of C++ features compile to be more resource intensive than expected, it is advised that the code is written in C where possible. The Raspberry Pi Pico C/C++ SDK is here:

<https://www.raspberrypi.com/documentation/microcontrollers/c_sdk.html>

For a comparison between arduino and C/C++14, see the following forum thread:

<https://arduino.stackexchange.com/questions/816/c-vs-the-arduino-language>.

## System Configuration

A centralised config file or set of config files will be important to have for storing threshold limits and any important parameters.

While a singular config file is preferred for simplicity, it is permissable that a new file may be created for each over-arching function outlined in this document.

In order to simplify parameter processing, a serialised file format such as JSON, YAML, or Header files may be used, but stay consistent.

## Kalman Filter

### Github Repositories

A number of github repositories currently exist to add kalman filter implementation to the Arduino ecosystem.

1. <https://github.com/rfetick/Kalman>
2. <https://github.com/TKJElectronics/KalmanFilter>

### Web Resources

1. <https://www.kalmanfilter.net/default.aspx>
2. <https://www.alanzucconi.com/2022/07/24/kalman-filter-1/>

## Motor Current Protection

The current monitoring chip from the motor will supply a voltage to the ADC. PWM should be stopped when this voltage reaches the set threshold current set in the config file. Since the motor stalls at 2 Amps, the threshold should be set at, or just below this value.

The code for the current monitoring should export a value for the current as its standard output. This will all implementations of the function to simply access the current without concern about processing.

