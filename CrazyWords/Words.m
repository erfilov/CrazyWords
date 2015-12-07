//
//  Words.m
//  CrazyWords
//
//  Created by Vik on 09.11.15.
//  Copyright © 2015 Viktor Erfilov. All rights reserved.
//

#import "Words.h"

@implementation Words

- (void)getWords {
    self.answers = @{@"лисица" : @[@"1,2", @"0,2", @"0,1", @"1,1", @"1,0", @"0,0"],
                     @"гепард" : @[@"0,4", @"0,3", @"1,3", @"1,4", @"2,4", @"2,3"],
                     @"павлин" : @[@"3,4", @"3,3", @"3,2", @"3,1", @"2,1", @"2,2"],
                     @"бульдог" : @[@"4,4", @"4,3", @"4,2", @"4,1", @"4,0", @"3,0", @"2,0"]
                     };
    
    self.letters = @"асиегцилпагиндролвапдьлуб";

}

@end
