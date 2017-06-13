//
//  SaveScribbleCommand.m
//  TouchPainter
//
//  Created by LinBq on 2017/6/6.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "SaveScribbleCommand.h"
#import "ScribbleManager.h"
#import "CoordinatingController.h"
#import "UIView+UIImage.h"

@implementation SaveScribbleCommand

- (void)execute {
    // get a hold of all necessary information
    // from an instance of CanvasViewController
    // for saving its Scribble
    CoordinatingController *coordinatingController = [CoordinatingController sharedInstance];
    CanvasViewController *canvasViewController = coordinatingController.canvasViewController;
    Scribble *scribble = canvasViewController.scribble;
    UIImage *canvasViewImage = canvasViewController.canvasView.image;
    
    // use an instance of ScribbleManager
    // to save the scribble and its thumbnail
    ScribbleManager *scribbleManager = [[ScribbleManager alloc] init];
    [scribbleManager saveScribble:scribble thumbnail:canvasViewImage];
    
    // finally show an alertbox that says
    // after the scribble is saved
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Your scribble is saved"
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}

@end
