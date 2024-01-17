/*#########################################
#University of Information Technology     #
#IT007 Operating System                   #
#Gia Kiet, 21522258                       #
#File fcfs.cpp                            #
###########################################*/

#include<stdio.h>

void swap(int *a, int *b)
{
    int temp;
    temp = *a;
    *a = *b;
    *b = temp;
}

void main()
{
    int pn[10];
    int arr[10], bur[10], star[10], finish[10], tat[10], wt[10], i, n;
    int towt = 0, tottat = 0;
    
    do 
    {
        printf("Enter the number of processes:");
        scanf("%d", &n);
        if(n > 10)
            printf("Please re-enter);
    }while(n > 10);
    
    for(i=0; i<n; i++)
    {
        printf("Enter the Process Name, Arrival Time & Burst Time:");
        scanf("%d%d%d",&pn[i],&arr[i],&bur[i]);
    }

    for(i=0; i<n-1; i++)
    {
        for(int j=i+1; j<n; j++)
        {
            if(arr[i]>arr[j])
            {
                swap(&pn[i], &pn[j]);
                swap(&arr[i], &arr[j]);
                swap(&bur[i], &bur[j]);
            }
        }
    }

    for(i=0; i<n; i++)
    {
        if(i==0)
        {
            star[i]=arr[i];
            wt[i]=star[i]-arr[i];
            finish[i]=star[i]+bur[i];
            tat[i]=finish[i]-arr[i];
        }
        else
        {
            star[i]=finish[i-1];
            wt[i] = star[i]-arr[i];
            finish[i]=star[i]+bur[i];
            tat[i]=finish[i]-arr[i];
        }
    }

    printf("\nPName\t  Arrtime\t  Burtime   Start  TAT  Finish");
    for(i=0; i<n; i++)
    {
        printf("\n%d\t%6d\t\t%6d\t%6d\t%6d\t%6d",pn[i],arr[i],bur[i],star[i],tat[i],finish[i]);
        towt += wt[i];
        tottat += tat[i];
    }

    float avgwt = 1.0*towt/n;
    float avtat = 1.0*tottat/n;
    printf("\nAverage waiting time: %f", avgwt);
    printf("\nAverage turnaround: %f", avtat);
}
