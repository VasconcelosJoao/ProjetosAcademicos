#include "display.h"
#include "text_builder.h"
#include "ssd1306_i2c.h"
#include <math.h>
#include <unistd.h>
#include <bcm2835.h>
#include <stdlib.h>

void display(float speed, float rpm, int temp_light, int cruise_on)
{
    int oled_speed = (int)round(speed);
    char *txt = build_oled_text(oled_speed, (int)round(rpm), bcm2835_gpio_lev(temp_light), cruise_on);
    ssd1306_drawString(txt);
    ssd1306_display();
    delay(500);
    sleep(1);
    free(txt);
    ssd1306_clearDisplay();
}