//
//  main.m
//  AlternatingCharacters
//
//  Created by Mykola Kondratyuk on 3/4/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Solution:NSObject
- (NSNumber *) alternatingCharacters:(NSString *)s;
@end

@implementation Solution

- (NSNumber *) alternatingCharacters:(NSString *)s
{
    NSMutableArray <NSString*> *sList = [NSMutableArray array];
    for (int i = 0; i <  s.length; i++) {
        [sList addObject:[s substringWithRange:NSMakeRange(i, 1)]];
    }
    
    NSUInteger counterDeletion = 0;
    
    for(NSUInteger i = 1; i < s.length; i++)
    {
        if([[sList objectAtIndex:i-1] isEqualToString:[sList objectAtIndex:i]])
        {
            //  need make deletion
            counterDeletion++;
        }
    }
    
    return @(counterDeletion);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSNumber *result = [[[Solution alloc] init] alternatingCharacters:@"AAABBB"];
        NSLog(@"\nresult = %@\n", result);
    }
    return 0;
}
