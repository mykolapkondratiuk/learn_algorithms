//
//  main.m
//  BubbleSortCountSwaps
//
//  Created by Mykola Kondratyuk on 2/22/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Solution:NSObject
- (void) countSwaps:(NSArray *)a;
@end

@implementation Solution

void swap_NSINteger(NSInteger *xp, NSInteger *yp)
{
    NSInteger temp = *xp;
    *xp = *yp;
    *yp = temp;
}

- (void) countSwaps:(NSArray *)a
{
    NSInteger numberItemInArray = a.count;
    if(a == nil || numberItemInArray > 600 || numberItemInArray < 2)
    {
        printf("bad input data");
    }

    NSInteger intArray[numberItemInArray];
    NSNumber *tempNumber       = nil;
    NSInteger currentNSInteger = 0;
    for (NSUInteger i = 0; i < numberItemInArray; i++)
    {
        tempNumber       = a[i];
        currentNSInteger = tempNumber.integerValue;
        
        if(currentNSInteger < 1 || currentNSInteger > 2000000)
        {
            printf("bad input data");
            return;
        }
        
        intArray[i] = currentNSInteger;
    }
    
    NSUInteger numberSwaps = 0;
    
    for (NSUInteger i = 0; i < numberItemInArray; i++)
    {
        for (NSUInteger j = 0; j < numberItemInArray - 1; j++)
        {
            if(intArray[j] > intArray[j+1])
            {
                swap_NSINteger(&intArray[j], &intArray[j+1]);
                numberSwaps++;
            }
        }
    }
    
    printf("Array is sorted in %lu swaps.\n", (unsigned long)numberSwaps);
    printf("First Element: %ld \n", (long)intArray[0]);
    printf("Last Element: %ld \n", (long)intArray[numberItemInArray-1]);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [[[Solution alloc] init] countSwaps:@[@(6), @(4), @(1)]];
    }
    return 0;
}
