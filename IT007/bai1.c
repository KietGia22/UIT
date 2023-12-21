#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#include<semaphore.h>
#include<unistd.h>

sem_t pa_e, pa_f, pb_c, pb_d, pc_e, pd_f, pe_g, pf_g;
int x1 = 1;
int x2 = 2;
int x3 = 3;
int x4 = 4;
int x5 = 5;
int x6 = 6;
int w, v, z, y, z;
int result = 0;
void *process1()
{
    w = x1 * x2;
    printf("w = %d\n", w);
    sem_post(&pa_e);
    sem_post(&pa_f);
    sleep(1);
}

void *process2()
{
    v = x3 * x4;
    printf("v = %d\n", v);
    sem_post(&pb_c);
    sem_post(&pb_d);
    sleep(1);
}

void *process3()
{
    sem_wait(&pb_c);
    printf("y = %d\n", y);
    y = v * x5;
    sem_post(&pc_e);
    sleep(1);
}

void *process4()
{
    sem_wait(&pb_d);
    printf("z = %d\n", z);
    z = v * x6;
    sem_post(&pd_f);
    sleep(1);
}

void *process5()
{
    sem_wait(&pa_e);
    sem_wait(&pc_e);
    y = w * y;
    printf("y = %d\n", y);
    sem_post(&pe_g);
    sleep(1);
}

void *process6()
{
    sem_wait(&pa_f);
    sem_wait(&pd_f);
    z = w * z;
    printf("z = %d\n", z);
    sem_post(&pf_g);
    sleep(1);
}

void *process7()
{
    sem_wait(&pe_g);
    sem_wait(&pf_g);
    result = y + z;
    printf("result = %d\n", result);
    sleep(1);
}

int main()
{
    sem_init(&pa_e, 0, 1);
    sem_init(&pa_f, 0, 0);
    sem_init(&pb_c, 0, 0);
    sem_init(&pb_d, 0, 0);
    sem_init(&pc_e, 0, 0);
    sem_init(&pd_f, 0, 0);
    sem_init(&pe_g, 0, 0);
    sem_init(&pf_g, 0, 0);
    pthread_t pth1, pth2, pth3, pth4, pth5, pth6, pth7;
    pthread_create(&pth1, NULL, &process1, NULL);
    pthread_create(&pth2, NULL, &process2, NULL);
    pthread_create(&pth3, NULL, &process3, NULL);
    pthread_create(&pth4, NULL, &process4, NULL);
    pthread_create(&pth5, NULL, &process5, NULL);
    pthread_create(&pth6, NULL, &process6, NULL);
    pthread_create(&pth7, NULL, &process7, NULL);
}

