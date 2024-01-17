/*#########################################
#University of Information Technology     #
#IT007 Operating System                   #
#Gia Kiet, 21522258                       #
#File bai5_4_2.c                          #
###########################################*/
#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#include<semaphore.h>
#include<unistd.h>
#include<time.h>

int a[10000], length = 0;

void *processA()
{
    while(1)
    {
        int r;
        srand(time(NULL));
        r = rand();
        a[length] = r;
        length++;
        printf("Length of array a after push: %d\n", length);
    }
}

void *processB()
{
    while(1)
    {
        if(length == 0)
            printf("Nothing in array a\n");
        else
        {
            srand(time(NULL));
            int r = rand() % (length);
            length--;
            for(int i = r; i <= length; i++)
            {
                a[i] += a[i+1];
            }
            printf("Length of array a after delete: %d\n", length);
        }
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
