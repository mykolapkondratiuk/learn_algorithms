//
//  main.m
//  socks
//
//  Created by Mykola Kondratyuk on 2/19/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <objc/Object.h>
#import <objc/objc.h>

@interface NSString (NumberFromString)
- (NSNumber *) numberFromString:(NSNumberFormatter *)formatter;
@end

@implementation NSString (NumberFromString)
- (NSNumber *) numberFromString:(NSNumberFormatter *)formatter {
    NSNumber *number = [formatter numberFromString:self];

    if (number == nil) {
        [NSException raise:@"Bad Input" format:@"%@", self];
    }

    return number;
}
@end

@interface NSString (ArrayFromString)
- (NSArray *) arrayFromString;
@end

@implementation NSString (ArrayFromString)
- (NSArray *) arrayFromString {
    return [self componentsSeparatedByString:@" "];
}
@end

@interface Solution:NSObject
- (NSNumber *) sockMerchant:(NSNumber *)n ar:(NSArray *)ar;
@end

@implementation Solution

- (NSNumber *) sockMerchant:(NSNumber *)n ar:(NSArray *)ar
{
    if(ar == nil || n == nil)
    {
        return nil;
    }

    if(ar.count > 100 || ar.count < 1 || ar.count != n.integerValue)
    {
        return nil;
    }
    
    NSCountedSet *filter = [NSCountedSet setWithArray:ar];
    NSMutableDictionary *dictionaryWithCoutValuePair = [NSMutableDictionary new];
    
    [ar enumerateObjectsUsingBlock:^(NSNumber *arItem, NSUInteger idx, BOOL *stop) {
        
        NSLog(@"\nfor arItem: %@\nnumber of items =  %@\n",  arItem, @([filter countForObject:arItem]));
        //  reset if exist for the same key
        [dictionaryWithCoutValuePair setValue:@([filter countForObject:arItem])
                                       forKey:[arItem stringValue]];
        
    }];

    __block NSUInteger numberOfPair = 0;
    
    [dictionaryWithCoutValuePair enumerateKeysAndObjectsUsingBlock:^(NSString *arItemStringValueAsKey, NSNumber *numberOfArItem, BOOL *stop ){
        numberOfPair = numberOfPair + numberOfArItem.integerValue/2;
    }];
    
    return @(numberOfPair);
}

@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
        NSString *stdout = [[[NSProcessInfo processInfo] environment] objectForKey:@"OUTPUT_PATH"];
        [[NSFileManager defaultManager] createFileAtPath:stdout contents:nil attributes:nil];
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:stdout];

        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];

        NSData *availableInputData = [[NSFileHandle fileHandleWithStandardInput] availableData];
        NSString *availableInputString = [[NSString alloc] initWithData:availableInputData encoding:NSUTF8StringEncoding];
        NSArray *availableInputArray = [availableInputString componentsSeparatedByString:@"\n"];

        NSUInteger currentInputLine = 0;

        NSNumber *n = [[availableInputArray objectAtIndex:currentInputLine] numberFromString:numberFormatter];
        currentInputLine += 1;

        NSArray *arTemp = [[availableInputArray objectAtIndex:currentInputLine] componentsSeparatedByString:@" "];
        currentInputLine += 1;

        NSMutableArray *arTempMutable = [NSMutableArray arrayWithCapacity:[n unsignedIntegerValue]];

        [arTemp enumerateObjectsUsingBlock:^(NSString *arItem, NSUInteger idx, BOOL *stop) {
            [arTempMutable addObject:[arItem numberFromString:numberFormatter]];
        }];

        NSArray *ar = [arTempMutable copy];

        NSNumber *result = [[[Solution alloc] init] sockMerchant:n ar:ar];

        [fileHandle writeData:[[result stringValue] dataUsingEncoding:NSUTF8StringEncoding]];
        [fileHandle writeData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];

        [fileHandle closeFile];
         */
        
        NSNumber *result = [[[Solution alloc] init] sockMerchant:@(9)
                                                              ar:@[@(10), @(20), @(20), @(10), @(10), @(30), @(50), @(10), @(20)]];
        
        NSLog(@"\nresult:  %@\n", result);
    }

    return 0;
}
