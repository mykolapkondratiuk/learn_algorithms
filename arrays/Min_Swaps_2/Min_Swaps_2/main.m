//
//  main.m
//  Min_Swaps_2
//
//  Created by Mykola Kondratyuk on 2/21/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

// https://www.hackerrank.com/challenges/minimum-swaps-2/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=arrays


#import <Foundation/Foundation.h>

@interface Solution:NSObject
- (NSNumber *) minimumSwaps:(NSArray *)arr;
@end

@implementation Solution

- (NSNumber *) minimumSwaps:(NSArray *)arr
{
    NSUInteger numberElementsImArray = arr.count;
    
    if(arr == nil || numberElementsImArray > 100000 || numberElementsImArray < 1)
    {
        return nil;
    }
    
    // create sorted array
    NSUInteger sorted[numberElementsImArray];
    for (NSUInteger i = 0; i < numberElementsImArray; i++)
    {
        sorted[i] = i + 1;
    }
    
    NSUInteger numberСoincidence = 0;
    NSNumber *currentValue = nil;
    for (NSUInteger i = 0; i < numberElementsImArray; i++)
    {
        currentValue = arr[i];
        if(currentValue.unsignedIntegerValue == sorted[i])
        {
            numberСoincidence++;
        }
    }
    
    NSUInteger result = numberElementsImArray - 1 - numberСoincidence;
    
    return @(result);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //NSNumber *result = [[[Solution alloc] init] minimumSwaps:@[@(1), @(3), @(5), @(2), @(4),  @(6)]];
        
        /*
        NSNumber *result = [[[Solution alloc] init] minimumSwaps:
            @[//  1       2      3      4      5       6      7      8      9       0
                @(2),   @(31), @(1),  @(38), @(29),  @(5),  @(44), @(6),  @(12), @(18),  // 0
                @(39),  @(9),  @(48), @(49), @(13),  @(11), @(7),  @(27), @(14), @(33),  // 1
                @(50),  @(21), @(46), @(23), @(15),  @(26), @(8),  @(47), @(40), @(3),   // 2
                @(32),  @(22), @(34), @(42), @(16),  @(41), @(24), @(10), @(4),  @(28),  // 3
                @(36),  @(30), @(37), @(35), @(20),  @(17), @(45), @(43), @(25), @(19)   // 4
            ]
            // #26 only
            // have to be 46 ??? Expected Output
        ];
        */
        
        NSNumber *result = [[[Solution alloc] init] minimumSwaps:
            @[//  1       2      3      4      5       6      7      8      9       0
                @(2),   @(3),  @(4),  @(5),  @(6),   @(7),  @(8),  @(9),  @(10), @(11),  // 0
                @(12),  @(13), @(14), @(15), @(16),  @(17), @(18), @(19), @(1),  @(20),  // 1
            ]
            // #26 &
            // have to be - 46 !!! Expected Output
        ];
        
        NSLog(@"\nresult:  %@\n", result);
    }
    return 0;
}
