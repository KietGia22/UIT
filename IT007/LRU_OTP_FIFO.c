#include<stdio.h>
#include<stdlib.h>
#include<string.h>
static int error[100];
static int check_array[5];

int Is_in_total(int frames, int check_num)
{
    for(int i = 0; i<frames; i++)
    {
        if(check_num == check_array[i])
            return 1;
    }
    return 0;
}

void Print_result(int total[], int n, int frames, int array[][100])
{
    for(int i = 0; i < n; i++)
    {
        printf("%d ", total[i]);
    }
    printf("\n");
    for(int i = 0; i < frames; i++)
    {
        for(int j=0; j<n; j++)
        {
            if(array[i][j] != -1)
                printf("%d ", array[i][j]);
            else
            {
                printf("  ");
            }
        }
        printf("\n");
    }

    for(int i = 0; i<n; i++)
    {
        if(error[i] == 1)
            printf("* ");
        else
            printf("  ");
    }

}

int FIFO(int n, int total[], int frames, int array[][100])
{
    int temp=0;
    int count = 0;
    for(int i=0; i<frames; i++)
    {
        if(i == 0)
            array[i][0] = total[0];
        else
            array[i][0] = -1;
    }
    error[0] = 1;

    for(int i=1; i<n; i++)
    {
        for(int k=0; k < frames; k++)
        {
            array[k][i] = array[k][i-1];
            check_array[k] = array[k][i-1];
        }
        if(Is_in_total(frames, total[i]) == 1)
        {
            error[i] = 0;
        }
        else
        {
            error[i] = 1;
            temp++;
            if(temp == frames)
                temp = 0;
            array[temp][i] = total[i];
            count++;
        }
    }
    return count;
}

int findOPT(int total[], int temp, int frames, int n) {
	int farthest = temp;
	int check[5];
	for (int i = 0; i < frames; i++)
    {
		check[i] = 0;
	}

	int position = -1;
	for (int i = 0; i < frames; i++)
    {
		for (int j = temp + 1; j < n; j++)
        {
			if (check_array[i] == total[j])
			{
			    if (farthest < j)
                {
                    farthest = j;
                    position = i;
                }
                check[i] = 1;
				break;
			}
		}
	}

	for (int i = 0; i < frames; i++) {
		if (check[i] == 0)
            return i;
	}
	return position;
}

int OPT(int n, int total[], int frames, int array[][100])
{
    int temp=0;
    int count = 0;
    for(int i=0; i<frames; i++)
    {
        if(i == 0)
            array[i][0] = total[0];
        else
            array[i][0] = -1;
    }

    error[0] = 1;

    for(int i=1; i<n; i++)
    {
        for(int k=0; k<frames; k++)
        {
            array[k][i] = array[k][i-1];
            check_array[k] = array[k][i-1];
        }
        if(Is_in_total(frames, total[i]) == 1)
        {
            error[i] = 0;
        }
        else
        {
            if(i < frames)
            {
                temp++;
                array[temp][i] = total[i];
            }
            else
            {
                int position = findOPT(total, i, frames, n);
                array[position][i] = total[i];
            }
            error[i] = 1;
            count++;
        }
    }
    return count;
}

int findLRU(int total[], int temp, int frames)
{
    int farthest = temp;
    int position;
    for(int i=0; i<frames; i++)
    {
        for(int j=temp-1; j>=0; j--)
        {
            if(check_array[i] == total[j])
            {
                if(farthest > j)
                {
                    farthest = j;
                    position = i;
                }
                break;
            }
        }
    }
    return position;
}

int LRU(int n, int total[], int frames, int array[][100])
{
    int temp=0;
    int count = 0;
    for(int i=0; i<frames; i++)
    {
        if(i == 0)
            array[i][0] = total[0];
        else
            array[i][0] = -1;
    }

    error[0] = 1;

    for(int i=1; i<n; i++)
    {
        for(int k=0; k<frames; k++)
        {
            array[k][i] = array[k][i-1];
            check_array[k] = array[k][i-1];
        }
        if(Is_in_total(frames, total[i]) == 1)
        {
            error[i] = 0;
        }
        else
        {
            if(i < frames)
            {
                temp++;
                array[temp][i] = total[i];
            }
            else
            {
                int position = findLRU(total, i, frames);
                array[position][i] = total[i];
            }
            error[i] = 1;
            count++;
        }
    }
    return count;
}

int Auto_Input(int total[])
{
    int b[11] = {2, 1, 5, 2, 2, 2, 5, 8, 0, 0, 7};
    int n = 11;
    for(int i=0; i<n; i++)
    {
        total[i] = b[i];
    }
    return n;
}

int Hand_Input(int total[])
{
    int n;
    printf("Enter the pages' number: ");
    scanf("%d", &n);
    printf("Enter elements: ");
    for(int i=0; i<n; i++)
    {
        scanf("%d", &total[i]);
    }
    return n;
}

int main()
{
    int n;
    int total[20];
    int array[10][100];
    printf("--- Page Replacement algorithm ---\n");
    printf("1. Default referenced sequence\n");
    printf("2. Manual input sequence\n");
    int input;
    printf("Enter your choice: ");
    scanf("%d", &input);
    if(input == 1)
    {
        n = Auto_Input(total);
    }
    else
    {
        n = Hand_Input(total);
    }
    printf("\n--- Page Replacement algorithm ---\n");
    printf("Input page frames: ");
    int frames;
    scanf("%d", &frames);
    printf("\n--- Page Replacement algorithm ---\n");
    printf("1. FIFO algorithm\n");
    printf("2. OPT algorithm\n");
    printf("3. LRU algorithm\n");
    printf("\n--- Page Replacement algorithm ---\n");
    int option;
    printf("Enter your option: ");
    scanf("%d", &option);
    printf("\n");
    int page_fault = 0;
    switch(option)
    {
    case 1:
        page_fault = FIFO(n, total, frames, array);
        Print_result(total, n, frames, array);
        break;
    case 2:
        page_fault = OPT(n, total, frames, array);
        Print_result(total, n, frames, array);
        break;
    case 3:
        page_fault = LRU(n, total, frames, array);
        Print_result(total, n, frames, array);
        break;
    }
    printf("\nNumber of Page Fault: %d", page_fault+1);
}
