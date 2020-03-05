//
//  main.m
//  FindTheNumber
//
//  Created by Mykola Kondratyuk on 2/25/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Solution:NSObject
- (NSString *) findNumber:(NSArray *)arr k:(NSNumber *)k;
@end

@implementation Solution
/*
 * Complete the 'findNumber' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts following parameters:
 *  1. INTEGER_ARRAY arr
 *  2. INTEGER k
 */

- (NSString *) findNumber:(NSArray  *)arr
                        k:(NSNumber *)k
{
    NSString *result = @"NO";
    
    if(arr.count < 1 || arr.count > 100000)
    {
        return nil;
    }
    
    NSNumber *tempNumber = nil;
    for (NSUInteger i = 0; i < arr.count; i++)
    {
        tempNumber = arr[i];
        if(tempNumber.integerValue == k.integerValue)
        {
            return @"YES";
        }
    }
    
    
    return result;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *result = [[[Solution alloc] init] findNumber:@[@(100), @(55), @(2)]
                                                             k:@(34)];
        NSLog(@"result: %@\n\n", result);
    }
    return 0;
}
