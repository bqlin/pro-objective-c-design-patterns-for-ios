//
//  CoordinatingController.m
//  TouchPainter
//
//  Created by LinBq on 2017/6/5.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "CoordinatingController.h"

@implementation CoordinatingController

#pragma mark -
#pragma mark CoordinatingController Singleton Implementation

+ (instancetype)sharedInstance{
    static CoordinatingController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        _canvasViewController = [[CanvasViewController alloc] init];
        _activeViewController = _canvasViewController;
    }
    return self;
}

#pragma mark -
#pragma mark A method for view transitions

- (void)requestViewChangeByObject:(id)sender {
    if ([sender isKindOfClass:[UIBarButtonItem class]]) {
        switch ([(UIBarButtonItem *)sender tag]) {
        case kButtonTagOpenPaletteView:{
            // load a PaletteViewController
            PaletteViewController *controller = [[PaletteViewController alloc] init];
            
            // transition to the PaletteViewController
            [self.canvasViewController presentViewController:controller animated:YES completion:NULL];
            
            // set the activeViewController
            _activeViewController = controller;
        }break;
        case kButtonTagOpenThumbnailView:{
            ThumbnailViewController *controller = [[ThumbnailViewController alloc] init];
            [self.canvasViewController presentViewController:controller animated:YES completion:NULL];
            _activeViewController = controller;
        }break;
        default:{ // just go back to the main canvasViewController for the other types
            // The Done command is shared on every
            // view controller except the CanvasViewController
            // When the Done button is hit, it should
            // take the user back to the first page in
            // conjunction with the design
            // other objects will follow the same path
            [self.canvasViewController dismissViewControllerAnimated:YES completion:NULL];
            
            // set the activeViewController back to
            // canvasViewController
            _activeViewController = _canvasViewController;
        }break;
        }
    } else { // every thing else goes to the main canvasViewController
        [self.canvasViewController dismissViewControllerAnimated:YES completion:NULL];
        _activeViewController = _canvasViewController;
    }
}

@end
