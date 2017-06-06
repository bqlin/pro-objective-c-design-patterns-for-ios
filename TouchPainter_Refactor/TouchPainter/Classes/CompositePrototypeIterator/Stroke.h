//
//  Stroke.h
//  TouchPainter
//
//  Created by LinBq on 2017/6/6.
//  Copyright © 2017年 LinBq. All rights reserved.
//
// 笔画

#import "Mark.h"
#import "MarkEnumerator.h"

static NSString * const StrokeColorKey = @"StrokeColor";
static NSString * const StrokeSizeKey = @"StrokeSize";
static NSString * const StrokeChildrenKey = @"StrokeChildren";

@protocol MarkVisitor;

@interface Stroke : NSObject<Mark>

// Mark
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGPoint location;
@property (nonatomic, assign, readonly) NSUInteger count;
@property (nonatomic, strong, readonly) id<Mark> lastChild;

// !!!: omit Mark interface

@end
