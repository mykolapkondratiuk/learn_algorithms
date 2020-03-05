//
//  main.m
//  Sherlock_and_theValidString
//
//  Created by Mykola Kondratyuk on 3/4/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Solution:NSObject
- (NSString *) isValid:(NSString *)s;
@end

@implementation Solution

- (NSString *) isValid:(NSString *)s
{
    if(s.length == 1)
    {
        return @"YES";
    }
    
    NSMutableArray <NSString*> *sList = [NSMutableArray array];
    for (int i = 0; i <  s.length; i++)
    {
        [sList addObject:[s substringWithRange:NSMakeRange(i, 1)]];
    }
    
    if(s.length == 2)
    {
        if([sList[0] isEqualToString:sList[1]] == NO)
        {
            return @"YES";
        }
        else
        {
            return @"NO";
        }
    }
    
    NSCountedSet      *countedSetS = [NSCountedSet setWithArray:sList];
    NSSet<NSString *> *setS        = [NSSet setWithArray:sList];

    __block NSUInteger currentSymbolCount = 0;
    __block NSMutableArray<NSNumber *> *frequencySymbolsList = [NSMutableArray new];
    
    [setS enumerateObjectsUsingBlock:^(NSString *symbol, BOOL *stop){
        currentSymbolCount = [countedSetS countForObject:symbol];
        [frequencySymbolsList addObject:@(currentSymbolCount)];
    }];
    
    NSArray<NSNumber *> *sortedFrequencySymbolsList = [frequencySymbolsList sortedArrayUsingComparator:^NSComparisonResult(NSNumber *first, NSNumber *second) {
         return first.unsignedIntegerValue > second.unsignedIntegerValue;
    }];
    
    NSMutableArray *cutted = [NSMutableArray arrayWithArray:sortedFrequencySymbolsList];
    
    if(sortedFrequencySymbolsList.lastObject.unsignedIntegerValue == sortedFrequencySymbolsList[sortedFrequencySymbolsList.count - 2].unsignedIntegerValue)
    {
        [cutted removeObjectAtIndex:0];
    }
    else if(sortedFrequencySymbolsList.firstObject.unsignedIntegerValue == sortedFrequencySymbolsList[2].unsignedIntegerValue)
    {
        [cutted removeObjectAtIndex:(cutted.count - 1)];
    }
    else
    {
        assert(false);
    }
    
    if([NSSet setWithArray:cutted].count > 1)
    {
        return @"NO";
    }

    return @"YES";
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSString *check = @"aabbcd";                    // have to be "NO"
        //NSString *check = @"aabbccddeefghi";            // have to be "NO"
        //NSString *check = @"abcdefghhgfedecba";         //             YES
        //NSString *check = @"abbac";                     //             YES
        NSString *check = [NSString stringWithContentsOfFile:@"/Users/mykolakondratyuk/Desktop/learning/2020/string_manipulation/Sherlock_and_theValidString/Sherlock_and_theValidString/test_case_7.txt"
                                                                encoding:NSUTF8StringEncoding
                                                                   error:NULL]; // expected: YES
        NSLog(@"check.length = %@\n\n", @(check.length));
        
        NSString *result = [[[Solution alloc] init] isValid:check];
        NSLog(@"\nresult = %@\n", result);
    }
    return 0;
}
