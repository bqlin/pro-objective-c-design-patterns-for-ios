//
//  Dot.m
//  TouchPainter
//
//  Created by LinBq on 2017/6/6.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "Dot.h"

@interface Dot ()
{
    UIColor *_color;
    CGFloat _size;
}

@end

@implementation Dot
@synthesize color = _color, size = _size;

- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor {
    [visitor visitDot:self];
}

#pragma mark -
#pragma mark NSCopying method

// it needs to be implemented for memento
- (id)copyWithZone:(NSZone *)zone {
    Dot *dotCopy = [[[self class] allocWithZone:zone] initWithLocation:self.location];
    
    // copy the color
    dotCopy.color = [UIColor colorWithCGColor:self.color.CGColor];
    
    // copy the size
    dotCopy.size = self.size;
    
    return dotCopy;
}

#pragma mark -
#pragma mark NSCoder methods

- (instancetype)initWithCoder:(NSCoder *)decoder {
    if (self = [super initWithCoder:decoder]) {
        self.color = [decoder decodeObjectForKey:DotColorKey];
        self.size = [decoder decodeFloatForKey:DotSizeKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [super encodeWithCoder:coder];
    [coder encodeObject:self.color forKey:DotColorKey];
    [coder encodeFloat:self.size forKey:DotSizeKey];
}

#pragma mark -
#pragma mark An Extended Direct-draw Example

// for a direct draw example
- (void) drawWithContext:(CGContextRef)context {
    CGFloat x = self.location.x;
    CGFloat y = self.location.y;
    CGFloat frameSize = self.size;
    CGRect frame = CGRectMake(x - frameSize / 2.0,
                              y - frameSize / 2.0,
                              frameSize,
                              frameSize);
    
    CGContextSetFillColorWithColor (context, self.color.CGColor);
    CGContextFillEllipseInRect(context, frame);
}

@end
