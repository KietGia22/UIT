/*#########################################
#University of Information Technology     #
#IT007 Operating System                   #
#Gia Kiet, 21522258                       #
#File RR.cpp                              #
###########################################*/

#include<iostream>
#include<algorithm>
#include<iomanip>
using namespace std;

int main()
{
    int pn[10];
    int arr[10], bur[10], temp[10];
    int quantum_t, n, time, remain, flag=0;
    double totwt, tottat;

    do
    {
        cout << "Enter the number of processes and quantum time:";
        cin >> n >> quantum_t;
        if(n > 10)
            cout << "Vui long nhap lai, n khong duoc lon 10\n";
    }while(n > 10);

    remain=n;
    for(int i=0; i<n; i++)
    {
        cout << "Enter process name, burst time: ";
        cin >> pn[i] >> bur[i];
        arr[i] = 0;
        temp[i] = bur[i];
    }

    int i;
    cout << "\nProcess\t|  start time\t|  stop time\t|\n";
    for(time=0, i=0; remain != 0;)
    {
        if(temp[i] <= quantum_t && temp[i] > 0) //Lan thuc hien cuoi cung
        {
            int final_run = time;
            time += temp[i];
            temp[i] = 0;
            flag = 1;
            cout << setfill(' ') << setw(5) << i+1 << setfill(' ') << setw(12) << final_run << setfill(' ') << setw(12) << time << endl;
        }
        else if(temp[i] > 0) // cac lan thuc hien con lai
        {
            cout << setfill(' ') << setw(5) << i+1 << setfill(' ') << setw(12) << time;
            temp[i] -= quantum_t;
            time += quantum_t;
            cout << setfill(' ') << setw(12) << time << endl;
        }

        if(temp[i] == 0 && flag == 1) // khi process hoan thanh xong
        {
            remain--;
            totwt += time-bur[i];
            tottat += time;
            flag = 0;
        }

        if(i == n-1)
            i=0;
        else if(arr[i+1] <= time)
            i++;
        else
            i=0;
    }
    cout << "\nAverage waiting time: " << totwt*1.0/n;
    cout << "\nAverage turnaround time: " << tottat*1.0/n;
    return 0;
}
