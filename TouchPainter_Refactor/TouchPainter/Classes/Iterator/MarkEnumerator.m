//
//  MarkEnumerator.m
//  TouchPainter
//
//  Created by LinBq on 2017/6/6.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "MarkEnumerator.h"

@interface MarkEnumerator ()
{
    NSMutableArray *_stack;
}

@end

@implementation MarkEnumerator

#pragma mark - NSEnumerator

- (id)nextObject {
    return _stack.pop;
}

- (NSArray *)allObjects {
    // returns an array of yet-visited Mark nodes
    // i.e. the remaining elements in the stack
    return _stack.reverseObjectEnumerator.allObjects;
}

#pragma mark -
#pragma mark Private Methods

- (instancetype)initWithMark:(id<Mark>)mark {
    if (self = [super init]) {
        _stack = [[NSMutableArray alloc] initWithCapacity:mark.count];
        
        // post-orderly traverse the whole Mark aggregate
        // and add individual Marks in a private stack
        [self traverseAndBuildStackWithMark:mark];
    }
    return self;
}

- (void)traverseAndBuildStackWithMark:(id<Mark>)mark {
    // push post-order traversal
    // into the stack
    if (mark == nil) return;
    
    [_stack push:mark];
    
    NSUInteger index = mark.count;
    id<Mark> childMark;
    // !!!: 
    while (childMark == [mark childMarkAtIndex:--index]) {
        [self traverseAndBuildStackWithMark:childMark];
    }
}

@end
