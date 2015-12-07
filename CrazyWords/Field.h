//
//  Field.h
//  CrazyWords
//
//  Created by Vik on 31.10.15.
//  Copyright © 2015 Viktor Erfilov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cell.h"
#import "Words.h"

@interface Field : UIView
@property (strong, nonatomic) Words *myWords;
@property (strong, nonatomic) NSMutableArray *cells;
@property (strong, nonatomic) NSMutableArray *wordCoord;
@property (strong, nonatomic) NSMutableArray *selectedViews;
@property (strong, nonatomic) NSMutableArray *currentViews;
@property (strong, nonatomic) NSMutableString *currentWord;
@property (strong, nonatomic) UIColor *cellColor;



- (void)startInView:(UIView *)view;
- (void)initObjects;
- (NSDictionary *)mapString:(NSString *)string withSize:(NSInteger)size;



@end
