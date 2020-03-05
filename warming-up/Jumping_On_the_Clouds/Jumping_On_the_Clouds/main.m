//
//  main.m
//  Jumping_On_the_Clouds
//
//  Created by Mykola Kondratyuk on 2/19/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Solution:NSObject
- (NSNumber *) jumpingOnClouds:(NSArray *)c;
@end

@implementation Solution

- (NSNumber *) jumpingOnClouds:(NSArray *)c
{
    if(c == nil || c.count < 2 || c.count > 100)
    {
        return nil;
    }
    /*
    NSNumber *c_0           = c[0];
    NSNumber *c_before_last = c[c.count - 1];
    if(c_0.integerValue != 0 ||  c_before_last.integerValue != 0)
    {
        return nil;
    }
    */
    NSNumber *result           = nil;
    NSUInteger jumpCounter     = 0;
    NSUInteger nextSkippedIndx = 0;
    
    for ( int i = 0; i < c.count - 1; i++)
    {
        if(nextSkippedIndx != 0 && nextSkippedIndx == i)
        {
            continue;
        }
        
        if( i + 2 > c.count - 1)
        {
            jumpCounter = jumpCounter + 1;
            continue;
        }
        
        NSNumber *longJump  = c[i + 2];
        //NSNumber *shortJump = c[i + 1];
               
        if(longJump.integerValue == 0)
        {
            //  can make jump
            nextSkippedIndx = i + 1;
            
        }
        else
        {
            
        }
        
        jumpCounter = jumpCounter + 1;
    }
    
    result = @(jumpCounter);
    
    return result;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSNumber *result = [[[Solution alloc] init] jumpingOnClouds:@[@(0), @(0), @(1), @(0), @(0), @(1), @(0)]];
        //NSNumber *result = [[[Solution alloc] init] jumpingOnClouds:@[@(0), @(0), @(0), @(0), @(1), @(0)]];
        NSNumber *result = [[[Solution alloc] init] jumpingOnClouds:@[@(0), @(0), @(0), @(1), @(0), @(0)]];
        
        NSLog(@"\nresult:  %@\n", result);
    }
    return 0;
}
