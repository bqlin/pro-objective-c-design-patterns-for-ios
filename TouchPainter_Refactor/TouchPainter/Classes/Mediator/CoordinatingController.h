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

/**
 中间协调控制器单例
 */
@interface CoordinatingController : NSObject <NSCopying>

/// 当前需要呈现的视图控制器
@property (nonatomic, readonly) UIViewController *activeViewController;
@property (nonatomic, readonly) CanvasViewController *canvasViewController;

+ (instancetype)sharedInstance;

// jump to view controller
// open, 
- (IBAction)requestViewChangeByObject:(id)sender;

@end
