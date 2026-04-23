#ifndef UART_H
#define UART_H

int uart_start();
void uart_write(int uart0_filestream, unsigned char* tx_buffer, int size);
unsigned char* uart_read(int uart0_filestream);
void uart_close(int uart0_filestream);

#endif
