#ifndef GPIO_H
#define GPIO_H

#define LEFT 8
#define RIGHT 7
#define ACC_PEDAL 27
#define BRK_PEDAL 22
#define DIR1 17
#define DIR2 18
#define BRK_LIGHT 25
#define ACC_POWER 23
#define BRK_POWER 24
#define TEMP_LIGHT 12
#define WHEELA 5
#define WHEELB 6
#define ENGINE 11
#define LOW_LIGHT 19
#define HIGH_LIGHT 26

void set_pins();
void left_blink();
void right_blink();
void engine(int acc, int brk);
char get_acc();
char get_break();
void brk_on();
void temp_light(float temp);
float get_speed(int count);
void all_off();
void high_light_on();
void high_light_off();
void low_light_on();
void low_light_off();
void disable_cruise_control();

#endif