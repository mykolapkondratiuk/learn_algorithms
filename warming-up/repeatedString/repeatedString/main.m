//
//  main.m
//  repeatedString
//
//  Created by Mykola Kondratyuk on 2/19/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Solution:NSObject
- (NSNumber *) repeatedString:(NSString *)s
                            n:(NSNumber *)n;
@end

@implementation Solution
// Complete the repeatedString function below.
- (NSNumber *) repeatedString:(NSString *)s
                            n:(NSNumber *)n
{
    if(s == nil || n == nil)
    {
        return nil;
    }
    
    if(s.length < 1 || s.length > 100)
    {
        return nil;
    }
    
    if(n.unsignedIntegerValue < 1 || n.unsignedIntegerValue > 10000000000000) // 10 ** 12
    {
        return nil;
    }
    
    NSNumber *result = nil;
    
    
    if([s isEqualToString:@"a"])
    {
        return n;
    }
    
    const char *charArray = [s cStringUsingEncoding:NSUTF8StringEncoding];
    NSUInteger numberCharA = 0;
    
    for( NSUInteger i = 0; i < s.length; i++)
    {
        if(charArray[i] == 'a')
        {
            numberCharA = numberCharA + 1;
        }
    }
    
    NSUInteger fullMultiplicator     = n.unsignedIntegerValue/s.length;
    NSUInteger numberLengthSubstring = n.unsignedIntegerValue % s.length;
    numberCharA                     *= fullMultiplicator;
    
    if(numberLengthSubstring != 0)
    {
        NSString *subString = [s substringToIndex:numberLengthSubstring];
        const char *charArray = [subString cStringUsingEncoding:NSUTF8StringEncoding];
        NSUInteger numberCharAInSubstring = 0;
        
        for( NSUInteger i = 0; i < subString.length; i++)
        {
            if(charArray[i] == 'a')
            {
                numberCharAInSubstring++; //= numberCharA + 1;
            }
        }
        
        numberCharA += numberCharAInSubstring;
    }
   
    result = @(numberCharA);
    
    return result;
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSNumber *result = [[[Solution alloc] init] repeatedString:@"aba"
                                                                 n:@(10)];
        
        //NSNumber *result = [[[Solution alloc] init] repeatedString:@"aba"
        //                                                         n:@(1000000000000)]; // 10 ** 12
        
        //NSNumber *result = [[[Solution alloc] init] repeatedString:@"abc"
        //                                                         n:@(1000000000)];   // 10 ** 10 ~ 30 second
        
        NSLog(@"\nresult:  %@\n", result);
    }
    return 0;
}
