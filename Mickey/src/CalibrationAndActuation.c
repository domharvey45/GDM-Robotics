#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include "pico/stdlib.h"
#include "hardware/adc.h"
#include "hardware/pwm.h"


#define max_ADC_value 65535
#define min_servo_angle_degrees 0
#define max_servo_angle_degrees 130 // Pulley must rotate 123.7589 degrees to pick up pen so max value is slightly more
#define number_samples 100
#define myoelectric_sensor_ADC_GPIO_pin 26 // temp value
#define LED_gpio_pin 10 // temp value
#define motor_gpio_pin 20 // temp value
#define calibrateFlag 1 // temp replacement of button input
#define zero_millis 400 // MAYBE temp value
#define one_degree_millis 11 // MAYBE temp value

// FUNCTION PROTOTYPES//
int CalibrateUserValues(float *min_user_signal_value, float *max_user_signal_value);
float ADCtoAngle(float max_user_signal_value, float min_user_signal_value);

// MAIN //
int main()
{
    // Initialise and declare variables, and set motor to open (0 degrees)
    float angle = 0;
    float old_angle = 0;
    float d_angle;
    float max_user_signal_value;
    float min_user_signal_value;
    float current_millis = zero_millis;
    int direction = 1;
    setMotor(motor_gpio_pin, current_millis);

    // Calibrate if button is pressed - CHANGE IF STATEMENT PARAMETER FROM PREPROCESSOR DEFINE TO HIGH ON CALIBRATE BUTTON PIN VALUE AND MOVE TO WHILE LOOP
    if (calibrateFlag == 1)
    {
      CalibrateUserValues(&min_user_signal_value, &max_user_signal_value);
    }

    // Calculate Angle and direction
    angle = ADCtoAngle(max_user_signal_value, min_user_signal_value);
    d_angle = angle - old_angle;

    if (d_angle < 0)
    {
      direction = -1;
    }
    else if (d_angle >= 0)
    {
      direction = 1;
    }

    // Set millis to corresponding angle
    current_millis = current_millis + direction *(angle*one_degree_millis);
    setMillis(motor_gpio_pin, current_millis);
    old_angle = angle;

    return 1;
}

// FUNCTIONS //
// Convert user input to an angle
float ADCtoAngle(float max_user_signal_value, float min_user_signal_value)
{
    // Initialise variables
    float adc_input;
    float angle;
    float max = max_user_signal_value;
    float min = min_user_signal_value;

    // Take ADC input from myoelectric pin and calculate angle
    adc_init();
    adc_select_input(myoelectric_sensor_ADC_GPIO_pin - 26); // Select an ADC input. 0...3 are GPIOs 26...29 respectively
    adc_input = adc_read();
    angle = min_servo_angle_degrees + ((adc_input - min)/(max - min)) * (max_servo_angle_degrees - min_servo_angle_degrees);
    
    // Clip/lift angle if not within range
    if (angle > max_servo_angle_degrees)
    {
        angle = max_servo_angle_degrees;
    }
    else if (angle < min_servo_angle_degrees)
    {
        angle = min_servo_angle_degrees;
    }
    else{}

    return angle;
}

// Function turns LED on, waits for a few seconds for low inputs, averages them, then turns LED off and waits so the user can tense, and then repeats for high inputs
int CalibrateUserValues(float *min_user_signal_value, float *max_user_signal_value)
{
  // https://www.raspberrypi.com/documentation//pico-sdk/hardware.html#ga5d3b8875947df2f4ba022cb6aa40594b

  // Initialize ADC
  adc_init();
  adc_select_input(myoelectric_sensor_ADC_GPIO_pin - 26); // Select an ADC input. 0...3 are GPIOs 26...29 respectively. Input 4 is the onboard temperature sensor.

  // Initialize LED
  gpio_init(LED_gpio_pin);
  gpio_set_dir(LED_gpio_pin, GPIO_OUT);

  // Wait so user can relax muscle
  sleep_ms(1000);

  // Collect low signal samples for calibration
  *min_user_signal_value = collect_sample_and_average();

  // Wait so user can tense
  sleep_ms(1000);

  // Collect high signal samples for calibration
  *max_user_signal_value = collect_sample_and_average();

  return (0);
}

float collect_sample_and_average()
{
  float adc_total = 0;
  gpio_put(LED_gpio_pin, 1); // turn on LED
  for (int i = 0; i < number_samples; i++)
  {
    adc_total = adc_total + (float)adc_read();
    sleep_ms(50);
  }
  gpio_put(LED_gpio_pin, 0); // turn off LED

  // Calculate average ADC value for signal
  float value = adc_total / number_samples;
  return (value);
}

void setMillis(int motorPin, float millis)
{
  pwm_set_gpio_level(motorPin, (millis/20000.f)*39062.f);  
}

void setMotor(int motorPin, float startMillis)
{
  gpio_set_function(servoPin, GPIO_FUNC_PWM);
  uint slice_num = pwm_gpio_to_slice_num(servoPin);

  pwm_config config = pwm_get_default_config();
  pwm_config_set_clkdiv(&config, 64.f);
  pwm_config_set_wrap(&config, 39062.f);

  pwm_init(slice_num, &config, true);

  setMillis(servoPin, startMillis);

}
