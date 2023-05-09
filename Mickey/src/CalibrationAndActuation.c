#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include "pico/stdlib.h"
#include "hardware/adc.h"
#include "hardware/pwm.h"


#define MAXIMUM_ADC_VALUE 65535
#define MIN_SERVO_ANGLE_DEGREES 0
#define MAX_SERVO_ANGLE_DEGREES 130 // Pulley must rotate 123.7589 degrees to pick up pen so max value is slightly more
#define EMG_SAMPLE_NUMBER 100
#define ADC_PIN_FOR_EMG 26 // temp value
#define LED_GPIO_PIN 10 // temp value
#define MOTOR_GPIO_PIN 20 // temp value
#define INITIATE_CALIBRATION 1 // temp replacement of button input
#define INITIAL_MILLIS 400 // MAYBE temp value
#define MILLIS_PER_DEGREE 11 // MAYBE temp value

// FUNCTION PROTOTYPES//
int CalibrateUserValues(
  float *min_emg_sensor_value, 
  float *max_emg_sensor_value
  );

float ADCtoAngle(
  float max_emg_sensor_value, 
  float min_emg_sensor_value
  );

// MAIN //
int main()
{
    // Initialise and declare variables, and set motor to open (0 degrees)
    float angle = 0;
    float previous_angle = 0;
    float angle_delta;
    float max_emg_sensor_value;
    float min_emg_sensor_value;
    float current_millis = INITIAL_MILLIS;
    int direction = 1;
    setMotor(MOTOR_GPIO_PIN, current_millis);

    // Calibrate if button is pressed - CHANGE IF STATEMENT PARAMETER FROM PREPROCESSOR DEFINE TO HIGH ON CALIBRATE BUTTON PIN VALUE AND MOVE TO WHILE LOOP
    if (INITIATE_CALIBRATION == 1)
    {
      CalibrateUserValues(&min_emg_sensor_value, &max_emg_sensor_value);
    }

    // Calculate Angle and direction
    angle = ADCtoAngle(max_emg_sensor_value, min_emg_sensor_value);
    angle_delta = angle - previous_angle;

    if (angle_delta < 0)
    {
      direction = -1;
    }
    else if (angle_delta >= 0)
    {
      direction = 1;
    }

    // Set millis to corresponding angle
    current_millis = current_millis + direction *(angle*MILLIS_PER_DEGREE);
    setMillis(MOTOR_GPIO_PIN, current_millis);
    previous_angle = angle;

    return 1;
}

// FUNCTIONS //
// Convert user input to an angle
float ADCtoAngle(float max_emg_sensor_value, float min_emg_sensor_value)
{
    // Initialise variables
    float adc_input;
    float angle;
    float max = max_emg_sensor_value;
    float min = min_emg_sensor_value;

    // Take ADC input from myoelectric pin and calculate angle
    adc_init();
    adc_select_input(ADC_PIN_FOR_EMG - 26); // Select an ADC input. 0...3 are GPIOs 26...29 respectively
    adc_input = adc_read();
    angle = MIN_SERVO_ANGLE_DEGREES + ((adc_input - min)/(max - min)) * (MAX_SERVO_ANGLE_DEGREES - MIN_SERVO_ANGLE_DEGREES);
    
    // Clip/lift angle if not within range
    if (angle > MAX_SERVO_ANGLE_DEGREES)
    {
        angle = MAX_SERVO_ANGLE_DEGREES;
    }
    else if (angle < MIN_SERVO_ANGLE_DEGREES)
    {
        angle = MIN_SERVO_ANGLE_DEGREES;
    }
    else{}

    return angle;
}

// Function turns LED on, waits for a few seconds for low inputs, averages them, then turns LED off and waits so the user can tense, and then repeats for high inputs
int CalibrateUserValues(float *min_emg_sensor_value, float *max_emg_sensor_value)
{
  // https://www.raspberrypi.com/documentation//pico-sdk/hardware.html#ga5d3b8875947df2f4ba022cb6aa40594b

  // Initialize ADC
  adc_init();
  adc_select_input(ADC_PIN_FOR_EMG - 26); // Select an ADC input. 0...3 are GPIOs 26...29 respectively. Input 4 is the onboard temperature sensor.

  // Initialize LED
  gpio_init(LED_GPIO_PIN);
  gpio_set_dir(LED_GPIO_PIN, GPIO_OUT);

  // Wait so user can relax muscle
  sleep_ms(1000);

  // Collect low signal samples for calibration
  *min_emg_sensor_value = collect_sample_and_average();

  // Wait so user can tense
  sleep_ms(1000);

  // Collect high signal samples for calibration
  *max_emg_sensor_value = collect_sample_and_average();

  return (0);
}

float collect_sample_and_average()
{
  float adc_total = 0;
  gpio_put(LED_GPIO_PIN, 1); // turn on LED
  for (int i = 0; i < number_samples; i++)
  {
    adc_total = adc_total + (float)adc_read();
    sleep_ms(50);
  }
  gpio_put(LED_GPIO_PIN, 0); // turn off LED

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
