#include "uart.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>

int uart_start()
{
    int uart0_filestream = -1;

    uart0_filestream = open("/dev/serial0", O_RDWR | O_NOCTTY | O_NDELAY);
    if (uart0_filestream == -1)
    {
        printf("UART falhou!\n");
    }
    else
    {
        printf("UART inicializada com sucesso!\n");
    }
    struct termios options;
    tcgetattr(uart0_filestream, &options);
    options.c_cflag = B115200 | CS8 | CLOCAL | CREAD;
    options.c_iflag = IGNPAR;
    options.c_oflag = 0;
    options.c_lflag = 0;
    tcflush(uart0_filestream, TCIFLUSH);
    tcsetattr(uart0_filestream, TCSANOW, &options);
    return uart0_filestream;
}

void uart_write(int uart0_filestream, unsigned char *tx_buffer, int size)
{
    if (uart0_filestream != -1)
    {
        int count = write(uart0_filestream, tx_buffer, size);
        if (count <= 0)
        {
            printf("Erro na UART TX !\n");
        }
    }
}

unsigned char *uart_read(int uart0_filestream)
{
    if (uart0_filestream != -1)
    {
        unsigned char *rx_buffer = (unsigned char *)malloc(sizeof(char) * 256);
        int rx_length = read(uart0_filestream, (void *)rx_buffer, 255);
        if (rx_length < 0)
        {
            printf("Erro de leitura.\n");
        }
        else if (rx_length == 0)
        {
            printf("Nenhum dado foi encontrado!\n");
        }
        else
        {
            return rx_buffer;
        }
    }

    return NULL;
}

void uart_close(int uart0_filestream)
{
    close(uart0_filestream);
    printf("UART finalizda!\n");
}
