//
//  main.m
//  OddNumbers
//
//  Created by Mykola Kondratyuk on 2/25/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Solution:NSObject
- (NSArray *) oddNumbers:(NSNumber *)l r:(NSNumber *)r;
@end

@implementation Solution
/*
 * Complete the 'oddNumbers' function below.
 *
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts following parameters:
 *  1. INTEGER l
 *  2. INTEGER r
 */

- (NSArray *) oddNumbers:(NSNumber *)l
                       r:(NSNumber *)r
{
    if(l == nil || r == nil)
    {
        return nil;
    }
    
    if(l.integerValue < 1 || r.integerValue < l.integerValue || r.integerValue > 100000)
    {
        return nil;
    }
    
    NSMutableArray *oddNumbers = [NSMutableArray new];
    
    for (NSInteger i = l.integerValue; i <= r.integerValue; i++)
    {
        if(i % 2 != 0)
        {
            [oddNumbers addObject:@(i)];
        }
    }

    return [oddNumbers copy];
}

@end




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *result = [[[Solution alloc] init] oddNumbers:@(1)
                                                            r:@(100)];
        //printf(result);
        NSLog(@"result.count: %@\n\n", @(result.count));
    }
    return 0;
}
