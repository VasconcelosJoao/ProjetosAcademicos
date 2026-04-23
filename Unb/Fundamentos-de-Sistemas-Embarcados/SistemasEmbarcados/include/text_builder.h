#ifndef TEXT_BUILDER_H
#define TEXT_BUILDER_H

#include <stdint.h>

char* append_txt(char* main_txt, char* append, int value, int append_size, char* post, int post_size);
char* build_oled_text(int oled_speed, int rpm, uint8_t temp_light, int cruise);

#endif