/*#########################################
#University of Information Technology     #
#IT007 Operating System                   #
#Gia Kiet, 21522258                       #
#File bai5_4_4.c                          #
###########################################*/

#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#include<semaphore.h>
#include<unistd.h>

int x = 0;
pthread_mutex_t mutex;

void *processA()
{
    while()
    {
        pthread_mutex_lock(&mutex);
        x = x+1;
        if(x == 20)
            x=0;
        printf("x(proA)=%d\n",x);
        pthread_mutex_unlock(&mutex);
    }
}

void *processB()
{
    while(1)
    {
        pthread_mutex_lock(&mutex);
        x=x+1;
        if(x==20)
            x=0;
        printf("x(proB)=%d\n",x);
        pthread_mutex_lock(&mutex);
    }
}

int main()
{
    pthread_t pA, pB;
    pthread_mutex_init(&mutex, NULL);
    pthread_create(&pA, NULL, &processA, NULL);
    pthread_create(&pB, NULL, &processB, NULL);
    while(1);
    return 0;
}
