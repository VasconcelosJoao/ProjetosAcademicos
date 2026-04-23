#include "text_builder.h"
#include <stdlib.h>
#include <string.h>
#include <math.h>

extern float total_distance_m;
extern float set_speed;
extern float temperature;

#define HIGH 1

char *append_txt(char *main_txt, char *append, int value, int append_size, char *post, int post_size)
{
    memcpy(main_txt, append, append_size);
    main_txt += append_size;
    char val_str[10];
    int i = 0;
    if (value == 0)
    {
        val_str[0] = '0';
        i = 1;
    }
    while (value > 0)
    {
        val_str[i] = value % 10 + '0';
        value /= 10;
        i++;
    }
    if (value == 0)
    {
        for (int j = i - 1; j >= 0; j--)
            *main_txt++ = val_str[j];
    }
    else if (value == -1)
    {
        *main_txt++ = 'O';
        *main_txt++ = 'N';
    }
    else if (value == -2)
    {
        *main_txt++ = 'O';
        *main_txt++ = 'F';
        *main_txt++ = 'F';
    }
    if (post != NULL)
        memcpy(main_txt, post, post_size);
    main_txt += post_size;
    *main_txt++ = '\n';
    return main_txt;
}

char *build_oled_text(int oled_speed, int rpm, uint8_t temp_light, int cruise)
{
    char *txt = malloc(sizeof(char) * 200);
    char *aux = txt;
    char speed_txt[13] = {'V', 'e', 'l', 'o', 'c', 'i', 'd', 'a', 'd', 'e', ' ', '=', ' '};
    char engine_txt[10] = {'R', 'o', 't', 'a', 'c', 'a', 'o', ' ', '=', ' '};
    char dist_txt[12] = {'D', 'i', 's', 't', 'a', 'n', 'c', 'i', 'a', ' ', '=', ' '};
    char temp_txt[7] = {'T', 'e', 'm', 'p', ' ', '=', ' '};
    char alert_temp_txt[12] = {'A', 'l', 'e', 'r', 't', 'a', ' ', 'T', 'e', 'm', 'p', ' '};
    char cruise_txt[17] = {'C', 'r', 'u', 'i', 's', 'e', ' ', 'C', 'o', 'n', 't', 'r', 'o', 'l', ' '};
    char cruise_speed_txt[15] = {'V', 'e', 'l', ' ', 'D', 'e', 'f', 'i', 'n', 'i', 'd', 'a', ' ', '=', ' '};
    char kmh_txt[5] = {' ', 'K', 'M', '/', 'H'};
    char m_txt[3] = {' ', 'M'};
    char rpm_txt[4] = {' ', 'R', 'P', 'M'};
    char temp_unit[3] = {' ', 'C', '\0'};

    aux = append_txt(aux, speed_txt, oled_speed, 13, kmh_txt, 5);
    aux = append_txt(aux, engine_txt, rpm, 10, rpm_txt, 4);
    aux = append_txt(aux, dist_txt, (int)round(total_distance_m), 12, m_txt, 2);

    if (temp_light == HIGH)
        aux = append_txt(aux, alert_temp_txt, -1, 12, NULL, 0);
    else
        aux = append_txt(aux, alert_temp_txt, -2, 12, NULL, 0);

    aux = append_txt(aux, temp_txt, (int)round(temperature), 7, temp_unit, 2);

    if (cruise == 0)
    {
        aux = append_txt(aux, cruise_txt, -2, 15, NULL, 0);
    }
    else
    {
        aux = append_txt(aux, cruise_txt, -1, 15, NULL, 0);
        aux = append_txt(aux, cruise_speed_txt, (int)round(set_speed), 13, kmh_txt, 5);
    }
    *aux++ = '\0';
    return txt;
}