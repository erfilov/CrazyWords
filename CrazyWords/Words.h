//
//  Words.h
//  CrazyWords
//
//  Created by Vik on 09.11.15.
//  Copyright © 2015 Viktor Erfilov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Words : NSObject
@property (strong, nonatomic) NSString *letters;
@property (strong, nonatomic) NSDictionary *answers;

- (void)getWords;

@end
