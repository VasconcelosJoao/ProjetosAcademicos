#include "gpio.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <bcm2835.h>
#include <sys/time.h>
#include "thread_tools.h"
#include "pwm.h"

extern int cruise_on;
char prev_acc = 0;
char prev_brk = 0;

void disable_cruise_control()
{
	cruise_on = 0;
}

void set_pins()
{
	if (!bcm2835_init())
	{
		perror("BCM falhou!\n");
		exit(1);
	}

	bcm2835_gpio_fsel(LEFT, BCM2835_GPIO_FSEL_OUTP);
	bcm2835_gpio_fsel(RIGHT, BCM2835_GPIO_FSEL_OUTP);
	bcm2835_gpio_fsel(DIR1, BCM2835_GPIO_FSEL_OUTP);
	bcm2835_gpio_fsel(DIR2, BCM2835_GPIO_FSEL_OUTP);
	bcm2835_gpio_fsel(BRK_LIGHT, BCM2835_GPIO_FSEL_OUTP);
	bcm2835_gpio_fsel(LOW_LIGHT, BCM2835_GPIO_FSEL_OUTP);
	bcm2835_gpio_fsel(HIGH_LIGHT, BCM2835_GPIO_FSEL_OUTP);

	bcm2835_gpio_fsel(ACC_PEDAL, BCM2835_GPIO_FSEL_INPT);
	bcm2835_gpio_fsel(BRK_PEDAL, BCM2835_GPIO_FSEL_INPT);
	bcm2835_gpio_fsel(WHEELA, BCM2835_GPIO_FSEL_INPT);
	bcm2835_gpio_fsel(WHEELB, BCM2835_GPIO_FSEL_INPT);
	bcm2835_gpio_fsel(ENGINE, BCM2835_GPIO_FSEL_INPT);
}

void high_light_on()
{
	bcm2835_gpio_write(HIGH_LIGHT, HIGH);
}

void high_light_off()
{
	bcm2835_gpio_write(HIGH_LIGHT, LOW);
}

void low_light_on()
{
	bcm2835_gpio_write(LOW_LIGHT, HIGH);
}

void low_light_off()
{
	bcm2835_gpio_write(LOW_LIGHT, LOW);
}

void left_blink()
{
	bcm2835_gpio_write(LEFT, HIGH);
	sleep(1);
	bcm2835_gpio_write(LEFT, LOW);
	sleep(1);
}

void right_blink()
{
	bcm2835_gpio_write(RIGHT, HIGH);
	sleep(1);
	bcm2835_gpio_write(RIGHT, LOW);
	sleep(1);
}

void engine(int acc, int dir)
{
	if (acc == 0)
	{
		acc_power(0);
		bcm2835_gpio_write(DIR1, LOW);
		bcm2835_gpio_write(DIR2, LOW);
	}
	else if (acc == 1 && dir == 1)
	{
		acc_power(100);
		bcm2835_gpio_write(DIR1, HIGH);
		bcm2835_gpio_write(DIR2, LOW);
	}
	else if (acc == 1 && dir == 2)
	{
		acc_power(100);
		bcm2835_gpio_write(DIR1, LOW);
		bcm2835_gpio_write(DIR2, HIGH);
	}
	else if (acc == 1 && dir == 0)
	{
		acc_power(100);
		bcm2835_gpio_write(DIR1, HIGH);
		bcm2835_gpio_write(DIR2, HIGH);
	}
}

char get_acc()
{
	char acc = bcm2835_gpio_lev(ACC_PEDAL) == HIGH ? 1 : 0;
	if (acc && !prev_acc)
	{
		disable_cruise_control();
	}
	prev_acc = acc;
	return acc;
}

char get_break()
{
	char brk = bcm2835_gpio_lev(BRK_PEDAL) == HIGH ? 1 : 0;
	if (brk && !prev_brk)
	{
		disable_cruise_control();
	}
	prev_brk = brk;
	return brk;
}

void brk_on()
{
	if (get_break())
	{
		disable_cruise_control();
		bcm2835_gpio_write(BRK_LIGHT, HIGH);
		brk_power(100);
	}
	else
	{
		bcm2835_gpio_write(BRK_LIGHT, LOW);
		brk_power(0);
	}
}

void temp_light(float temp)
{
	if (temp > 115)
		bcm2835_gpio_write(TEMP_LIGHT, HIGH);
	else
		bcm2835_gpio_write(TEMP_LIGHT, LOW);
}

float get_speed(int count)
{
	float ms_speed = 1.9792f * (float)count;
	float kmh_speed = ms_speed * 3.6f;
	return kmh_speed;
}

void all_off()
{
	bcm2835_gpio_write(RIGHT, LOW);
	bcm2835_gpio_write(LEFT, LOW);
	bcm2835_gpio_write(DIR1, LOW);
	bcm2835_gpio_write(DIR2, LOW);
	bcm2835_gpio_write(BRK_LIGHT, LOW);
	bcm2835_gpio_write(HIGH_LIGHT, LOW);
	bcm2835_gpio_write(LOW_LIGHT, LOW);
	printf("Pinos Desligados\n");
}