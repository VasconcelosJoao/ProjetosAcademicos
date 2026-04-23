#include "thread_tools.h"
#include <stdlib.h>
#include <pthread.h>
#include <stdio.h>

void start_thread(void *(*routine)(void *), pthread_t *t)
{
	if (pthread_create(t, NULL, routine, NULL) != 0)
		perror("A criacao da thread falhou!\n");
}

void join_thread(pthread_t t)
{
	if (pthread_join(t, NULL) != 0)
		perror("O acesso a thread falhou!\n");
}

void set_threads(pthread_t *t, int n)
{
	for (int i = 0; i < n; i++)
		t[i] = 0;
}
void join_threads(pthread_t *t, int n)
{
	for (int i = 0; i < n; i++)
		if (t[i] != 0)
			join_thread(t[i]);
}
