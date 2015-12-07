//
//  ViewController.h
//  CrazyWords
//
//  Created by Vik on 31.10.15.
//  Copyright © 2015 Viktor Erfilov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Field.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) Field *field;

- (IBAction)actionClear:(id)sender;

@end

