//
//  DeleteScribbleCommand.m
//  TouchPainter
//
//  Created by LinBq on 2017/6/13.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "DeleteScribbleCommand.h"
#import "CoordinatingController.h"
#import "CanvasViewController.h"

@implementation DeleteScribbleCommand

- (void)execute {
    // get a hold of the current
    // CanvasViewController from
    // the CoordinatingController
    CoordinatingController *coordinatingController = [CoordinatingController sharedInstance];
    CanvasViewController *canvasViewController = coordinatingController.canvasViewController;
    
    // create a new scribble for
    // canvasViewController
    Scribble *newScribble = [[Scribble alloc] init];
    canvasViewController.scribble = newScribble;
}

@end
