//
//  OpenScribbleCommand.m
//  TouchPainter
//
//  Created by LinBq on 2017/6/13.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "OpenScribbleCommand.h"
#import "CoordinatingController.h"
#import "CanvasViewController.h"

@implementation OpenScribbleCommand

- (instancetype)initWithScribbleSource:(id<ScribbleSource>)scribbleSource {
    if (self = [super init]) {
        self.scribbleSource = scribbleSource;
    }
    return self;
}

- (void)execute {
    // get a scribble from the scribbleSource_
    Scribble *scribble = [self.scribbleSource scribble];
    
    // set it to the current CanvasViewController
    CoordinatingController *coordinator = [CoordinatingController sharedInstance];
    CanvasViewController *controller = [coordinator canvasViewController];
    controller.scribble = scribble;
    
    // then tell the coordinator to change views
    [coordinator requestViewChangeByObject:self];
}

@end
