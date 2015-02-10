//
//  ScribbleView.m
//  ScribbleTouch
//
//  Created by Jo Albright on 1/14/15.
//  Copyright (c) 2015 Jo Albright. All rights reserved.
//

#import "ScribbleView.h"

@implementation ScribbleView

//    @[
//
//        @{
//            @"type":@"path",
//            @"fillColor":[UIColor greenColor],
//            @"strokeColor":[UIColor blackColor],
//            @"strokeWidth":@2,
//            @"points":@[CGPoint,CGPoint,CGPoint]
//        },
//
//        @{
//            @"type":@"circle",
//            @"fillColor":[UIColor greenColor],
//            @"strokeColor":[UIColor blackColor],
//            @"strokeWidth":@2,
//            @"frame":CGRect
//        }
//
//    ];



- (NSMutableArray *)scribbles {
    
    if (_scribbles == nil) { _scribbles = [@[] mutableCopy]; }
    return _scribbles;
    
}

- (void)drawRect:(CGRect)rect {
    
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (NSDictionary * scribble in self.scribbles) {
        
        NSArray * points = scribble[@"points"];
        if (points.count < 2) continue;
        
        [self addToContext:context withScribble:scribble andType:@"Fill"];
        [self addToContext:context withScribble:scribble andType:@"Stroke"];
    
    }
    
}
        
//        ///////////// STROKE COLOR AND WIDTH
//        
//        CGContextSetLineWidth(context, [scribble[@"strokeWidth"] floatValue]);
//        
//        UIColor * strokeColor = scribble[@"strokeColor"];
//        [strokeColor set];
//        
//        ///////////// STROKE ALPHA
//        
//        CGContextSetAlpha(context, [scribble[@"strokeAlpha"] floatValue]);
//        
//        ///////////// BUILD STROKE PATH & LINE
//        
//        BOOL typeIsScribble = [scribble[@"type"] isEqualToString:@"Scribble"];
//        BOOL typeIsLine = [scribble[@"type"] isEqualToString:@"Line"];
//        
//        if (typeIsScribble || typeIsLine) {
//            
//            CGPoint firstPoint = [scribble[@"points"][0] CGPointValue];
//            CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
//            
//            for (NSValue * pointValue in scribble[@"points"]) {
//                
//                CGPoint point = [pointValue CGPointValue];
//                CGContextAddLineToPoint(context, point.x, point.y);
//                
//            }
//            
//            
//        }
//        
//        ///////////// BUILD RECTANGLE
//        
//        if ([scribble[@"type"] isEqualToString:@"Rectangle"]) {
//            
//            CGPoint firstPoint = [scribble[@"points"][0] CGPointValue];
//            CGPoint secondPoint = [scribble[@"points"][1] CGPointValue];
//            
//            CGFloat width = secondPoint.x - firstPoint.x;
//            CGFloat height = secondPoint.y - firstPoint.y;
//            
//            CGRect rect = CGRectMake(firstPoint.x, firstPoint.y, width, height);
//            
//            CGContextAddRect(context, rect);
//            
//        }
//        
//        ///////////// BUILD TRIANGLE
//        
//        if ([scribble[@"type"] isEqualToString:@"Triangle"]) {
//            
//            CGPoint firstPoint = [scribble[@"points"][0] CGPointValue];
//            CGPoint secondPoint = [scribble[@"points"][1] CGPointValue];
//            
//            CGFloat width = secondPoint.x - firstPoint.x;
//            CGFloat height = secondPoint.y - firstPoint.y;
//            
////            don't need this line anymore
////            CGRect rect = CGRectMake(firstPoint.x, firstPoint.y, width, height);
//            
//            // move to point
//            CGContextMoveToPoint(context, firstPoint.x + width / 2, firstPoint.y);
//            
//            // can simplify firstPoint.y + rect.size.height to = secondPoint.y
//            // this creates the lines to the triangles
//            CGContextAddLineToPoint(context, secondPoint.y, secondPoint.y);
//            CGContextAddLineToPoint(context, firstPoint.x, secondPoint.y);
//            CGContextAddLineToPoint(context, firstPoint.x + width / 2, firstPoint.y);
//            
//        }
//        
//        //////////// BUILD ELLIPSE
//        
////        NSArray * points = scribble[@"points"];   // already declared above
//        
//        if ([scribble[@"type"] isEqualToString:@"Ellipse"] && points.count > 1) {
//
//            CGPoint firstPoint = [scribble[@"points"][0] CGPointValue];
//            CGPoint secondPoint = [scribble[@"points"][1] CGPointValue];
//            
//            CGFloat width = (secondPoint.x - firstPoint.x);
//            CGFloat height = (secondPoint.y - firstPoint.y);
//            
//            CGRect ellipse = CGRectMake(firstPoint.x, firstPoint.y, width, height);
//            
//            CGContextAddEllipseInRect(context, ellipse);
//            
//        }
//        
//        /////////// draws the shape or scribbles
//        CGContextStrokePath(context);
//    
//    }
//    
//    
//    // fill code
//    
//    for (NSDictionary * scribble in self.scribbles) {
//        
//        ///////////// STROKE COLOR AND WIDTH
//        
//        CGContextSetLineWidth(context, [scribble[@"strokeWidth"] floatValue]);
//        
//        UIColor * fillColor = scribble[@"fillColor"];
//        [fillColor set];
//        
//        ///////////// STROKE ALPHA
//        
////        CGContextSetAlpha(context, [scribble[@"strokeAlpha"] floatValue]);
//        
//        ///////////// BUILD STROKE PATH
//        
//        BOOL typeIsScribble = [scribble[@"type"] isEqualToString:@"Scribble"];
//        BOOL typeIsLine = [scribble[@"type"] isEqualToString:@"Line"];
//        
//        if (typeIsScribble || typeIsLine) {
//            
//            CGPoint firstPoint = [scribble[@"points"][0] CGPointValue];
//            CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
//            
//            for (NSValue * pointValue in scribble[@"points"]) {
//                
//                CGPoint point = [pointValue CGPointValue];
//                CGContextAddLineToPoint(context, point.x, point.y);
//                
//            }
//            
//            
//        }
//        
//        /////// FILL RECTANGLE
//        
//        if ([scribble[@"type"] isEqualToString:@"Rectangle"]) {
//            
//            CGPoint firstPoint = [scribble[@"points"][0] CGPointValue];
//            CGPoint secondPoint = [scribble[@"points"][1] CGPointValue];
//            
//            CGFloat width = secondPoint.x - firstPoint.x;
//            CGFloat height = secondPoint.y - firstPoint.y;
//            
//            CGRect rect = CGRectMake(firstPoint.x, firstPoint.y, width, height);
//            CGContextFillRect(context, rect);
//            
//            
//        }
//        // test by commenting out ifs
//        
//        
//        /////// FILL TRIANGLE
//        if ([scribble[@"type"] isEqualToString:@"Triangle"]) {
//            
//            CGPoint firstPoint = [scribble[@"points"][0] CGPointValue];
//            CGPoint secondPoint = [scribble[@"points"][1] CGPointValue];
//            
//            CGFloat width = secondPoint.x - firstPoint.x;
//            CGFloat height = secondPoint.y - firstPoint.y;
//            
//            //            don't need this line anymore
//            //            CGRect rect = CGRectMake(firstPoint.x, firstPoint.y, width, height);
//            
//            // move to point
//            CGContextMoveToPoint(context, firstPoint.x + width / 2, firstPoint.y);
//            
//            // can simplify firstPoint.y + rect.size.height to = secondPoint.y
//            // this creates the lines to the triangles
//            CGContextAddLineToPoint(context, secondPoint.y, secondPoint.y);
//            CGContextAddLineToPoint(context, firstPoint.x, secondPoint.y);
//            CGContextAddLineToPoint(context, firstPoint.x + width / 2, firstPoint.y);
//            CGContextFillPath(context);
//            
//        }
//        
//        ///////// FILL ELLIPSE
//        
//        if ([scribble[@"type"] isEqualToString:@"Ellipse"]) {
//            
//            CGPoint firstPoint = [scribble[@"points"][0] CGPointValue];
//            CGPoint secondPoint = [scribble[@"points"][1] CGPointValue];
//            
//            CGFloat width = (secondPoint.x - firstPoint.x);
//            CGFloat height = (secondPoint.y - firstPoint.y);
//            
//            CGRect ellipse = CGRectMake(firstPoint.x, firstPoint.y, width, height);
//            
//            CGContextAddEllipseInRect(context, ellipse);
//            CGContextFillEllipseInRect(context, ellipse);
//            
//        }
//        
//    
//        
//    }
    

- (void)addToContext:(CGContextRef)context withScribble:(NSDictionary *)scribble andType:(NSString *)type {
    
    
    NSArray * shapeTypes = @[
                                 
                             @"Scribble",
                             @"Line",
                             @"Rectangle",
                             @"Ellipse",
                             @"Triangle"
                             
                             ];
    
    NSArray * points = scribble[@"points"];
    
    ///////////// STROKE COLOR AND WIDTH
    
    CGContextSetLineWidth(context, [scribble[@"strokeWidth"] floatValue]);
    
    UIColor * strokeColor = scribble[@"strokeColor"];
    [strokeColor set];
    
    ///////////// STROKE ALPHA
    
    CGContextSetAlpha(context, [scribble[@"strokeAlpha"] floatValue]);
    
    
    
    
    
//    CGPoint firstPoint = [scribble[@"points"][0] CGPointValue];
//    CGPoint secondPoint = [scribble[@"points"][1] CGPointValue];
    
    CGPoint firstPoint = [points[0] CGPointValue];
    CGPoint secondPoint = [points[1] CGPointValue];

    CGFloat width = secondPoint.x - firstPoint.x;
    CGFloat height = secondPoint.y - firstPoint.y;

    CGRect rect = CGRectMake(firstPoint.x, firstPoint.y, width, height);
    
    
    switch ([shapeTypes indexOfObject:scribble[@"type"]]) {
            
        case 0: // Scribble
        case 1: // Line
            
            CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
            
            for (NSValue * pointValue in scribble[@"points"]) {
                
                CGPoint point = [pointValue CGPointValue];
                CGContextAddLineToPoint(context, point.x, point.y);
                
            }
            
            break;
        
        case 2: // Rectangle
            
            CGContextAddRect(context, rect);
            
            break;
            
        case 3: // Ellipse
            
            CGContextAddEllipseInRect(context, rect);
            
            break;
            
        case 4: // Triangle

            CGContextMoveToPoint(context, firstPoint.x + width / 2, firstPoint.y);
            CGContextAddLineToPoint(context, secondPoint.y, secondPoint.y);
            CGContextAddLineToPoint(context, firstPoint.x, secondPoint.y);
            CGContextAddLineToPoint(context, firstPoint.x + width / 2, firstPoint.y);
            
            break;
            
        default:
            break;
    }
    
    
    
    if ([type isEqualToString:@"Fill"]){
        
        CGContextFillPath(context);
        
    } else {
        
        CGContextStrokePath(context);
        
    }
    
}

@end

///////////// BUILD STROKE PATH & LINE
    
//    BOOL typeIsScribble = [scribble[@"type"] isEqualToString:@"Scribble"];
//    BOOL typeIsLine = [scribble[@"type"] isEqualToString:@"Line"];
//    
//    if (typeIsScribble || typeIsLine) {
//        
//        CGPoint firstPoint = [scribble[@"points"][0] CGPointValue];
//        CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
//        
//        for (NSValue * pointValue in scribble[@"points"]) {
//            
//            CGPoint point = [pointValue CGPointValue];
//            CGContextAddLineToPoint(context, point.x, point.y);
//            
//        }
//        
//        
//    }
    
    ///////////// BUILD RECTANGLE
    
//    if ([scribble[@"type"] isEqualToString:@"Rectangle"]) {
//        
//        CGPoint firstPoint = [scribble[@"points"][0] CGPointValue];
//        CGPoint secondPoint = [scribble[@"points"][1] CGPointValue];
//        
//        CGFloat width = secondPoint.x - firstPoint.x;
//        CGFloat height = secondPoint.y - firstPoint.y;
//        
//        CGRect rect = CGRectMake(firstPoint.x, firstPoint.y, width, height);
//        
//        CGContextAddRect(context, rect);
//        
//    }
    
    ///////////// BUILD TRIANGLE
    
//    if ([scribble[@"type"] isEqualToString:@"Triangle"]) {
//        
//        CGPoint firstPoint = [scribble[@"points"][0] CGPointValue];
//        CGPoint secondPoint = [scribble[@"points"][1] CGPointValue];
//        
//        CGFloat width = secondPoint.x - firstPoint.x;
//        CGFloat height = secondPoint.y - firstPoint.y;
//        
//        //            don't need this line anymore
//        //            CGRect rect = CGRectMake(firstPoint.x, firstPoint.y, width, height);
//        
//        // move to point
//        CGContextMoveToPoint(context, firstPoint.x + width / 2, firstPoint.y);
//        
//        // can simplify firstPoint.y + rect.size.height to = secondPoint.y
//        // this creates the lines to the triangles
//        CGContextAddLineToPoint(context, secondPoint.y, secondPoint.y);
//        CGContextAddLineToPoint(context, firstPoint.x, secondPoint.y);
//        CGContextAddLineToPoint(context, firstPoint.x + width / 2, firstPoint.y);
//        
//    }
    
    //////////// BUILD ELLIPSE
    
//    if ([scribble[@"type"] isEqualToString:@"Ellipse"] && points.count > 1) {
//        
//        CGPoint firstPoint = [scribble[@"points"][0] CGPointValue];
//        CGPoint secondPoint = [scribble[@"points"][1] CGPointValue];
//        
//        CGFloat width = (secondPoint.x - firstPoint.x);
//        CGFloat height = (secondPoint.y - firstPoint.y);
//        
//        CGRect ellipse = CGRectMake(firstPoint.x, firstPoint.y, width, height);
//        
//        CGContextAddEllipseInRect(context, ellipse);
//        
//    }
    
    /////////// draws the shape or scribbles
//    CGContextStrokePath(context);
    



