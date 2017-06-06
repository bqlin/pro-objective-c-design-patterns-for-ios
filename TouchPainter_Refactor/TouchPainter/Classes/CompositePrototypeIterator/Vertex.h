//
//  Vertex.h
//  TouchPainter
//
//  Created by LinBq on 2017/6/6.
//  Copyright © 2017年 LinBq. All rights reserved.
//
// 顶点

#import "Mark.h"

static NSString * const VertexLocationKey = @"VertexLocation";

@protocol MarkVisitor;

@interface Vertex : NSObject<Mark>

// Mark
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGPoint location;
@property (nonatomic, assign, readonly) NSUInteger count;
@property (nonatomic, strong, readonly) id<Mark> lastChild;

- (instancetype)initWithLocation:(CGPoint)location;

// !!!: omit Mark interface

@end
