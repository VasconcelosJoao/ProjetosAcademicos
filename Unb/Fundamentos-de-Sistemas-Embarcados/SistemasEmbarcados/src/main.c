#include <stdio.h>
#include <signal.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>
#include <bcm2835.h>
#include <sys/time.h>
#include <math.h>

#include "uart.h"
#include "modbus.h"
#include "esp32.h"
#include "gpio.h"
#include "pwm.h"
#include "thread_tools.h"
#include "ssd1306_i2c.h"
#include "text_builder.h"
#include "display.h"

#define N 17

pthread_t t[N];

int uart0;
int left = 0;
int right = 0;

pthread_mutex_t uart_mutex,
    wheel_mutex,
    engine_mutex,
    temp_mutex,
    speed_mutex;

int wheel_count,
    engine_count,
    wheel_spin_timeout = 0,
    engine_spin_timeout = 0,
    cruise_on = 0,
    high_light = 0,
    low_light = 0,
    end = 0;

float speed = 0.0f,
      set_speed, 
      temperature = 0.0f,
      total_distance_m = 0.0f,
      rpm = 0.0f;

void *thread_cruise_control()
{
    printf("Thread: Controle de Cruzeiro Inicializada\n");
    while (!end)
    {
        pthread_mutex_lock(&speed_mutex);
        set_speed = speed;
        pthread_mutex_unlock(&speed_mutex);
        while (cruise_on)
        {
            bcm2835_gpio_write(DIR1, HIGH);
            bcm2835_gpio_write(DIR2, LOW);
            pthread_mutex_lock(&speed_mutex);
            float current_speed = speed;
            pthread_mutex_unlock(&speed_mutex);
            pid_cruise(set_speed, current_speed);
            printf("Velocidade Definida = %f, Velocidade Atual = %f\n", set_speed, current_speed);

            if (get_acc())
            {
                disable_cruise_control();
            }

            sleep(1);
        }
        usleep(1000);
    }
    printf("Thread: Controle de Cruzeiro Finalizada\n");
    return NULL;
}

void *thread_cruise_buttons()
{
    printf("Thread: Botões Controle de Cruzeiro Inicializada\n");
    pthread_mutex_lock(&uart_mutex);
    hold_cruise(uart0);
    pthread_mutex_unlock(&uart_mutex);
    while (!end)
    {
        usleep(1000);
        pthread_mutex_lock(&uart_mutex);
        char button = get_cruise(uart0);
        pthread_mutex_unlock(&uart_mutex);
        if (button == 0x1F)
            continue;
        switch (button)
        {
        case 0x01:
            printf("Controle de Cruzeiro Ativado\n");
            cruise_on = 1;
            break;
        case 0x02:
            printf("Controle de Cruzeiro Desativado\n");
            cruise_on = 0;
            break;
        case 0x04:
            printf("set +\n");
            set_speed += 1;
            break;
        case 0x08:
            printf("set -\n");
            set_speed -= 1;
            break;
        }
        pthread_mutex_lock(&uart_mutex);
        hold_cruise(uart0);
        pthread_mutex_unlock(&uart_mutex);
    }
    printf("Thread: Botões Controle de Cruzeiro Finalizada\n");
    return NULL;
}

void *thread_wheel_spin()
{
    printf("Thread: Rotação da Roda Inicializada\n");
    while (!end)
    {
        uint8_t prev = LOW;
        while (!wheel_spin_timeout)
        {
            uint8_t now = bcm2835_gpio_lev(WHEELA);
            if (now == HIGH && prev == LOW)
            {
                pthread_mutex_lock(&wheel_mutex);
                wheel_count++;
                pthread_mutex_unlock(&wheel_mutex);
            }
            prev = now;
            usleep(10);
        }
        usleep(10);
    }
    printf("Thread: Rotação da Roda Finalizada\n");
    return NULL;
}

void *thread_wheel_spin_dir()
{
    printf("Thread: Direção da Rotação da Roda Inicializada\n");
    uint8_t prev_a = LOW,
            prev_b = LOW;
    struct timeval time_a,
        time_b;
    int redge_a = 0,
        redge_b = 0,
        dir = 0;
    while (!end)
    {
        int now_dir;
        uint8_t now_a = bcm2835_gpio_lev(WHEELA),
                now_b = bcm2835_gpio_lev(WHEELB);
        if (now_a == HIGH && prev_a == LOW)
        {
            gettimeofday(&time_a, NULL);
            redge_a = 1;
        }
        if (now_b == HIGH && prev_b == LOW)
        {
            gettimeofday(&time_b, NULL);
            redge_b = 1;
        }
        if (redge_a == 1 && redge_b == 1)
        {
            long long int va = time_a.tv_sec * 1000000 + time_a.tv_usec,
                          vb = time_b.tv_sec * 1000000 + time_b.tv_usec;
            if ((va - vb) < 0)
                now_dir = 1;
            else
                now_dir = 0;
            if (now_dir != dir)
            {
                printf((now_dir == 1) ? "Frente\n" : "Ré\n");
                dir = now_dir;
            }
            redge_a = redge_b = 0;
        }
        prev_a = now_a;
        prev_b = now_b;
        usleep(10);
    }
    printf("Thread: Direção da Rotação da Roda Finalizada\n");
    return NULL;
}

void *thread_engine_spin()
{
    printf("Thread: Rotação do Motor Inicializada\n");
    while (!end)
    {
        uint8_t prev = LOW;
        while (!engine_spin_timeout)
        {
            uint8_t now = bcm2835_gpio_lev(ENGINE);
            if (now == HIGH && prev == LOW)
            {
                pthread_mutex_lock(&engine_mutex);
                engine_count++;
                pthread_mutex_unlock(&engine_mutex);
            }
            prev = now;
            usleep(10);
        }
    }
    printf("Thread: Rotação do Motor Finalizada\n");
    return NULL;
}

float avg(float *latest, int n)
{
    float ret = 0.0f;
    for (int i = 0; i < n; i++)
    {
        ret += latest[i];
    }
    return ret / ((float)n);
}

void *thread_speed()
{
    printf("Thread: Velocidade Inicializada\n");
    int i = 0;
    float latest_speed[10] = {0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f};
    while (!end)
    {
        pthread_mutex_lock(&wheel_mutex);
        wheel_count = 0;
        pthread_mutex_unlock(&wheel_mutex);
        wheel_spin_timeout = 0;
        usleep(1000000);
        wheel_spin_timeout = 1;
        pthread_mutex_lock(&wheel_mutex);
        int count = wheel_count;
        pthread_mutex_unlock(&wheel_mutex);
        latest_speed[i] = get_speed(count) * 2.0f;
        i = (i + 1) % 10;
        pthread_mutex_lock(&speed_mutex);
        speed = avg(latest_speed, 10);
        pthread_mutex_unlock(&speed_mutex);
        pthread_mutex_lock(&uart_mutex);
        write_speed(uart0, speed);
        pthread_mutex_unlock(&uart_mutex);
        total_distance_m += ((float)count * 2) * 1.9792f;
    }
    printf("Thread: Velocidade Finalizada\n");
    return NULL;
}

void *thread_rpm()
{
    printf("Thread: RPM Inicializada\n");
    float latest_rpm[10] = {800.0f, 800.0f, 800.0f, 800.0f, 800.0f, 800.0f, 800.0f, 800.0f, 800.0f, 800.0f};
    int i = 0;
    while (!end)
    {
        pthread_mutex_lock(&engine_mutex);
        engine_count = 0;
        pthread_mutex_unlock(&engine_mutex);
        engine_spin_timeout = 0;
        usleep(1000000);
        engine_spin_timeout = 1;
        pthread_mutex_lock(&engine_mutex);
        int count = engine_count;
        pthread_mutex_unlock(&engine_mutex);
        latest_rpm[i] = ((float)count) * 60;
        i = (i + 1) % 10;
        rpm = avg(latest_rpm, 10);
        pthread_mutex_lock(&uart_mutex);
        write_rpm(uart0, rpm);
        pthread_mutex_unlock(&uart_mutex);
    }
    printf("Thread: RPM Finalizada\n");
    return NULL;
}

void *thread_break()
{
    printf("Thread: Freio Inicializada\n");
    int prev_brake = 0;

    while (!end)
    {
        int brake = get_break();
        if (brake)
        {
            cruise_on = 0;
            if (prev_brake == 0)
            {
                printf("Freio Acionado\n");
                prev_brake = 1;
            }
        }
        else
        {
            if (prev_brake == 1)
            {
                printf("Freio Desacionado\n");
                prev_brake = 0;
            }
        }
        brk_on();
        usleep(1000);
    }
    printf("Thread: Freio Finalizada\n");
    return NULL;
}

void *thread_engine()
{
    printf("Thread: Motor Inicializada\n");
    int acc = 0, dir = 1;
    int prev_acc = 0;
    while (!end)
    {
        int new_acc = get_acc();
        if (new_acc != prev_acc)
        {
            if (new_acc)
            {
                printf("Acelerador Acionado\n");
            }
            else
            {
                printf("Acelerador Desacionado\n");
            }
            prev_acc = new_acc;
        }
        acc = new_acc;
        if (!cruise_on)
        {
            engine(acc, dir);
        }
        usleep(1000);
    }
    printf("Thread: Motor Finalizada\n");
    return NULL;
}

void *thread_turn_pannel()
{
    printf("Thread: Painel de Seta Inicializada\n");
    while (!end)
    {
        if (left == 1)
        {
            pthread_mutex_lock(&uart_mutex);
            write_left(uart0);
            pthread_mutex_unlock(&uart_mutex);
        }
        if (right == 1)
        {
            pthread_mutex_lock(&uart_mutex);
            write_right(uart0);
            pthread_mutex_unlock(&uart_mutex);
        }
        usleep(1000);
    }
    printf("Thread: Painel de Seta Finalizada\n");
    return NULL;
}

void *thread_turn_output()
{
    printf("Thread: Saída de Seta Inicializada\n");
    while (!end)
    {
        if (left == 1)
        {
            left_blink();
        }
        if (right == 1)
        {
            right_blink();
        }
        usleep(1000);
    }
    printf("Thread: Saída de Seta Finalizada\n");
    return NULL;
}

void *thread_turn_input()
{
    printf("Thread: Entrada de Seta Inicializada\n");
    pthread_mutex_lock(&uart_mutex);
    hold_turn(uart0);
    pthread_mutex_unlock(&uart_mutex);

    int prev_left = 0;
    int prev_right = 0;

    while (!end)
    {
        pthread_mutex_lock(&uart_mutex);
        char turn = get_turn(uart0);
        if (turn != 3)
            hold_turn(uart0);
        pthread_mutex_unlock(&uart_mutex);

        if ((turn == 1 && left == 0) || (turn == 3 && left == 1))
        {
            left = 1;
            right = 0;
        }
        else if ((turn == 2 && right == 0) || (turn == 3 && right == 1))
        {
            right = 1;
            left = 0;
        }
        else if (turn == 1 && left == 1)
        {
            left = 0;
        }
        else if (turn == 2 && right == 1)
        {
            right = 0;
        }

        if (left != prev_left || right != prev_right)
        {
            if (left == 1)
            {
                printf("Seta à Esquerda Ativada\n");
            }
            else if (right == 1)
            {
                printf("Seta à Direita Ativada\n");
            }
            else
            {
                printf("Setas Desativadas\n");
            }
            prev_left = left;
            prev_right = right;
        }

        usleep(1000);
    }
    printf("Thread: Entrada de Seta Finalizada\n");
    return NULL;
}

void *thread_light_pannel()
{
    printf("Thread: Painel Farol Inicializada\n");
    while (!end)
    {
        if (high_light == 1)
        {
            pthread_mutex_lock(&uart_mutex);
            high_on(uart0);
            pthread_mutex_unlock(&uart_mutex);
        }
        else
        {
            pthread_mutex_lock(&uart_mutex);
            high_off(uart0);
            pthread_mutex_unlock(&uart_mutex);
        }

        if (low_light == 1)
        {
            pthread_mutex_lock(&uart_mutex);
            low_on(uart0);
            pthread_mutex_unlock(&uart_mutex);
        }
        else
        {
            pthread_mutex_lock(&uart_mutex);
            low_off(uart0);
            pthread_mutex_unlock(&uart_mutex);
        }
        usleep(1000);
    }
    printf("Thread: Painel Farol Finalizada\n");
    return NULL;
}

void *thread_light_output()
{
    printf("Thread: Saída do Farol Inicializada\n");
    while (!end)
    {
        if (low_light == 1)
            low_light_on();
        else
            low_light_off();

        if (high_light == 1)
            high_light_on();
        else
            high_light_off();
        usleep(1000);
    }
    printf("Thread: Saída do Farol Finalizada\n");
    return NULL;
}

void *thread_light_input()
{
    printf("Thread: Entrada do Farol Inicializada\n");
    pthread_mutex_lock(&uart_mutex);
    hold_light(uart0);
    pthread_mutex_unlock(&uart_mutex);

    int prev_low_light = 0;
    int prev_high_light = 0;

    while (!end)
    {
        usleep(1000);
        pthread_mutex_lock(&uart_mutex);
        char light = get_light(uart0);
        pthread_mutex_unlock(&uart_mutex);
        if (light == 3)
            continue;

        if (light == 1 && low_light == 0)
        {
            low_light = 1;
            printf("Farol Baixo Ativado\n");
        }
        else if (light == 2 && high_light == 0)
        {
            high_light = 1;
            printf("Farol Alto Ativado\n");
        }
        else if (light == 1 && low_light == 1)
        {
            low_light = 0;
            printf("Farol Baixo Desativado\n");
        }
        else if (light == 2 && high_light == 1)
        {
            high_light = 0;
            printf("Farol Alto Desativado\n");
        }

        if (low_light != prev_low_light || high_light != prev_high_light)
        {
            prev_low_light = low_light;
            prev_high_light = high_light;
        }

        pthread_mutex_lock(&uart_mutex);
        hold_light(uart0);
        pthread_mutex_unlock(&uart_mutex);
    }
    printf("Thread: Entrada do Farol Finalizada\n");
    return NULL;
}

void *thread_temp()
{
    printf("Thread: Temperatura Inicializada\n");
    while (!end)
    {
        pthread_mutex_lock(&uart_mutex);
        float new_temp = get_temp(uart0); 
        pthread_mutex_unlock(&uart_mutex);

        if (!isnan(new_temp)) 
        {
            pthread_mutex_lock(&temp_mutex);
            temperature = new_temp; 
            pthread_mutex_unlock(&temp_mutex);

            temp_light(new_temp); 
        }
        else
        {
            printf("Erro: Não foi possível ler a temperatura do sensor.\n");
        }

        usleep(1000); 
    }
    printf("Thread: Temperatura Finalizada\n");
    return NULL;
}

void *thread_oled()
{
    printf("Thread: OLED Inicializada\n");
    while (!end)
    {
        pthread_mutex_lock(&speed_mutex);
        float current_speed = speed;
        float current_rpm = rpm;
        pthread_mutex_unlock(&speed_mutex);
        pthread_mutex_lock(&temp_mutex);
        int temp_light_status = bcm2835_gpio_lev(TEMP_LIGHT); 
        pthread_mutex_unlock(&temp_mutex);

        display(current_speed, current_rpm, temp_light_status, cruise_on);
    }
    printf("Thread: OLED Finalizada\n");
    return NULL;
}


void end_program(int sig)
{
    end = 1;
    wheel_spin_timeout = 1;
    engine_spin_timeout = 1;
    cruise_on = 0;
    sleep(1);
    join_threads(t, N);
    printf("Todas as threads finalizadas\n");
    pthread_mutex_lock(&uart_mutex);
    write_speed(uart0, 0);
    write_rpm(uart0, 0);
    pthread_mutex_unlock(&uart_mutex);
    pthread_mutex_destroy(&temp_mutex);
    pthread_mutex_destroy(&uart_mutex);
    pthread_mutex_destroy(&wheel_mutex);
    pthread_mutex_destroy(&engine_mutex);
    pthread_mutex_destroy(&speed_mutex);
    uart_close(uart0);
    all_off();
    ssd1306_clearDisplay();
    ssd1306_display();
    delay(5000);
    bcm2835_close();
    printf("Programa finalizado\n");
    exit(0);
}

int main()
{
    set_threads(t, N);
    ssd1306_begin(SSD1306_SWITCHCAPVCC, SSD1306_I2C_ADDRESS);
    ssd1306_clearDisplay();
    delay(1000);
    signal(SIGINT, end_program);
    uart0 = uart_start();
    set_esp32(uart0);
    set_pins();
    set_pwm();
    pthread_mutex_init(&uart_mutex, NULL);
    pthread_mutex_init(&wheel_mutex, NULL);
    pthread_mutex_init(&engine_mutex, NULL);
    pthread_mutex_init(&speed_mutex, NULL);
    pthread_mutex_init(&temp_mutex, NULL);
    write_speed(uart0, 0);
    write_rpm(uart0, 0);
    start_thread(&thread_temp, &t[0]);
    start_thread(&thread_turn_input, &t[1]);
    start_thread(&thread_turn_output, &t[2]);
    start_thread(&thread_engine, &t[3]);
    start_thread(&thread_break, &t[4]);
    start_thread(&thread_cruise_buttons, &t[5]);
    start_thread(&thread_cruise_control, &t[6]);
    start_thread(&thread_speed, &t[7]);
    start_thread(&thread_wheel_spin, &t[8]);
    start_thread(&thread_wheel_spin_dir, &t[9]);
    start_thread(&thread_rpm, &t[10]);
    start_thread(&thread_engine_spin, &t[11]);
    start_thread(&thread_turn_pannel, &t[12]);
    start_thread(&thread_light_input, &t[13]);
    start_thread(&thread_light_output, &t[14]);
    start_thread(&thread_light_pannel, &t[15]);
    start_thread(&thread_oled, &t[16]);
    join_threads(t, N);

    return 0;
}