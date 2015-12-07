//
//  ViewController.m
//  CrazyWords
//
//  Created by Vik on 31.10.15.
//  Copyright © 2015 Viktor Erfilov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "Cell.h"

@interface ViewController () <UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *clearButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.field = [[Field alloc] init];
    [self.field startInView:self.view];
    
    
}




#pragma mark - Touches

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    self.field.cellColor = [self randomColor];
    CGPoint pointOnMainView = [touch locationInView:self.view];
    UIView *view = [self.view hitTest:pointOnMainView withEvent:event];
    
    if ([view isKindOfClass:[Cell class]]) {
        
        Cell *obj = (Cell *)view;
        
        if (![obj isSelected]) {
            obj.backgroundColor = self.field.cellColor;
            [self.field.currentWord appendString:obj.labelCell.text];
            
            [self.field.wordCoord addObject:[NSString stringWithFormat:@"%.f,%.f", obj.coord.y, obj.coord.x]];
            [self.field.currentViews addObject:obj];
            obj.selected = YES;
        }
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint pointOnMainView = [touch locationInView:self.view];
    UIView *view = [self.view hitTest:pointOnMainView withEvent:event];
    if ([view isKindOfClass:[Cell class]]) {
        Cell *obj = (Cell *)view;
        
        if (![obj isSelected] && ![obj isBusy]) {
            obj.backgroundColor = self.field.cellColor;
            [self.field.currentWord appendString:obj.labelCell.text];
            [self.field.wordCoord addObject:[NSString stringWithFormat:@"%.f,%.f", obj.coord.y, obj.coord.x]];
            [self.field.currentViews addObject:obj];
            obj.selected = YES;
        } 
    }
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([self checkWord:self.field.currentWord fromDictionary:self.field.myWords.answers]) {
        
        [UIView animateWithDuration:0.3
                              delay:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             
                             for (Cell *obj in self.field.currentViews) {
                                 
                                 obj.labelCell.transform = CGAffineTransformMakeScale(2.0, 2.0);
                                 obj.labelCell.transform = CGAffineTransformIdentity;
                             }
                         }
                         completion:nil];
        [self.field.selectedViews addObjectsFromArray:self.field.currentViews];
        self.field.selectedViews = [self viewIsBusyInArray:self.field.selectedViews];

    } else {
        for (id obj in self.view.subviews) {
            Cell *cell = (Cell *)obj;
            if ([cell isKindOfClass:[Cell class]]) {
                
                if (![self.field.selectedViews containsObject:cell]) {
                    cell.backgroundColor = [UIColor lightGrayColor];
                    cell.selected = NO;
                    cell.busy = NO;
                }
                
                
            }
        }
    }
    self.field.currentWord = [NSMutableString string];
    self.field.wordCoord = [NSMutableArray array];
    self.field.currentViews = [NSMutableArray array];
    
}



#pragma mark - Actions

- (IBAction)actionClear:(id)sender {
    for (id view in self.view.subviews) {
        if ([view isKindOfClass:[Cell class]]) {
            Cell *viewCell = (Cell *)view;
            viewCell.backgroundColor = [UIColor lightGrayColor];
        }
    }
    
    [self.field initObjects];
    
    for (Cell *obj in self.view.subviews) {
        if ([obj isKindOfClass:[Cell class]]) {
            obj.selected = NO;
            obj.busy = NO;
            
        }
    }
}

- (CGFloat) randomFromZeroToOne {
    return (float)(arc4random() % 101) / 100;
}

- (UIColor *) randomColor {
    CGFloat r = [self randomFromZeroToOne];
    CGFloat g = [self randomFromZeroToOne];
    CGFloat b = [self randomFromZeroToOne];
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

- (BOOL)checkWord:(NSString *)string fromDictionary:(NSDictionary *)dict {
    NSArray *arr = [NSArray array];
    for (NSString *key in self.field.myWords.answers.allKeys) {
        if ([key isEqualToString:[string lowercaseString]]) {
            arr = [self.field.myWords.answers objectForKey:[string lowercaseString]];
        }
        
     }
    if ([arr isEqualToArray:[self.field.wordCoord copy]]) {
        return YES;
    }
    return NO;
}

- (NSMutableArray *)viewIsBusyInArray:(NSMutableArray *)array {
    for (id view in array) {
        if ([view isKindOfClass:[Cell class]]) {
            Cell *cell = (Cell *)view;
            cell.busy = YES;
        }
    }
    return array;
}





@end
