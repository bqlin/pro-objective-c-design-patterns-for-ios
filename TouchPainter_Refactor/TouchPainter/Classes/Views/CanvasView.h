//
//  CanvasView.h
//  TouchPainter
//
//  Created by LinBq on 2017/6/6.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol Mark;

@interface CanvasView : UIView

@property (nonatomic, strong) id<Mark> mark;

@end
