//
//  main.m
//  FraudulentActivityNotifications
//
//  Created by Mykola Kondratyuk on 2/26/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Solution:NSObject
- (NSNumber *) activityNotifications:(NSArray *)expenditure d:(NSNumber *)d;
@end

@implementation Solution

- (NSNumber *) activityNotifications:(NSArray  *)expenditure
                                   d:(NSNumber *)d
{
    if(expenditure == nil || d == nil)
    {
        return nil;
    }

    NSUInteger numberDays = expenditure.count;
    int        period     = d.intValue;
    
    if(numberDays > 200000 || numberDays < 1 || period < 1 || period > numberDays)
    {   assert(false);
        return nil;
    }
    
    int currentExpenditure = 0;
    int currentPeriodWindow[period];
    int sortedCurrentWindow[period];
    
    for (int i = 0; i < period; i++)
    {
        sortedCurrentWindow[i] = 0;
    }
    
    double      medianForPeriodDays   = 0.0;
    NSUInteger  counterOfNotification = 0;
    
    for (int i = 0; i < numberDays; i++)
    {
        currentExpenditure = [(NSNumber *)expenditure[i] intValue];
        
        if(currentExpenditure > 200)
        {   assert(false);
            return nil;
        }
        
        if(i < period)
        {
            currentPeriodWindow[i] = currentExpenditure;
        }
        else
        {
            for (int i = 0; i < period; i++)
            {
                //printf("%d\n", currentPeriodWindow[i]);
                sortedCurrentWindow[i] = currentPeriodWindow[i];
            }
            //  make counting sort for floating array:  expenditure[i-period], ..., [i]
            //countSort(currentPeriodWindow, period, sortedCurrentWindow);
            counting_sort_mm(sortedCurrentWindow, period, 0, 200);
            for (int i = 0; i < period; i++)
            {
                //printf("%d\n", sortedCurrentWindow[i]);
            }
            
            //  get mediana
            if(period % 2 != 0)
            {   //  array is odd - непарний
                medianForPeriodDays = (double)sortedCurrentWindow[period/2];
            }
            else
            {   //  array length is even - парний
                medianForPeriodDays =  (double)(sortedCurrentWindow[(period - 1)/2] + sortedCurrentWindow[period/2])/2.0;
            }
            
            //  check for if need new notification 
            if( 2 * medianForPeriodDays <=  (double)currentExpenditure )
            {
                counterOfNotification++;
            }
            
            // shift for one day
            for ( int k = 0; k < period; k++)
            {
                sortedCurrentWindow[k] = currentPeriodWindow[k];
            }
            
            for ( int k = 0; k < (period - 1); k++)
            {
                currentPeriodWindow[k] = sortedCurrentWindow[k+1];
            }
            currentPeriodWindow[period - 1] = currentExpenditure;
        }
    }
    printf("%lu\n", (unsigned long)counterOfNotification);
    return @(counterOfNotification);
}


//  from https://rosettacode.org/wiki/Sorting_algorithms/Counting_sort#C
void counting_sort_mm(int *array, int n, int min, int max)
{
  int i, j, z;
 
  int range = max - min + 1;
  int *count = malloc(range * sizeof(*array));
 
  for(i = 0; i < range; i++)
      count[i] = 0;
  for(i = 0; i < n; i++)
      count[ array[i] - min ]++;
 
  for(i = min, z = 0; i <= max; i++)
  {
    for(j = 0; j < count[i - min]; j++)
    {
      array[z++] = i;
    }
  }
 
  free(count);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSNumber *result = [[[Solution alloc] init] activityNotifications:@[@(2), @(3), @(4), @(2), @(3), @(6), @(8), @(4), @(5)]
        //                                                               d:@(5)];
        
        //NSNumber *result = [[[Solution alloc] init] activityNotifications:@[@(1), @(2), @(3), @(4), @(4)]
        //                                                                d:@(4)];
        
        
        NSString *stringFromBrowser = [NSString stringWithContentsOfFile:@"/Users/mykolakondratyuk/Desktop/learning/2020/sorting/FraudulentActivityNotifications/FraudulentActivityNotifications/test_case_2.txt"
                                                                encoding:NSUTF8StringEncoding
                                                                   error:NULL];
        NSLog(@"stringFromBrowser.length = %@\n\n", @(stringFromBrowser.length));
        
        NSArray <NSString *>*pricesAsString = [stringFromBrowser componentsSeparatedByString:@" "];
        NSMutableArray<NSNumber *> *prices = [NSMutableArray new];
        NSNumberFormatter *formater = [[NSNumberFormatter alloc] init];
        formater.numberStyle        = NSNumberFormatterDecimalStyle;
        
        NSNumber *tempNumber = nil;
        for (NSUInteger i = 0; i < pricesAsString.count; i++)
        {
            tempNumber = nil;
            tempNumber = [formater numberFromString:pricesAsString[i]];
            if(tempNumber)
            {
                [prices addObject: tempNumber];
            }
        }
        NSLog(@"prices.count = %@\n\n", @(prices.count));
        //  have to be 770
        NSNumber *result = [[[Solution alloc] init] activityNotifications:prices
                                                                        d:@(9999)];
        
        NSLog(@"result: %@", result);
    }
    return 0;
}
