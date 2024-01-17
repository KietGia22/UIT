/*#########################################
#University of Information Technology     #
#IT007 Operating System                   #
#Gia Kiet, 21522258                       #
#File SRT.cpp                             #
###########################################*/

#include <iostream>
#include <algorithm>
#include <iomanip>
#include <string.h>
using namespace std;

typedef struct process {
    int pid;
    int arr;
    int bur;
    int res;
    int complete;
    int tat;
    int wt;
    int start;
} pr;

int main() {

    int n;
    pr p[10];
    double avgtat;
    double avgwt;
    int total_tat = 0;
    int total_wt = 0;
    int temp[10];
    int is_completed[10];
    memset(is_completed,0,sizeof(is_completed));

    cout << setprecision(2) << fixed;

    do
    {
        cout<<"Enter the number of processes: ";
        cin>>n;
        if(n > 10)
            cout << "Please re-enter\n";
    }while(n>10);

    for(int i = 0; i < n; i++) {
        cout << "Name of process: ";
        cin >> p[i].pid;
        cout<<"Enter arrival time and burst time of process "<<i+1<<": ";
        cin>>p[i].arr >>p[i].bur;
        temp[i] = p[i].bur;
        cout<<endl;
    }

    int current_time = 0;
    int completed = 0;
    int prev = 0;

    while(completed != n) {
        int index = -1;
        int mn = 10000000;
        for(int i = 0; i < n; i++) {
            if(p[i].arr <= current_time && is_completed[i] == 0) {
                if(temp[i] < mn) {
                    mn = temp[i];
                    index = i;
                }
                if(temp[i] == mn) {
                    if(p[i].arr < p[index].arr) {
                        mn = temp[i];
                        index = i;
                    }
                }
            }
        }

        if(index != -1) {
            if(temp[index] == p[index].bur) {
                p[index].start = current_time;
            }
            temp[index] -= 1;
            current_time++;
            prev = current_time;

            if(temp[index] == 0) {
                p[index].complete = current_time;
                p[index].tat = p[index].complete - p[index].arr;
                p[index].wt = p[index].tat - p[index].bur;
                p[index].res = p[index].start - p[index].arr;
                total_tat += p[index].tat;
                total_wt += p[index].wt;

                is_completed[index] = 1;
                completed++;
            }
        }
        else {
             current_time++;
        }
    }

    avgtat = 1.0 * total_tat / n;
    avgwt = 1.0 * total_wt / n;

    cout<<"Process\t"<<"response time\t"<<"waiting time\t"<<"turnaround time\t"<<"\n"<<endl;

    for(int i = 0; i < n; i++) {
        cout<< setfill(' ') << setw(5) << p[i].pid << setfill(' ') << setw(10) << p[i].res << setfill(' ') << setw(14) << p[i].wt<< setfill(' ') << setw(20) << p[i].tat<<"\t"<<"\n"<<endl;
    }
     cout<<"\nAverage Waiting Time: "<< avgwt<<endl;
    cout<<"\nAverage Turnaround Time: "<< avgtat<<endl;
}
