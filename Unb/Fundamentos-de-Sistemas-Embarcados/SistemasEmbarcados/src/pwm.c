#include "pwm.h"
#include <stdio.h>
#include <stdlib.h>
#include <wiringPi.h>
#include <softPwm.h>
#include "pid.h"

#define ACC_POWER 4
#define BRK_POWER 5

void set_pwm()
{
	if (wiringPiSetup() == -1)
	{
		perror("WiringPi falhou!\n");
		exit(1);
	}

	pinMode(ACC_POWER, OUTPUT);
	pinMode(BRK_POWER, OUTPUT);
	softPwmCreate(ACC_POWER, 100, 100);
	softPwmCreate(BRK_POWER, 100, 100);
}

void acc_power(int power)
{
	softPwmWrite(ACC_POWER, power);
}

void brk_power(int power)
{
	softPwmWrite(BRK_POWER, power);
}

void pid_cruise(float set_speed, float current_speed)
{
	double Kp = 0.01 * (set_speed / 60.0),
		   Ki = 0.388 * (set_speed / 60.0),
		   Kd = 2.0 * (set_speed / 60.0);
	pid_atualiza_referencia(set_speed);
	pid_configura_constantes(Kp, Ki, Kd);
	double control_value = pid_controle((double)current_speed);
	acc_power((int)control_value);
}
