//
//  MarkRenderer.h
//  TouchPainter
//
//  Created by LinBq on 2017/6/6.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "MarkVisitor.h"
#import "Dot.h"
#import "Vertex.h"
#import "Stroke.h"

@interface MarkRenderer : NSObject<MarkVisitor>

- initWithCGContext:(CGContextRef)context;

// !!!: omit MarkVisitor interface

@end
