//
//  Dot.h
//  TouchPainter
//
//  Created by LinBq on 2017/6/6.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "Vertex.h"

static NSString * const DotColorKey = @"DotColor";
static NSString * const DotSizeKey = @"DotSize";

@protocol MarkVisitor;

@interface Dot : Vertex

// Vertex
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat size;

// !!!: omit Mark interface

@end
