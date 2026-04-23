#include "bmp280.h"
#include <wiringPiI2C.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>

#define BMP280_ADDRESS 0x76

static uint16_t dig_T1;
static int16_t dig_T2, dig_T3;
static int fd;

static uint16_t read16_LE(int reg)
{
    uint16_t value = wiringPiI2CReadReg16(fd, reg);
    return (value >> 8) | (value << 8);
}

void read_calibration_data()
{
    dig_T1 = read16_LE(0x88);
    dig_T2 = (int16_t)read16_LE(0x8A);
    dig_T3 = (int16_t)read16_LE(0x8C);
    printf("calibragem: T1=%u, T2=%d, T3=%d\n", dig_T1, dig_T2, dig_T3);
}

void bmp280_init()
{
    fd = wiringPiI2CSetup(BMP280_ADDRESS);
    if (fd == -1)
    {
        perror("BMP280 Falhou!\n");
        exit(1);
    }

    wiringPiI2CWriteReg8(fd, 0xF4, 0x27);
    wiringPiI2CWriteReg8(fd, 0xF5, 0xA0);
    read_calibration_data();
}

float read_temperature()
{
    int32_t raw_temp = (wiringPiI2CReadReg8(fd, 0xFA) << 12) |
                       (wiringPiI2CReadReg8(fd, 0xFB) << 4) |
                       (wiringPiI2CReadReg8(fd, 0xFC) >> 4);
    if (raw_temp == 0x80000)
        return NAN;

    int32_t var1 = ((((raw_temp >> 3) - ((int32_t)dig_T1 << 1))) * ((int32_t)dig_T2)) >> 11;
    int32_t var2 = (((((raw_temp >> 4) - ((int32_t)dig_T1)) * ((raw_temp >> 4) - ((int32_t)dig_T1))) >> 12) * ((int32_t)dig_T3)) >> 14;
    int32_t t_fine = var1 + var2;
    float temperature = (t_fine * 5 + 128) >> 8;

    return temperature / 100.0;
}