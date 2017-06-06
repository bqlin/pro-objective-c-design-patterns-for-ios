//
//  CanvasView.m
//  TouchPainter
//
//  Created by LinBq on 2017/6/6.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "CanvasView.h"
#import "MarkRenderer.h"

@implementation CanvasView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // create a renderer visitor
    MarkRenderer *markRenderer = [[MarkRenderer alloc] initWithCGContext:context];
    
    // pass this renderer along the mark composite structure
    [_mark acceptMarkVisitor:markRenderer];
}


@end
