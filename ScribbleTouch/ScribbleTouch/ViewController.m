//
//  ViewController.m
//  ScribbleTouch
//
//  Created by Jo Albright on 1/14/15.
//  Copyright (c) 2015 Jo Albright. All rights reserved.
//

#import "ViewController.h"
#import "ScribbleView.h"
#import "ChoiceViewController.h"

@interface ViewController () <ChoiceViewControllerDelegate>

// works the exact same as if we were to put it in the .h
// except the properties are not public
// meaning they can't be accessed by other classes
@property (weak, nonatomic) IBOutlet UIButton *blendModeButton;
@property (weak, nonatomic) IBOutlet UIButton *shapeTypeButton;
@property (weak, nonatomic) IBOutlet UIButton *toggleButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *drawerLeftConstraint;

@end

@implementation ViewController
{
    NSMutableDictionary * currentScribble;
    
    // command ctrl e to edit all scope
    UIColor * selectedStrokeColor;
    int selectedStrokeWidth;
    
    UIColor * selectedFillColor;
    
    float selectedAlpha;
    
    NSString * selectedBlendMode;
    NSString * selectedShapeType;

}

- (void)viewDidLoad {
    [super viewDidLoad];

    selectedFillColor = [UIColor clearColor];
    selectedStrokeColor = [UIColor blackColor];
    selectedStrokeWidth = 1;
    selectedBlendMode = @"Normal";
    selectedShapeType = @"Scribble";
    selectedAlpha = 1;

}

- (IBAction)changeFillColor:(UIButton *)sender {

    selectedFillColor = sender.backgroundColor;
    
}

- (IBAction)changeStrokeColor:(UIButton *)sender {
    
    selectedStrokeColor = sender.backgroundColor;
    
}

- (IBAction)changeStrokeWidth:(UISlider *)sender {
    
    selectedStrokeWidth = sender.value;
    
}

- (IBAction)changeAlpha:(UISlider *)sender {
    
    selectedAlpha = sender.value;
    
}

-(void)choice:(NSString *)choice forGroup:(NSString *)group {
    
    if ([group isEqualToString:@"BlendMode"]) {
        
        selectedBlendMode = choice;
        [self.blendModeButton setTitle:choice forState:UIControlStateNormal];
        
    }
    
    if ([group isEqualToString:@"ShapeType"]) {
        
        selectedShapeType = choice;
        [self.shapeTypeButton setTitle:choice forState:UIControlStateNormal];
        
    }
    
    NSLog(@"Choice = %@ for Group %@", choice, group);
    
}

- (IBAction)changeBlendMode:(id)sender {
    // occurs when we hit the button
    // then we set delegate to self, group to blendmode, and choices array to selection
    
    // presents choice view controller
    
    // identifier is under storyboard -> identifier inspector -> storyboard ID
    ChoiceViewController * choiceVC = [self.storyboard instantiateViewControllerWithIdentifier:@"choiceVC"];
    
    choiceVC.delegate = self;
    choiceVC.group = @"BlendMode";
    choiceVC.choices = @[
                         
                         @"Normal",
                         @"Multiply",
                         @"Overlay",
                         @"Screen",
                         @"Clear"
                         
                         ];
    
    // then we present
    // present is upwards and displays on top
    // push is rightwards and for navigation controller
    [self presentViewController:choiceVC animated:NO completion:nil];
    
}

- (IBAction)changeShapeType:(id)sender {
    
    ChoiceViewController * choiceVC = [self.storyboard instantiateViewControllerWithIdentifier:@"choiceVC"];
    
    choiceVC.delegate = self;
    choiceVC.group = @"ShapeType";
    choiceVC.choices = @[
                         
                         @"Scribble",
                         @"Line",
                         @"Rectangle",
                         @"Ellipse",
                         @"Triangle"
                         
                         ];
    
    [self presentViewController:choiceVC animated:NO completion:nil];
    
}

- (IBAction)showHideDrawer:(id)sender {
    
    self.drawerLeftConstraint.constant = (self.drawerLeftConstraint.constant == -16) ? -266 : -16;
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch * touch = touches.allObjects.firstObject;
    
    CGPoint location = [touch locationInView:self.view];
    
    
    currentScribble = [@{
                         
                         @"type":selectedShapeType,
                         @"blend":selectedBlendMode,
                         @"fillColor":selectedFillColor,
                         @"strokeColor":selectedStrokeColor,
                         @"strokeWidth":@(selectedStrokeWidth),
                         @"strokeAlpha":@(selectedAlpha),
                         @"points":[@[[NSValue valueWithCGPoint:location]] mutableCopy]
                         
                         } mutableCopy];
    
    ScribbleView * sView = (ScribbleView *)self.view;
    [sView.scribbles addObject:currentScribble];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch * touch = touches.allObjects.firstObject;
    
    CGPoint location = [touch locationInView:self.view];
    
    if ([selectedShapeType isEqualToString:@"Scribble"]) {
        
        [currentScribble[@"points"] addObject:[NSValue valueWithCGPoint:location]];
        
    } else {
        
        // updates second point
        currentScribble[@"points"][1] = [NSValue valueWithCGPoint:location];
    }
    
    
    
    [self.view setNeedsDisplay];
}

@end
