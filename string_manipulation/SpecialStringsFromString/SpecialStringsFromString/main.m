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
- (NSNumber *) substrCount_bad:(NSNumber *)n
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
    NSUInteger numberSymbols        = s.length;
    NSUInteger counterSpecialString = 0;
    NSUInteger c, j,              i = 0;
    
    NSUInteger same_char_count[numberSymbols];
    for (NSUInteger i = 0; i < numberSymbols ; i++)
    {
        same_char_count[i] = 0;
    }

    while(i < numberSymbols)
    {
        j = i + 1;
        c = 1;
        
        while( (j < numberSymbols) && [sList[i] isEqualToString:sList[j]])
        {
            j++;
            c++;
        }

        //total substrings which have all same char(s)
        counterSpecialString = counterSpecialString + (c*(c+1))/2;
        same_char_count[i]   = c;
        i = j;
    }

    for( j = 1; j < numberSymbols - 1; j++)
    {
        if([sList[j] isEqualToString: sList[j-1]])
        {
            same_char_count[j] = same_char_count[j-1];
        }

        //odd length substr(s) which has middle element diiferent
        if([sList[j-1] isEqualToString:sList[j+1]] && ([sList[j] isEqualToString:sList[j-1]] == NO))
        {
            counterSpecialString += MIN(same_char_count[j-1], same_char_count[j+1]);
        }
    }
    
    return @(counterSpecialString);
}



@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSNumber *result = [[[Solution alloc] init] substrCount:@(5)
                                                           //   s:@"aaaa"];
                                                           // s:@"abcbaba"];
                                                            s:@"asasd"];
        NSLog(@"result: %@\n\n", result);
    }
    return 0;
}
