//
//  SetStrokeSizeCommand.m
//  TouchPainter
//
//  Created by LinBq on 2017/6/13.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "SetStrokeSizeCommand.h"
#import "CoordinatingController.h"
#import "CanvasViewController.h"

@implementation SetStrokeSizeCommand

- (void)execute {
    // get the current stroke size
    // from whatever it's my delegate
    CGFloat strokeSize = 1;
    [self.delegate command:self DidRequestForStrokeSize:&strokeSize];
    
    // get a hold of the current
    // canvasViewController from
    // the coordinatingController
    // (see the Mediator pattern chapter
    // for details)
    CoordinatingController *coordinator = [CoordinatingController sharedInstance];
    CanvasViewController *controller = coordinator.canvasViewController;
    
    // assign the stroke size to
    // the canvasViewController
    controller.strokeSize = strokeSize;
}

@end
