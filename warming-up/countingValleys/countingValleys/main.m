//
//  main.m
//  countingValleys
//
//  Created by Mykola Kondratyuk on 2/19/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

#import <Foundation/Foundation.h>
//  https://www.hackerrank.com/challenges/counting-valleys/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=warmup

@interface Solution:NSObject
- (NSNumber *) countingValleys:(NSNumber *)n s:(NSString *)s;
@end

@implementation Solution
// Complete the countingValleys function below.
- (NSNumber *) countingValleys:(NSNumber *)n
                             s:(NSString *)s
{
    if(n == nil || s == nil)
    {
        return nil;
    }

    NSCharacterSet *theUDCharecterSet = [NSCharacterSet characterSetWithCharactersInString:s];
    NSString       *trimmingStr       = [s stringByTrimmingCharactersInSet:theUDCharecterSet];
    //NSLog(@"\ntrimmingStr.length = %@\n", @(trimmingStr.length));
    
    if(n.integerValue < 2 || n.integerValue > 1000000 || trimmingStr == 0)
    {
        return nil;
    }
    
    const char *charArray = [s cStringUsingEncoding:NSUTF8StringEncoding];
    NSInteger pathValue     = 0;
    NSInteger numberValleys = 0;
    
    for( int i = 0; i < s.length; i++)
    {
        if(charArray[i] == 'U')
        {
            pathValue = pathValue + 1;
            
            if(pathValue == 0)
            {
                numberValleys = numberValleys + 1;
            }
        }
        else
        {
            pathValue = pathValue - 1;
        }
    }
    
    NSNumber *result = @(numberValleys);
    
    return result;
}

@end

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSNumber *result = [[[Solution alloc] init] countingValleys:@(8)
                                                                  s:@"UDDDUDUU"];
        
        NSLog(@"\nresult:  %@\n", result);
    }
    return 0;
}
