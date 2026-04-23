#ifndef ESP_FUNCTIONS_H
#define ESP_FUNCTIONS_H

void printb(char c);
float get_temp(int uart0_filestream);
char get_turn(int uart0_filestream);
void hold_turn(int uart0_filestream);
void write_speed(int uart0_filestream, float speed);
void write_rpm(int uart0_filestream, float rpm);
void hold_cruise(int uart0_filestream);
char get_cruise(int uart0_filestream);
void write_right(int uart0_filestream);
void write_left(int uart0_filestream);
void left_on(int uart0_filestream);
char get_light(int uart0_filestream);
void hold_light(int uart0_filestream);
void left_off(int uart0_filestream);
void right_on(int uart0_filestream);
void right_off(int uart0_filestream);
void set_esp32(int uart0_filestream);
void high_on(int uart0_filestream);
void high_off(int uart0_filestream);
void low_on(int uart0_filestream);
void low_off(int uart0_filestream);
#endif
