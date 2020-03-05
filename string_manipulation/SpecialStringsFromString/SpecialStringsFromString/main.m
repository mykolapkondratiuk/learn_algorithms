//
//  main.m
//  SpecialStringsFromString
//
//  Created by Mykola Kondratyuk on 3/5/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Solution:NSObject
- (NSNumber *) substrCount:(NSNumber *)n s:(NSString *)s;
@end

@implementation Solution
// Complete the substrCount function below.
- (NSNumber *) substrCount:(NSNumber *)n
                         s:(NSString *)s
{
    if(n == nil || s == nil || s.length != n.unsignedIntegerValue || n.unsignedIntegerValue == 0 || n.unsignedIntegerValue > 1000000)
    {
        assert(false); return nil;
    }
    
    NSMutableArray <NSString*> *sList = [NSMutableArray array];
    for (int i = 0; i <  s.length; i++)
    {
        [sList addObject:[s substringWithRange:NSMakeRange(i, 1)]];
    }
    
    //  2. seach all special substring
    NSMutableArray<NSString *> *currentWindowStringListChars = [NSMutableArray new];
    NSString *currentWindowString   = nil;
    NSUInteger counterSpecialString = sList.count;
    NSSet *currentWindowSet         = nil;
    NSUInteger indexCenter          = 0;
    
    for (int i = 0; i < s.length; i++)
    {
        for(int k = 1; k + i <= s.length; k++)
        {
            currentWindowString = [s substringWithRange:NSMakeRange(i, k)];
            [currentWindowStringListChars removeAllObjects];
            
            for(int j = 0; j < currentWindowString.length; j++)
            {
                [currentWindowStringListChars addObject:[currentWindowString substringWithRange:NSMakeRange(j,1)]];
            }
            
            currentWindowSet = [NSSet setWithArray:currentWindowStringListChars];
            if(currentWindowStringListChars.count % 2 != 0)
            {
                //  odd number of items
                indexCenter = currentWindowString.length/2;
                
                if( (currentWindowSet.count == 2) &&
                    ([currentWindowStringListChars[indexCenter] isEqualToString:currentWindowStringListChars[0]] == NO) &&
                    [currentWindowStringListChars.firstObject isEqualToString:currentWindowStringListChars.lastObject]
                  )
                {
                    counterSpecialString++;
                }
                else if((currentWindowSet.count == 1) && (currentWindowStringListChars.count > 1))
                {
                    counterSpecialString++;
                }
            }
            else
            {
                if(currentWindowSet.count == 1)
                {
                    counterSpecialString++;
                }
            }
        }
    }
    
    return @(counterSpecialString);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSNumber *result = [[[Solution alloc] init] substrCount:@(4)
                                                              s:@"aaaa"];
                                                           // s:@"abcbaba"];
                                                           // s:@"asasd"];
        NSLog(@"result: %@\n\n", result);
    }
    return 0;
}
