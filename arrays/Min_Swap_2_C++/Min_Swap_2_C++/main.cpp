//
//  main.cpp
//  Min_Swap_2_C++
//
//  Created by Mykola Kondratyuk on 2/21/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

#include <iostream>


//#include<bits/stdc++.h>
using namespace std;

int a[100005];
bool visited[100005];

int solve(int n)
{
    pair<int, int> p[n];
    
    for (int i = 0; i < n; i++)
    {
        p[i].first = a[i];
        
        // Storing the original position of a[i]
        p[i].second = i;
    }
    
    sort(p, p+n);
    int ans = 0;
    
    for (int i = 0; i < n; i++)
    {
        //visited[i]=true indicates that index i belongs to a cycle that is already counted
        
        //p[i].second = i denotes that the ith element was at its correct position
        
        if (visited[i] || p[i].second == i)
            continue;
            
        int cycle_size = 0;
        int j = i;
        
        //Counting the size of the cycle
        while (!visited[j])
        {
            visited[j] = 1;
            j = p[j].second;
            cycle_size++;
        }
        
        ans += (cycle_size - 1);
    }
    
    return ans;
    
}



int main(int argc, const char * argv[]) {
    int n = 50;
    /*
    scanf("%d", &n);
    
    for(int i = 0; i < n; i++)
    {
        scanf("%d", &a[i]);
    }
    */
    
    int b[50] = {2, 31, 1, 38, 29, 5, 44, 6, 12, 18, 39, 9, 48, 49, 13, 11, 7, 27, 14, 33, 50, 21, 46, 23, 15, 26, 8, 47, 40, 3, 32, 22, 34, 42, 16, 41, 24, 10, 4, 28, 36, 30, 37, 35, 20, 17, 45, 43, 25, 19};
    
    for (int i = 0; i < 50; i++) {
        a[i] = b[i];
    }
    
    /*
    int b[20] = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 1, 20};
    
    for (int i = 0; i < 20; i++) {
        a[i] = b[i];
    }
    */
    int ans = solve(n);
    printf("%d\n", ans);
    return 0;
}

/*
vector<int>v[100003];
bool visit[100003];

// This function return the size of the cycle as mentioned in the explanation.
int dfs(int i)
{
    visit[i] = true;
    int z = 1;
    
    for(auto x: v[i])
        if(!visit[x])
            z += dfs(x);
            
    return z;
}


int minimumSwaps(vector<int> A) {
    
    for(int i = 0; i < A.size(); ++i )
        v[i].push_back(A[i]-1), v[A[i]-1].push_back(i);
    
    int c = 0;

    for(int i = 0; i < A.size(); ++i)
    {
        if(!visit[i])
            c += dfs(i) - 1;
    }
    
    return c;
}
*/
