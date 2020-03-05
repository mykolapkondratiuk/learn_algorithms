//
//  main.m
//  StringMakingAnagrams
//
//  Created by Mykola Kondratyuk on 3/4/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Solution:NSObject

- (NSNumber *) makeAnagram:(NSString *)a b:(NSString *)b;

@end

@implementation Solution

- (NSNumber *) makeAnagram:(NSString *)a
                         b:(NSString *)b
{
    NSMutableArray *aList = [NSMutableArray array];
    for (int i = 0; i <  a.length; i++) {
        [aList addObject:[a substringWithRange:NSMakeRange(i, 1)]];
    }
    NSCountedSet *countedSetA = [NSCountedSet setWithArray:aList];
    
    NSMutableArray *bList = [NSMutableArray array];
    for (int i = 0; i <  b.length; i++) {
        [bList addObject:[b substringWithRange:NSMakeRange(i, 1)]];
    }
    NSCountedSet *countedSetB = [NSCountedSet setWithArray:bList];
    
    NSMutableSet *aSet = [NSMutableSet setWithArray:aList];
    NSSet        *bSet = [NSSet setWithArray:bList];
    [aSet intersectSet:bSet];
    
    //  now need add repeating symbols to base anagram set
    __block NSMutableArray *anagram = [NSMutableArray arrayWithArray: [aSet allObjects]];
    
    NSLog(@"\nanagram.count = %@\naSet.count = %@\n", @(anagram.count), @(aSet.count));
    
    __block NSUInteger countMinRepetition = 0;
    [aSet enumerateObjectsUsingBlock:^(NSString *symbol, BOOL *stop){
        if([aList containsObject:symbol] && [bList containsObject:symbol])
        {
            countMinRepetition = MIN([countedSetA countForObject:symbol],[countedSetB countForObject:symbol]);
            if(countMinRepetition > 1)
            {
                for (NSUInteger i = 0; i < countMinRepetition - 1; i++)
                {
                    [anagram addObject:symbol];
                }
            }
        }
    }];
    
    NSLog(@"\nanagram.count = %@\naSet.count = %@\n", @(anagram.count), @(aSet.count));
    
    
    NSUInteger result = a.length + b.length - 2 * anagram.count;
    
    return @(result);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSNumber *result = [[[Solution alloc] init] makeAnagram:@"fcrxzwscanmligyxyvym"
                                                              b:@"jxwtrhvujlmrpdoqbisbwhmgpmeoke"];
        
        NSLog(@"result = %@\n\n", result);
    }
    return 0;
}
