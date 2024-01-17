/*#########################################
#University of Information Technology     #
#IT007 Operating System                   #
#Gia Kiet, 21522258                       #
#File SJF.cpp                              #
###########################################*/


#include <iostream>
#include <vector>
#include <algorithm>
#include<iomanip>
using namespace std;

typedef struct process
{
    int ps;
    int arr;
    int bur;
    int start;
    int finish;
    int tat;
    int wt;
    bool ok = false;
}pr;

int next_pr(pr p[], int a, int b, int pre_pr)
{
    vector<int>prob;
    for(int i=a; i<=b; i++)
    {
        if(p[i].arr <= p[pre_pr].finish)
            if(p[i].ok == false)
                prob.push_back(i);
    }
    if(prob.size() == 0)
    {
        for(int i=a; i<=b; i++)
        {
            if(p[i].ok == false)
                return i;
        }
    }
    int mn = p[prob[0]].bur;
    int pos = prob[0];
    for(int i=1; i<prob.size(); i++)
    {
        if(mn > p[prob[i]].bur)
        {
            mn = p[prob[i]].bur;
            pos = prob[i];
        }
    }
    return pos;
}

int main()
{
    int n;
    do
    {
        cout<<"Enter the number of processes: ";
        cin>>n;
        if(n > 10)
            cout << "Please re-enter\n";
    }while(n>10);

    pr p[10];
    for(int i=0; i<n; i++)
    {
        cout << "Name of process: ";
        cin >> p[i].ps;
        cout<<"Enter arrival time and burst time of process "<<i+1<<": ";
        cin >> p[i].arr >> p[i].bur;
    }

    for(int i=0; i<n; i++)
    {
        for(int j=i+1; j<n; j++)
        {
            if(p[i].arr > p[j].arr)
                swap(p[i], p[j]);
            else if(p[i].arr == p[j].arr && p[i].bur > p[j].bur)
                swap(p[i], p[j]);
        }
    }

    int count = 0;
    int pre_pr = 0;
    int temp;
    while(count < n)
    {
        if(count == 0)
        {
            p[0].start = p[0].arr;
            p[0].wt = 0;
            p[0].finish = p[0].start + p[0].bur;
            p[0].tat = p[0].finish - p[0].arr;
            p[0].ok = true;
        }
        else
        {
            temp = next_pr(p, 0, n-1, pre_pr);
            p[temp].start = max(p[temp].arr, p[pre_pr].finish);
            p[temp].finish = p[temp].start + p[temp].bur;
            p[temp].wt = p[temp].start - p[temp].arr;
            p[temp].tat = p[temp].finish - p[temp].arr;
            p[temp].ok = true;
            pre_pr = temp;
        }
        count++;
    }

    double avgwt = 0;
    double avgtat = 0;
    cout << "PS\tResponse Time\tWaiting Time\t TurnAround Time\n";
    for(int i=0; i<n; i++)
    {
        cout << p[i].ps << setfill(' ') << setw(15) << p[i].wt << setfill(' ') << setw(15) << p[i].wt << setfill(' ') << setw(15) << p[i].tat << "\n";
        avgwt += p[i].wt;
        avgtat += p[i].tat;
    }
    cout<<"\nAverage Waiting Time: "<< 1.0*avgwt/n<<endl;
    cout<<"\nAverage Turnaround Time: "<< 1.0*avgtat/n<<endl;
    return 0;
}
