//
//  CoordinatingController.h
//  TouchPainter
//
//  Created by LinBq on 2017/6/5.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CanvasViewController.h"
#import "PaletteViewController.h"
#import "ThumbnailViewController.h"

typedef NS_ENUM(NSInteger, ButtonTag) {
    kButtonTagDone,
    kButtonTagOpenPaletteView,
    kButtonTagOpenThumbnailView
};

@interface CoordinatingController : NSObject

@property (nonatomic, readonly) UIViewController *activeViewController;
@property (nonatomic, readonly) CanvasViewController *canvasViewController;

+ (instancetype)sharedInstance;

- (IBAction)requestViewChangeByObject:(id)sender;

@end
