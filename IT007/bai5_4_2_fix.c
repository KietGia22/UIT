/*#########################################
#University of Information Technology     #
#IT007 Operating System                   #
#Gia Kiet, 21522258                       #
#File bai5_4_2_fix.c                      #
###########################################*/

#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#include<semaphore.h>
#include<unistd.h>
#include<time.h>

int a[10000], length = 0;
int n;
pthread_mutex_t mutex;
sem_t sem;

void *processA()
{
    while(1)
    {
        sem_wait(&sem);
        pthread_mutex_lock(&mutex);
        int r;
        srand(time(NULL));
        r = rand();
        a[length] = r;
        length++;
        printf("Length of array a after push: %d\n", length);
        pthread_mutex_unlock(&mutex);
    }
}

void *processB()
{
    while(1)
    {
        pthread_mutex_lock(&mutex);
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
            sem_post(&sem);
        }
        pthread_mutex_unlock(&mutex);
    }
}

int main()
{
    print("value of n: ");
    scanf("%d", &n);
    pthread_mutex_init(&mutex, NULL);
    pthread_t pA, pB;
    pthread_create(&pA, NULL, &processA, NULL);
    pthread_create(&pB, NULL, &processB, NULL);
    while(1);
    return 0;
}
