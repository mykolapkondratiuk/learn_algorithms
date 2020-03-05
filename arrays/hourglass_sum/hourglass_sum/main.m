//
//  main.m
//  hourglass_sum
//
//  Created by Mykola Kondratyuk on 2/19/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Solution:NSObject
- (NSNumber *) hourglassSum:(NSArray *)arr;
@end

@implementation Solution

- (NSNumber *) hourglassSum:(NSArray *)arr
{
    if(arr == nil) // || arr.count != 36)
    {
        return nil;
    }
    
    /* case then load flat ns array
    int flatArray[36];
    
    for ( int i = 0; i < 36; i++ ) {
        NSNumber *item = arr[i];
        int intValue = item.intValue;
        
        if(intValue < -9 || intValue > 9)
        {
            return nil;
        }
        
        flatArray[i] = intValue;
    }
    
    
    int a[6][6] = { flatArray[0],  flatArray[1],  flatArray[2],  flatArray[3],  flatArray[4],  flatArray[5],
                    flatArray[6],  flatArray[7],  flatArray[8],  flatArray[9],  flatArray[10], flatArray[11],
                    flatArray[12], flatArray[13], flatArray[14], flatArray[15], flatArray[16], flatArray[17],
                    flatArray[18], flatArray[19], flatArray[20], flatArray[21], flatArray[22], flatArray[23],
                    flatArray[24], flatArray[25], flatArray[26], flatArray[27], flatArray[28], flatArray[29],
                    flatArray[30], flatArray[31], flatArray[32], flatArray[33], flatArray[34], flatArray[35],
                  };
    */
    
    
    int a[6][6];
    NSNumber *item = nil;
    
    for( int i = 0; i < 6; i++)
    {
        for(int j = 0; j < 6; j++)
        {
            item = arr[i][j];
            int intValue = item.intValue;
            a[i][j] = intValue;
        }
    }
    
    int hourglassSum;
    int maxHourglassSum = -63; // -9 * 7
    
    for( int i = 0; i < 6; i++)
    {
        for(int j = 0; j < 6; j++)
        {
            if( (i + 2 <= 5) && (j + 2 <= 5) )
            {
                //  can build hourglass
                NSLog(@"\na[%d][%d] = %d\n", i,j, a[i][j] );
                NSLog(@"\na[%d][%d] = %d\n", i,j+1, a[i][j+1] );
                NSLog(@"\na[%d][%d] = %d\n", i,j+2, a[i][j+2] );
                
                hourglassSum = a[i][j] + a[i][j+1] + a[i][j+2] + a[i+1][j+1] + a[i+2][j] + a[i+2][j+1] + a[i+2][j+2];
                if(i == 0 && j == 0)
                {
                    maxHourglassSum = hourglassSum;
                }
                
                
                if(hourglassSum > maxHourglassSum)
                {
                    maxHourglassSum = hourglassSum;
                }
                
                NSLog(@"\nmaxHourglassSum = %d\nhourglassSum = %d\n✅\n", maxHourglassSum, hourglassSum  );
            }
        }
    }
    
    return @(maxHourglassSum);
}

@end

//
//
//
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
        NSNumber *result = [[[Solution alloc] init] hourglassSum:@[
            @[@(-9), @(-9), @(-9), @(1),  @(1), @(1)],
            @[@(-0), @(-9), @(0),  @(4),  @(3), @(2)],
            @[@(-9), @(-9), @(-9), @(1),  @(2), @(3)],
            @[@(0),  @(0),  @(8),  @(6),  @(6), @(0)],
            @[@(0),  @(0),  @(0),  @(-2), @(0), @(0)],
            @[@(0),  @(0),  @(1),  @(2),  @(4), @(0)]]];
        */
        
        /*
        NSNumber *numberArray[6][6]; --> don't work !
        for( int i = 0; i < 6; i++)
        {
            for(int j = 0; j < 6; j++)
            {
                numberArray[i][j] = @(0);
            }
        }
        
        numberArray[3][3] = @(33);
        NSLog(@"\nnumberArray:\n%@\n", numberArray);
        */
        
        
        // look like it --> wrong (swap)  position column & row
        NSMutableArray *stringArray = [NSMutableArray array];

        for (int column = 0; column < 5; column++)
        {
            NSMutableArray *columnArray = [NSMutableArray array];

            for (int row = 0; row < 5; row++)
            {
                [columnArray addObject:[NSString stringWithFormat:@"Row %i, column %i", row, column]];
            }

            [stringArray addObject:columnArray];
        }
        NSLog(@"\nstringArray:\n%@\n✅\n", stringArray);
        
        
        NSNumber *result = [[[Solution alloc] init] hourglassSum:@[
        @[@(-1), @(-1), @(0),  @(-9), @(-2), @(-2)],
        @[@(-2), @(-1), @(-6), @(-8), @(-2), @(-5)],
        @[@(-1), @(-1), @(-1), @(-2), @(-3), @(-4)],
        @[@(-1), @(-9), @(-2), @(-4), @(-4), @(-5)],
        @[@(-7), @(-3), @(-3), @(-2), @(-9), @(-9)],
        @[@(-1), @(-3), @(-1), @(-2), @(-4), @(-5)]]];
        
        NSLog(@"\nresult:  %@\n", result);
    }
    return 0;
}
