//
//  main.m
//  Left_Rotation
//
//  Created by Mykola Kondratyuk on 2/20/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Solution:NSObject
- (NSArray *) rotLeft:(NSArray *)a
                    d:(NSNumber *)d;
@end

@implementation Solution

- (NSArray *) rotLeft:(NSArray  *)a
                    d:(NSNumber *)d
{
    if(a == nil || d == nil)
    {
        return nil;
    }
    
    if(a.count > 100000 || a.count < 1 || d.unsignedIntegerValue > a.count || d.unsignedIntegerValue < 1)
    {
        return nil;
    }
    
    NSMutableArray *leftedArray = [NSMutableArray arrayWithArray:a];
    [a enumerateObjectsUsingBlock:^(NSNumber *aItem, NSUInteger idx, BOOL *stop) {
        if(idx  >= d.unsignedIntegerValue)
        {
            [leftedArray replaceObjectAtIndex:idx - d.unsignedIntegerValue
                                   withObject:aItem];
        }
        else
        {
            [leftedArray replaceObjectAtIndex:a.count - d.unsignedIntegerValue + idx
                                   withObject:aItem];
        }
    }];
    
    return [leftedArray copy];
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *result = [[[Solution alloc] init] rotLeft:@[@(1), @(2), @(3), @(4), @(5)]
                                                         d:@(4)];
        
        NSLog(@"\nresult:  %@\n", result);
    }
    return 0;
}
