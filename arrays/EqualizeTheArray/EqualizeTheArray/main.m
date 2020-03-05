//
//  main.m
//  EqualizeTheArray
//
//  Created by Mykola Kondratyuk on 2/21/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

//  https://www.hackerrank.com/challenges/equality-in-a-array/problem?utm_campaign=challenge-recommendation&utm_medium=email&utm_source=24-hour-campaign

@interface Solution:NSObject
- (NSNumber *) equalizeArray:(NSArray *)arr;
@end

@implementation Solution

- (NSNumber *) equalizeArray:(NSArray *)arr
{
    int numberItemInArray = (int)arr.count;
    
    if(arr == nil || numberItemInArray > 100 || numberItemInArray < 1)
    {
        nil;
    }
    
    NSCountedSet   *counter          = [NSCountedSet setWithArray:arr];
    NSMutableArray *maxCountForIndex = [NSMutableArray new];
    
    for (NSNumber *value in arr)
    {
        if(value.intValue < 1 || value.intValue > 100)
        {
            return nil;
        }
        
        [maxCountForIndex addObject:@([counter countForObject:value])];
    }
    
    int maxCounter   = 0;
    int currentCount = 0;
    
    for (NSNumber *countValue in maxCountForIndex)
    {
        currentCount = countValue.intValue;
        
        if(maxCounter < currentCount)
        {
            maxCounter = currentCount;
        }
    }
    
    NSNumber *result = @(numberItemInArray-maxCounter);
    
    return result;
}

@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSNumber *result = [[[Solution alloc] init] equalizeArray:@[@(3), @(3), @(2), @(1), @(3)]];
        NSLog(@"\nresult:  %@\n", result);
    }
    return 0;
}

/*
[arr enumerateObjectsUsingBlock:^(NSNumber *value, NSUInteger idx, BOOL *stop){
    
    if(value.intValue < 1 || value.intValue > 100)
    {
        stop = YES;
        return nil;
    }
    
    [maxCountForIndex addObject:@([counter countForObject:value])];
}];
*/
