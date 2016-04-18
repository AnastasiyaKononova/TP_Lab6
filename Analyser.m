//
//  Analyser.m
//  Lab6_1
//
//  Created by Admin on 11.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Analyser.h"

@implementation Analyser
- (void)foo:(NSString *)bar
{
    
    NSMutableDictionary *statistics = [NSMutableDictionary dictionary] ;
    NSArray *words = [bar componentsSeparatedByString:@" "];
    
    for (NSString* word in words) {
        NSNumber *repetitions = [statistics valueForKey:word];
        
        if ([repetitions integerValue] > 0)
        {
        [statistics setObject:[[NSNumber alloc] initWithLong:([repetitions integerValue] + 1)] forKey:word];
        }
        else [statistics setObject:[[NSNumber alloc] initWithLong:(1)] forKey:word];
    }
    
    NSArray *sortedKeys =
    [statistics keysSortedByValueUsingComparator: ^NSComparisonResult(id obj1, id obj2){
        return [obj2 compare:obj1];
    }];
    int i = 0;
    for(NSString* key in sortedKeys){
        if(i > 4)
            break;
            NSLog(@"%@ %@ ", key, statistics[key]);
        i++;
    }
        
}
@end
