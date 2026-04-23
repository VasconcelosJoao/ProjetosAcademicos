#ifndef PWM_H
#define PWM_H
void set_pwm();
void acc_power(int power);
void brk_power(int power);
void pid_cruise(float set_speed, float current_speed);
#endif
