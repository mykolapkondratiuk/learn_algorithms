//
//  main.m
//  New_Year_Chaos
//
//  Created by Mykola Kondratyuk on 2/21/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Solution:NSObject
- (void) minimumBribes:(NSArray *)q;
@end

@implementation Solution

- (void) minimumBribes:(NSArray *)q
{
    if(q == nil)
    {
        NSLog(@"Too chaotic");
    }
    
    if(q.count > 100000)
    {
        NSLog(@"Too chaotic");
    }
    
    int arraySize = (int)q.count;
    
    int queueArray[arraySize];
    NSNumber  *queueItemValue = nil;
    
    for( int i = 0; i < arraySize; i++)
    {
        queueItemValue  = q[i];
        queueArray[i]   = queueItemValue.intValue;
    }
    
    int ans       = 0;
    int temp_swap = 0;
    
    for (int i = arraySize - 1; i >= 0; i--)
    {
        if(queueArray[i] != (i + 1))
        {
            if( (i - 1) >= 0 && queueArray[i - 1] == (i + 1) )
            {
                ans++;
                // swap(A[i], A[i-1]);
                temp_swap         = queueArray[i];
                queueArray[i]     = queueArray[i - 1];
                queueArray[i - 1] = temp_swap;
            }
            else if( (i - 2) >= 0 && queueArray[i - 2] == (i + 1))
            {
                ans += 2;
                queueArray[i - 2] = queueArray[i - 1];
                queueArray[i - 1] = queueArray[i];
                queueArray[i]     = i + 1;
            }
            else
            {
                printf("Too chaotic\n");
                return;
            }
        }
    }
    
    printf("%d\n", ans);
}


- (void) minimumBribes_0:(NSArray *)q
{
    if(q == nil)
    {
        NSLog(@"Too chaotic");
    }
    
    if(q.count > 100000)
    {
        NSLog(@"Too chaotic");
    }
    
    int arraySize = (int)q.count;
    
    //  create initial & current array
    int initialArray[arraySize];
    int queueArray[arraySize];
    NSNumber  *queueItemValue = nil;
    
    for( int i = 0; i < arraySize; i++)
    {
        initialArray[i] = i + 1;
        queueItemValue  = q[i];
        queueArray[i]   = queueItemValue.intValue;
        
        //NSLog(@"\ni = %d\ninitialArray[i]: %d\nqueueArray[i]: %d\n✅\n", i, initialArray[i], queueArray[i]);
    }
    /* my way
    int numberOfBribe = 0;
    int swapValue     = 0;
    
    for( int i = 0; i < arraySize; i++)
    {
        if(queueArray[i] > initialArray[i])
        {
            swapValue = queueArray[i] - initialArray[i];
            
            if(swapValue > 2)
            {
                //NSLog(@"Too chaotic");
                printf("Too chaotic\n");
                return;
            }
            else
            {
                numberOfBribe += swapValue;
            }
        }
    
    }

    //NSLog(@"%d", numberOfBribe);
    printf("%d\n", numberOfBribe);
    */
    
    int ans = 0;
    
    for (int i = arraySize - 1; i >= 0; i--)
    {
        if (queueArray[i] - (i + 1) > 2)
        {
            printf("Too chaotic\n");
            return;
        }
        
        int start = MAX(0, queueArray[i] - 2); // #define MIN(a,b) ( ((a) < (b)) ? (a) : (b) )
        
        for (int j = start; j < i; j++)
        {
            if (queueArray[j] > queueArray[i])
            {
                ans++;
            }
        }
    }
    
    printf("%d\n", ans);
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //[[[Solution alloc] init] minimumBribes:@[@(2), @(1), @(5), @(3), @(4)]];
        
        [[[Solution alloc] init] minimumBribes:@[@(1), @(2), @(5), @(3), @(7), @(8), @(6), @(4)]];
        //1 2 5 3 7 8 6 4
        
    }
    return 0;
}


/*

C++

void minimumBribes(vector<int> A)
{
    int n = A.size();
    int cnt = 0;
    for(int i = n - 1; i >= 0; i--)
    {
        if(A[i] != (i + 1))
        {
            if(((i - 1) >= 0) && A[i - 1] == (i + 1))
            {
                cnt++;
                swap(A[i], A[i-1]);
            }
            else if(((i - 2) >= 0) && A[i - 2] == (i + 1))
            {
                cnt += 2;
                A[i - 2] = A[i - 1];
                A[i - 1] = A[i];
                A[i] = i + 1;
            }
            else
            {
                printf("Too chaotic\n");
                return;
            }
        }
    }
    printf("%d\n",cnt);
    return;
}
 
 */
