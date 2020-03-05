//
//  main.m
//  MergeSort
//
//  Created by Mykola Kondratyuk on 2/27/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SortingAlgorithms:NSObject

- (NSArray *) mergeSortArray:(NSArray *)unsortedArray;

@end

@interface SortingAlgorithms ()

@end

@implementation SortingAlgorithms

//
//  MARK: MERGE SORT
//
- (NSArray *) mergeSortArray:(NSArray *)unsortedArray
{
    // Time complexity: Worst case is: O(n * log(n)).
    // Space complexity: O(n)
    
    static int count_merge_sort_reccursions = 0;
 
    int count = (int)[unsortedArray count];
    
    if (count < 2)
    {
        return unsortedArray;
    }
    
    int middle = count / 2;
    NSArray *leftArray  = [unsortedArray subarrayWithRange: NSMakeRange(0, middle)];
    NSArray *rightArray = [unsortedArray subarrayWithRange: NSMakeRange(middle, (count - middle))];
 
    NSArray *returnArray = [self mergeArray: [self mergeSortArray: leftArray]
                                 rightArray: [self mergeSortArray: rightArray]];
    NSLog(@"count_merge_sort_reccursions = %d\n", count_merge_sort_reccursions);
    count_merge_sort_reccursions++;
    
    return returnArray;
}

- (NSArray *) mergeArray:(NSArray *)leftArray
              rightArray:(NSArray *)rightArray
{
    NSMutableArray *returnArray = [NSMutableArray array];
    int i = 0, k = 0;
 
    static int count_right_to_left_swap = 0;
    
    while (i < [leftArray count] && k < [rightArray count])
    {
        int leftValue  = [[leftArray objectAtIndex:i] intValue];
        int rightValue = [[rightArray objectAtIndex:k] intValue];
        
        if (leftValue < rightValue)
        {
            [returnArray addObject: [leftArray objectAtIndex:i++]];
        }
        else
        {
            [returnArray addObject: [rightArray objectAtIndex:k++]];
            
            if(leftValue > rightValue)
            {
                count_right_to_left_swap++;
                NSLog(@"count_right_to_left_swap = %d\n", count_right_to_left_swap);
            }
        }
    }
 
    while (i < [leftArray count])
    {
        [returnArray addObject: [leftArray objectAtIndex:i++]];
    }
 
    while (k < [rightArray count])
    {
        [returnArray addObject: [rightArray objectAtIndex:k++]];
    }
 
    return returnArray;
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool
    {
        //  1
        NSArray<NSNumber *> *prices = @[@(1), @(12), @(5), @(111), @(200), @(1000), @(10)];
        
        /*
        //  2
        NSString *stringFromBrowser = [NSString stringWithContentsOfFile:@"/Users/mykolakondratyuk/Desktop/learning/2020/sorting/MarkAndToys/MarkAndToys/test_case_6.txt"
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
        */
        
        NSLog(@"prices.count = %@\n\n", @(prices.count));
        
        NSArray *sortedArray = [[[SortingAlgorithms alloc] init] mergeSortArray:prices];
        NSLog(@"sortedArray: %@\n✅\n", sortedArray);
    }
    
    return 0;
}
