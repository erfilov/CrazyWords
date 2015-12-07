//
//  Cell.h
//  CrazyWords
//
//  Created by Vik on 31.10.15.
//  Copyright © 2015 Viktor Erfilov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell : UIView
@property (assign, nonatomic) CGPoint coord;
@property (strong, nonatomic) UILabel *labelCell;
@property (assign, nonatomic, getter=isSelected) BOOL selected;
@property (assign, nonatomic, getter=isBusy) BOOL busy;




@end
