/*#########################################
#University of Information Technology     #
#IT007 Operating System                   #
#Gia Kiet, 21522258                       #
#File bai5_4_3.c                          #
###########################################*/

#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#include<semaphore.h>
#include<unistd.h>

int x = 0;

void *processA()
{
    while()
    {
        x = x+1;
        if(x == 20)
            x=0;
        printf("x(proA)=%d\n",x);
    }
}

void *processB()
{
    while(1)
    {
        x=x+1;
        if(x==20)
            x=0;
        printf("x(proB)=%d\n",x);
    }
}

int main()
{
    pthread_t pA, pB;
    pthread_create(&pA, NULL, &processA, NULL);
    pthread_create(&pB, NULL, &processB, NULL);
    while(1);
    return 0;
}
