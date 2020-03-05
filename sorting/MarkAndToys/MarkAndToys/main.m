//
//  main.m
//  MarkAndToys
//
//  Created by Mykola Kondratyuk on 2/25/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Solution:NSObject
- (NSNumber *) maximumToys:(NSArray  *)prices
                         k:(NSNumber *)k;
@end

@implementation Solution

//
//  MARK: MERGE SORT
//
- (NSArray *) mergeSortArray:(NSArray *)unsortedArray
{
    // Time complexity: Worst case is: O(n * log(n)).
    // Space complexity: O(3 * n) or O(n) due to the 3 NSArrays that are used.
 
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
    return returnArray;
}

- (NSArray *) mergeArray:(NSArray *)leftArray
              rightArray:(NSArray *)rightArray
{
    NSMutableArray *returnArray = [NSMutableArray array];
    int i = 0, e = 0;
 
    while (i < [leftArray count] && e < [rightArray count])
    {
        int leftValue  = [[leftArray objectAtIndex:i] intValue];
        int rightValue = [[rightArray objectAtIndex:e] intValue];
        
        if (leftValue < rightValue)
        {
            [returnArray addObject: [leftArray objectAtIndex:i++]];
        } else
        {
            [returnArray addObject: [rightArray objectAtIndex:e++]];
        }
    }
 
    while (i < [leftArray count])
    {
        [returnArray addObject: [leftArray objectAtIndex:i++]];
    }
 
    while (e < [rightArray count])
    {
        [returnArray addObject: [rightArray objectAtIndex:e++]];
    }
 
    return returnArray;
}

//  MARK: BUBLE SORT - bad case for big values (like in file test_case_6.txt)

- (NSArray *)bubleSort:(NSArray *)a
{
    NSInteger numberItemInArray = a.count;
    if(a == nil || numberItemInArray > 100000 || numberItemInArray < 1)
    {
        return a;
    }

    NSNumber *tempNumber    = nil;
    NSInteger tempNSInteger = 0;
    
    NSNumber *tempJ      = nil;
    NSNumber *tempJplus1 = nil;
    
    NSMutableArray *mutableA = [NSMutableArray arrayWithArray:a];
    
    for (NSUInteger i = 0; i < numberItemInArray; i++)
    {
        tempNumber    = mutableA[i];
        tempNSInteger = tempNumber.integerValue;
        
        for (NSUInteger j = 0; j < numberItemInArray - 1; j++)
        {
            tempJ      = mutableA[j];
            tempJplus1 = mutableA[j+1];
            
            if(tempJ.integerValue > tempJplus1.integerValue)
            {
                [mutableA exchangeObjectAtIndex:j
                              withObjectAtIndex:j+1];
            }
        }
    }
    
    return [mutableA copy];
    
}

- (NSNumber *) maximumToys:(NSArray *)prices
                         k:(NSNumber *)k
{
    //NSNumber *result = nil;
    
    if(prices == nil || k == nil  || prices.count > 100000 || prices.count < 1 || k.integerValue > 1000000000 || k.integerValue < 1)
    {
        return nil;
    }
    
    //  1. sort array of prices
    NSArray *sortedPrices = [self mergeSortArray:prices];//[self bubleSort:prices];
    NSLog(@"sortedPrices:\n%@\n", sortedPrices);
    
    //  2. find sum <= k.unsignedIntegerValue
    NSUInteger numberToys  = 0;
    NSUInteger sum         = 0;
    NSUInteger maxSum      = k.unsignedIntegerValue;
    NSNumber *currentPrice = nil;
    
    for (NSUInteger i = 0; i < prices.count; i++)
    {
        currentPrice = sortedPrices[i];
        
        if(currentPrice.unsignedIntegerValue > 1000000000)
        {
            return nil;
        }
        
        sum = sum + currentPrice.unsignedIntegerValue;
        //NSLog(@"sum: %lu\n\n", (unsigned long)sum);
        
        if(sum <= maxSum)
        {
            numberToys++;
        }
    }
    
    return @(numberToys);
}

@end

NSString *pathInDocumentDirectory(NSString *fileName)
{
    // Get list of document directories in sandbox
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);

    // Get one and only one document directory from that list
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];

    // Append passed in file name to that directory, return it
    return [documentDirectory stringByAppendingPathComponent:fileName];

}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSNumber *result = [[[Solution alloc] init] maximumToys:@[@(1), @(12), @(5), @(111), @(200), @(1000), @(10)]
        //                                                      k:@(50)];
        //NSString *stringFromBrowser = @"52952808 39586066 70403274 84627963 46636834 13906132 18138605 22451014 71348257 91939176 17451226 31356009 15266983 33392541 37992362 55743111 55380991 48022854 54843595 440";
        
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
        
        NSLog(@"prices.count = %@\n\n", @(prices.count));
        NSNumber *result = [[[Solution alloc] init] maximumToys:prices
                                                              k:@(100000)];
        
        NSLog(@"result: %@\n\n", result);
    }
    return 0;
}
