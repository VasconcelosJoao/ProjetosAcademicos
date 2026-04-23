#include "modbus.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "uart.h"

char matr[4] = {9, 6, 0, 1};

short CRC16(short crc, char data)
{
	const short tbl[256] = {
		(short)0x0000, (short)0xC0C1, (short)0xC181, (short)0x0140, (short)0xC301, (short)0x03C0, (short)0x0280, (short)0xC241,
		(short)0xC601, (short)0x06C0, (short)0x0780, (short)0xC741, (short)0x0500, (short)0xC5C1, (short)0xC481, (short)0x0440,
		(short)0xCC01, (short)0x0CC0, (short)0x0D80, (short)0xCD41, (short)0x0F00, (short)0xCFC1, (short)0xCE81, (short)0x0E40,
		(short)0x0A00, (short)0xCAC1, (short)0xCB81, (short)0x0B40, (short)0xC901, (short)0x09C0, (short)0x0880, (short)0xC841,
		(short)0xD801, (short)0x18C0, (short)0x1980, (short)0xD941, (short)0x1B00, (short)0xDBC1, (short)0xDA81, (short)0x1A40,
		(short)0x1E00, (short)0xDEC1, (short)0xDF81, (short)0x1F40, (short)0xDD01, (short)0x1DC0, (short)0x1C80, (short)0xDC41,
		(short)0x1400, (short)0xD4C1, (short)0xD581, (short)0x1540, (short)0xD701, (short)0x17C0, (short)0x1680, (short)0xD641,
		(short)0xD201, (short)0x12C0, (short)0x1380, (short)0xD341, (short)0x1100, (short)0xD1C1, (short)0xD081, (short)0x1040,
		(short)0xF001, (short)0x30C0, (short)0x3180, (short)0xF141, (short)0x3300, (short)0xF3C1, (short)0xF281, (short)0x3240,
		(short)0x3600, (short)0xF6C1, (short)0xF781, (short)0x3740, (short)0xF501, (short)0x35C0, (short)0x3480, (short)0xF441,
		(short)0x3C00, (short)0xFCC1, (short)0xFD81, (short)0x3D40, (short)0xFF01, (short)0x3FC0, (short)0x3E80, (short)0xFE41,
		(short)0xFA01, (short)0x3AC0, (short)0x3B80, (short)0xFB41, (short)0x3900, (short)0xF9C1, (short)0xF881, (short)0x3840,
		(short)0x2800, (short)0xE8C1, (short)0xE981, (short)0x2940, (short)0xEB01, (short)0x2BC0, (short)0x2A80, (short)0xEA41,
		(short)0xEE01, (short)0x2EC0, (short)0x2F80, (short)0xEF41, (short)0x2D00, (short)0xEDC1, (short)0xEC81, (short)0x2C40,
		(short)0xE401, (short)0x24C0, (short)0x2580, (short)0xE541, (short)0x2700, (short)0xE7C1, (short)0xE681, (short)0x2640,
		(short)0x2200, (short)0xE2C1, (short)0xE381, (short)0x2340, (short)0xE101, (short)0x21C0, (short)0x2080, (short)0xE041,
		(short)0xA001, (short)0x60C0, (short)0x6180, (short)0xA141, (short)0x6300, (short)0xA3C1, (short)0xA281, (short)0x6240,
		(short)0x6600, (short)0xA6C1, (short)0xA781, (short)0x6740, (short)0xA501, (short)0x65C0, (short)0x6480, (short)0xA441,
		(short)0x6C00, (short)0xACC1, (short)0xAD81, (short)0x6D40, (short)0xAF01, (short)0x6FC0, (short)0x6E80, (short)0xAE41,
		(short)0xAA01, (short)0x6AC0, (short)0x6B80, (short)0xAB41, (short)0x6900, (short)0xA9C1, (short)0xA881, (short)0x6840,
		(short)0x7800, (short)0xB8C1, (short)0xB981, (short)0x7940, (short)0xBB01, (short)0x7BC0, (short)0x7A80, (short)0xBA41,
		(short)0xBE01, (short)0x7EC0, (short)0x7F80, (short)0xBF41, (short)0x7D00, (short)0xBDC1, (short)0xBC81, (short)0x7C40,
		(short)0xB401, (short)0x74C0, (short)0x7580, (short)0xB541, (short)0x7700, (short)0xB7C1, (short)0xB681, (short)0x7640,
		(short)0x7200, (short)0xB2C1, (short)0xB381, (short)0x7340, (short)0xB101, (short)0x71C0, (short)0x7080, (short)0xB041,
		(short)0x5000, (short)0x90C1, (short)0x9181, (short)0x5140, (short)0x9301, (short)0x53C0, (short)0x5280, (short)0x9241,
		(short)0x9601, (short)0x56C0, (short)0x5780, (short)0x9741, (short)0x5500, (short)0x95C1, (short)0x9481, (short)0x5440,
		(short)0x9C01, (short)0x5CC0, (short)0x5D80, (short)0x9D41, (short)0x5F00, (short)0x9FC1, (short)0x9E81, (short)0x5E40,
		(short)0x5A00, (short)0x9AC1, (short)0x9B81, (short)0x5B40, (short)0x9901, (short)0x59C0, (short)0x5880, (short)0x9841,
		(short)0x8801, (short)0x48C0, (short)0x4980, (short)0x8941, (short)0x4B00, (short)0x8BC1, (short)0x8A81, (short)0x4A40,
		(short)0x4E00, (short)0x8EC1, (short)0x8F81, (short)0x4F40, (short)0x8D01, (short)0x4DC0, (short)0x4C80, (short)0x8C41,
		(short)0x4400, (short)0x84C1, (short)0x8581, (short)0x4540, (short)0x8701, (short)0x47C0, (short)0x4680, (short)0x8641,
		(short)0x8201, (short)0x42C0, (short)0x4380, (short)0x8341, (short)0x4100, (short)0x81C1, (short)0x8081, (short)0x4040};
	return ((crc & 0xFF00) >> 8) ^ tbl[(crc & 0x00FF) ^ (data & 0x00FF)];
}

short get_crc(unsigned char *commands, int size)
{
	int i;
	short crc = 0;
	for (i = 0; i < size; i++)
	{
		crc = CRC16(crc, commands[i]);
	}
	return crc;
}

int fill_buffer(unsigned char *tx_buffer, mb_package pkg)
{
	unsigned char *ptr_buffer = tx_buffer;
	*ptr_buffer++ = pkg.addr;
	*ptr_buffer++ = pkg.code;
	*ptr_buffer++ = pkg.subcode;
	if (pkg.offset > 0)
		*ptr_buffer++ = pkg.offset;
	if (pkg.data != NULL)
	{
		memcpy(ptr_buffer, pkg.data, pkg.offset);
		ptr_buffer += pkg.offset;
	}
	for (int i = 0; i < 4; i++)
		*ptr_buffer++ = pkg.matr[i];

	short crc = get_crc(tx_buffer, ptr_buffer - tx_buffer);
	memcpy(ptr_buffer, &crc, sizeof(short));
	ptr_buffer += sizeof(short);
	return ptr_buffer - tx_buffer;
}

void mb_pack(int uart0_filestream, mb_package pkg)
{
	unsigned char tx_buffer[50];
	int size = fill_buffer(tx_buffer, pkg);
	uart_write(uart0_filestream, tx_buffer, size);
}

int check_crc(unsigned char *rx_buffer, unsigned char *ptr_buffer)
{
	short check = get_crc(rx_buffer, ptr_buffer - rx_buffer);
	short crc;
	memcpy(&crc, ptr_buffer, sizeof(short));
	if (check == crc)
		return 1;
	else
	{
		printf("CRC Invalido !\n");
		return 0;
	}
}

int read_buffer(unsigned char *rx_buffer, mb_package *pkg, char offset)
{
	unsigned char *ptr_buffer = rx_buffer;
	pkg->addr = *ptr_buffer++;
	pkg->code = *ptr_buffer++;

	if (pkg->code == 0x23)
		pkg->subcode = *ptr_buffer++;
	else
		pkg->subcode = -1;
	if (pkg->code == 0x03)
	{
		pkg->offset = 1;
	}
	else if (pkg->code == 0x06)
		pkg->offset = offset;
	else if (pkg->code == 0x23)
		pkg->offset = 4;
	else
	{
		printf("Codigo MODBUS invalido !\n");
		return 0;
	}
	pkg->data = (char *)malloc(sizeof(char) * pkg->offset);
	memcpy(pkg->data, ptr_buffer, pkg->offset);
	ptr_buffer += pkg->offset;
	if (check_crc(rx_buffer, ptr_buffer))
		return 1;
	else
		return 0;
}

mb_package *mb_unpack(int uart0_filestream, char offset)
{
	unsigned char *rx_buffer = uart_read(uart0_filestream);
	if (rx_buffer == NULL)
		return NULL;
	mb_package *pkg = (mb_package *)malloc(sizeof(mb_package));
	if (read_buffer(rx_buffer, pkg, offset))
		return pkg;
	else
	{
		printf("Erro de Desempacotamento.\n");
		return NULL;
	}
}

mb_package build_package(char code, char subcode, char offset, char *data)
{
	mb_package pkg;
	pkg.addr = 0x01;
	pkg.code = code;
	pkg.subcode = subcode;
	pkg.offset = offset;
	pkg.data = data;
	pkg.matr = matr;
	return pkg;
}

mb_package *send_and_rcv(mb_package snd, int uart0_filestream)
{
	mb_package *rcv = NULL;
	char offset = snd.offset;
	while (rcv == NULL)
	{
		mb_pack(uart0_filestream, snd);
		usleep(50000);
		rcv = mb_unpack(uart0_filestream, offset);
	}
	return rcv;
}
