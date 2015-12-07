//
//  Field.m
//  CrazyWords
//
//  Created by Vik on 31.10.15.
//  Copyright © 2015 Viktor Erfilov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Field.h"



@interface Field ()
@end

@implementation Field



- (void)initObjects {
    self.currentWord = [NSMutableString string];
    self.wordCoord = [NSMutableArray array];
    self.selectedViews = [NSMutableArray array];
    self.currentViews = [NSMutableArray array];
}

- (void)startInView:(UIView *)view {
    
    [self initObjects];
    
    self.myWords = [[Words alloc] init];
    
    [self.myWords getWords];
    
    
    

    NSInteger size = sqrt(self.myWords.letters.length);
    
    CGFloat offset = 20.f;
    CGFloat borderWidth = 4.f;
    
    CGRect rect = view.bounds;
    
    
    CGFloat maxBoardSize = MIN(CGRectGetWidth(rect) - offset * 2 - borderWidth * 2,
                               CGRectGetHeight(rect) - offset * 2 - borderWidth * 2);
    
    NSInteger cellSize = (NSInteger)maxBoardSize / size;
    NSInteger boardSize = cellSize * size;
    
    CGRect boardRect = CGRectMake((CGRectGetWidth(rect) - boardSize) / 2,
                                  (CGRectGetHeight(rect) - boardSize) / 2,
                                  boardSize, boardSize);
    
    boardRect = CGRectIntegral(boardRect);
    
    
    NSDictionary *coordChar = [self mapString:self.myWords.letters withSize:size];
    NSString *letter = [NSString string];
    
    
    
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            
            if (i % 2 != j % 2) {
                
                Cell *cell = [[Cell alloc] initWithFrame:CGRectMake(
                                                                    CGRectGetMinX(boardRect) + i * cellSize,
                                                                    CGRectGetMinY(boardRect) + j * cellSize,
                                                                    cellSize - 1, cellSize - 1)];
                cell.backgroundColor = [UIColor lightGrayColor];
                cell.coord = CGPointMake(i, j);
                cell.busy = NO;
                
                
                [view addSubview:cell];
                
                UILabel *label = [[UILabel alloc] initWithFrame:cell.frame];
                letter = [[coordChar objectForKey:[NSString stringWithFormat:@"%d,%d", j, i]] uppercaseString];
                label.text = letter;
                label.textAlignment = NSTextAlignmentCenter;
                label.textColor = [UIColor whiteColor];
                label.font = [UIFont boldSystemFontOfSize:17];
                cell.labelCell = label;
                [view addSubview:label];
                [self.cells addObject:cell];
                
            } else {
                Cell *cell = [[Cell alloc] initWithFrame:CGRectMake(
                                                                    CGRectGetMinX(boardRect) + i * cellSize,
                                                                    CGRectGetMinY(boardRect) + j * cellSize,
                                                                    cellSize - 1, cellSize - 1)];
                cell.busy = NO;
                cell.backgroundColor = [UIColor lightGrayColor];
                cell.coord = CGPointMake(i, j);
                [view addSubview:cell];
                
                UILabel *label = [[UILabel alloc] initWithFrame:cell.frame];
                letter = [[coordChar objectForKey:[NSString stringWithFormat:@"%d,%d", j, i]] uppercaseString];
                [letter uppercaseString];
                label.text = letter;
                label.textAlignment = NSTextAlignmentCenter;
                label.textColor = [UIColor whiteColor];
                label.font = [UIFont boldSystemFontOfSize:17];
                cell.labelCell = label;
                [view addSubview:label];
                [self.cells addObject:cell];
            }
        }
    }

}


- (NSDictionary *)mapString:(NSString *)string withSize:(NSInteger)size {
    NSInteger index = 0;
    NSMutableDictionary *letters = [NSMutableDictionary dictionary];
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            NSRange range = NSMakeRange(index, 1);
            NSString *letter = [string substringWithRange:range];
            [letters setObject:letter forKey:[NSString stringWithFormat:@"%d,%d", i, j]];
            index++;
        }
    }
    
    return [letters copy];
}


@end
