//
//  main.m
//  SortingByComparator
//
//  Created by Mykola Kondratyuk on 2/26/20.
//  Copyright © 2020 Mykola Kondratyuk. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Player: NSObject

@property (nonatomic, strong, readwrite) NSString   *name;
@property (nonatomic, assign, readwrite) NSUInteger  score;

@end

@implementation Player

- (instancetype)initWithName:(NSString *)name
                       score:(NSUInteger)score
{
    if( self = [super init])
    {
        self.name  = name;
        self.score = score;
    }
    
    return self;
}



@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Player *player1 = [[Player alloc] initWithName:nil
                                                 score:5];
        
        Player *player2 = [[Player alloc] initWithName:@"ami"
                                                 score:100];
        
        Player *player3 = [[Player alloc] initWithName:@"david"
                                                 score:100];
         
        Player *player4 = [[Player alloc] initWithName:@"heraldo"
                                                 score:50];
        
        Player *player5 = [[Player alloc] initWithName:@"aakansha"
                                                 score:75];
        
        Player *player6 = [[Player alloc] initWithName:@"aleksa"
                                                 score:150];
        NSArray *unsortedArray = @[player1, player2, player3, player4, player5, player6];
        
        /*
        //
        //  FIXME: uncorrect way
        //
        
        NSArray *sortedArray_temp = [unsortedArray sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
            NSUInteger first  = [(Player *)a score];
            NSUInteger second = [(Player *)b score];
            return first < second;
        }];
         
        NSArray *sortedArray = [sortedArray_temp sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
             NSString *first  = [(Player *)a name];
             NSString *second = [(Player *)b name];
             return first < second;
        }];
        */
        
        
        NSSortDescriptor *nameSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name"
                                                                           ascending:NO];
        NSSortDescriptor *scoreSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"score"
                                                                           ascending:NO];
        
        NSArray *sortDescriptors = @[scoreSortDescriptor, nameSortDescriptor];
        NSArray *sortedArray = [unsortedArray sortedArrayUsingDescriptors:sortDescriptors];
        
        
        NSLog(@"sortedArray:\n %@\n\n", sortedArray);
        
        for (Player *player in sortedArray)
        {
            NSLog(@"%@ %lu", player.name, (unsigned long)player.score);
        }
        
    }
    
    return 0;
}
