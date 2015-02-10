//
//  ChoiceViewController.m
//  ScribbleTouch
//
//  Created by Bobby Towers on 1/15/15.
//  Copyright (c) 2015 Jo Albright. All rights reserved.
//

#import "ChoiceViewController.h"


// <UIPickerViewDataSource, UIPickerViewDelegate> is available because of #import <UIKit/UIKit.h> from .h
// <> indicates some type of protocol (in this case, 2 protocols)
@interface ChoiceViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (weak, nonatomic) IBOutlet UIView *backgroundView;

@end

@implementation ChoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // we need to tell the data source who its delegate is
    // or else it won't know who to talk to
    
    // data source is information
    // delegate is telling it what to do
    
    // pickerView set to = the choice view controller itself
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    
    self.backgroundView.alpha = 0;
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [UIView animateWithDuration:0.4 animations:^{
        
        // anything we do here is the end result of the animation
        self.backgroundView.alpha = 0.6;
        
    }];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    // shows 2 components in the scroll selection for testing purposes
//    return 2;
    
    return 1;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    // returns the appropriate amount of rows based on how many choices we have
    return self.choices.count;
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    // return a string
    return self.choices[row];
    
}

- (IBAction)dismiss:(id)sender {
    
    NSString * choice = self.choices[[self.pickerView selectedRowInComponent:0]];
    
    [self.delegate choice:choice forGroup:self.group];
    
    [UIView animateWithDuration:0.4 animations:^{
        
         self.backgroundView.alpha = 0;
        
    } completion:^(BOOL finished) {
        
         [self dismissViewControllerAnimated:NO completion: nil];
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
