#ifndef THREAD_TOOLS_H
#define THREAD_TOOLS_H

#include <pthread.h>

void start_thread(void* (*routine) (void*), pthread_t* t);
void join_thread(pthread_t t);
void set_threads(pthread_t* t, int n);
void join_threads(pthread_t* t, int n);

#endif
