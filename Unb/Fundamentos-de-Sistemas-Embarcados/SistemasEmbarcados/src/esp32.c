#include "esp32.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "modbus.h"

void printb(char c)
{
	for (int i = 8; i >= 0; i--)
	{
		char bit = (c >> i) & 1;
		printf("%hhd", bit);
	}
}

float get_temp(int uart0_filestream)
{
	mb_package snd = build_package(0x23, 0xAA, 0, NULL);
	mb_package *rcv = send_and_rcv(snd, uart0_filestream);
	float temp;
	memcpy(&temp, rcv->data, 4);
	return temp;
}

char get_turn(int uart0_filestream)
{
	mb_package snd = build_package(0x03, 0x00, 1, NULL);
	mb_package *rcv = send_and_rcv(snd, uart0_filestream);
	return rcv->data[0];
}

void hold_turn(int uart0_filestream)
{
	char data[1] = {3};
	mb_package snd = build_package(0x06, 0x00, 1, data);
	send_and_rcv(snd, uart0_filestream);
}

void write_speed(int uart0_filestream, float speed)
{
	char data[4];
	memcpy(&data, &speed, sizeof(speed));
	mb_package snd = build_package(0x06, 0x03, 4, data);
	send_and_rcv(snd, uart0_filestream);
}

void write_rpm(int uart0_filestream, float rpm)
{
	char data[4];
	memcpy(&data, &rpm, sizeof(rpm));
	mb_package snd = build_package(0x06, 0x07, 4, data);
	send_and_rcv(snd, uart0_filestream);
}

void hold_cruise(int uart0_filestream)
{
	char data[1] = {0x1F};
	mb_package snd = build_package(0x06, 0x01, 1, data);
	send_and_rcv(snd, uart0_filestream);
}

char get_cruise(int uart0_filestream)
{
	mb_package snd = build_package(0x03, 0x01, 1, NULL);
	mb_package *rcv = send_and_rcv(snd, uart0_filestream);
	return rcv->data[0];
}

void left_on(int uart0_filestream)
{
	char data[1] = {1};
	mb_package snd = build_package(0x06, 0x0B, 1, data);
	send_and_rcv(snd, uart0_filestream);
}

void left_off(int uart0_filestream)
{
	char data[1] = {0};
	mb_package snd = build_package(0x06, 0x0B, 1, data);
	send_and_rcv(snd, uart0_filestream);
}
void write_left(int uart0_filestream)
{
	left_on(uart0_filestream);
	sleep(1);
	left_off(uart0_filestream);
	sleep(1);
}

void right_on(int uart0_filestream)
{
	char data[1] = {1};
	mb_package snd = build_package(0x06, 0x0C, 1, data);
	send_and_rcv(snd, uart0_filestream);
}

void right_off(int uart0_filestream)
{
	char data[1] = {0};
	mb_package snd = build_package(0x06, 0x0C, 1, data);
	send_and_rcv(snd, uart0_filestream);
}

void write_right(int uart0_filestream)
{
	right_on(uart0_filestream);
	sleep(1);
	right_off(uart0_filestream);
	sleep(1);
}

void set_esp32(int uart0_filestream)
{
	right_off(uart0_filestream);
	left_off(uart0_filestream);
	high_off(uart0_filestream);
	low_off(uart0_filestream);
}

char get_light(int uart0_filestream)
{
	mb_package snd = build_package(0x03, 0x02, 1, NULL);
	mb_package *rcv = send_and_rcv(snd, uart0_filestream);
	return rcv->data[0];
}

void hold_light(int uart0_filestream)
{
	char data[1] = {0x03};
	mb_package snd = build_package(0x06, 0x02, 1, data);
	send_and_rcv(snd, uart0_filestream);
}

void high_on(int uart0_filestream)
{
	char data[1] = {1};
	mb_package snd = build_package(0x06, 0x0D, 1, data);
	send_and_rcv(snd, uart0_filestream);
}

void high_off(int uart0_filestream)
{
	char data[1] = {0};
	mb_package snd = build_package(0x06, 0x0D, 1, data);
	send_and_rcv(snd, uart0_filestream);
}

void low_on(int uart0_filestream)
{
	char data[1] = {1};
	mb_package snd = build_package(0x06, 0x0E, 1, data);
	send_and_rcv(snd, uart0_filestream);
}

void low_off(int uart0_filestream)
{
	char data[1] = {0};
	mb_package snd = build_package(0x06, 0x0E, 1, data);
	send_and_rcv(snd, uart0_filestream);
}
