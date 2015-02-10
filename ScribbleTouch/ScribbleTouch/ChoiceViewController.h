//
//  ChoiceViewController.h
//  ScribbleTouch
//
//  Created by Bobby Towers on 1/15/15.
//  Copyright (c) 2015 Jo Albright. All rights reserved.
//

#import <UIKit/UIKit.h>

// copy the class name and add Delegate
@protocol ChoiceViewControllerDelegate;

@interface ChoiceViewController : UIViewController

@property (nonatomic) NSArray * choices;
@property (nonatomic) NSString * group;

@property (nonatomic, assign) id <ChoiceViewControllerDelegate> delegate;

@end

@protocol ChoiceViewControllerDelegate <NSObject>

// here's the choice, for group
- (void)choice:(NSString *)choice forGroup:(NSString *)group;

@end
