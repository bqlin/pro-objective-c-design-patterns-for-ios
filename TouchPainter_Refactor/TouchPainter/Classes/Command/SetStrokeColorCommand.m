//
//  SetStrokeColorCommand.m
//  TouchPainter
//
//  Created by LinBq on 2017/6/5.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "SetStrokeColorCommand.h"
#import "CoordinatingController.h"

@implementation SetStrokeColorCommand

- (void)execute {
    CGFloat redValue = 0.0;
    CGFloat greenValue = 0.0;
    CGFloat blueValue = 0.0;
    
    // Retrieve RGB values from a delegate or a block
    
    // Delegation (object adapter) approach:
    [self.delegate command:self didRequestColorComponentsForRed:&redValue green:&greenValue blue:&blueValue];
    
    // Block approach:
    if (_RGBValuesProvider != nil) {
        self.RGBValuesProvider(&redValue, &greenValue, &blueValue);
    }
    
    // Create a color object based on the RGB values
    UIColor *color = [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0];
    
    // Assign it to the current canvasViewController
    CoordinatingController *coordinator = [CoordinatingController sharedInstance];
    CanvasViewController *controller = [coordinator canvasViewController];
    controller.strokeColor = color;
    
    // Forward a post update message
    
    // Delegation approach:
    [self.delegate command:self didFinishColorUpdateWithColor:color];
    
    // Block approach:
    if (_postColorUpdateProvider != nil) {
        _postColorUpdateProvider(color);
    }
}

@end
