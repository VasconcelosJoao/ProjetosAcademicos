#ifndef MODBUS_H
#define MODBUS_H

extern char matr[4];

typedef struct mb_package
{
	char addr, code, subcode, offset;
	char *data, *matr;
} mb_package;

short CRC16(short crc, char data);
short get_crc(unsigned char *commands, int size);
int fill_buffer(unsigned char *tx_buffer, mb_package pkg);
void mb_pack(int uart0_filestream, mb_package pkg);
int check_crc(unsigned char *rx_buffer, unsigned char *ptr_buffer);
int read_buffer(unsigned char *rx_buffer, mb_package *pkg, char offset);
mb_package *mb_unpack(int uart0_filestream, char offset);
mb_package build_package(char code, char subcode, char offset, char *data);
mb_package *send_and_rcv(mb_package snd, int uart0_filestream);
#endif
