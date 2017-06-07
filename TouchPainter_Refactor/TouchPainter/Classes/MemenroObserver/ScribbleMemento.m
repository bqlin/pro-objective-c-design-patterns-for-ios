//
//  ScribbleMemento.m
//  TouchPainter
//
//  Created by LinBq on 2017/6/6.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "ScribbleMemento.h"

@implementation ScribbleMemento

- (NSData *)data {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_mark];
    return data;
}

+ (instancetype)mementoWithData:(NSData *)data {
    // It raises an NSInvalidArchiveOperationException if data is not a valid archive
    id<Mark> retoredMark = (id<Mark>)[NSKeyedUnarchiver unarchiveObjectWithData:data];
    ScribbleMemento *memento = [[[self class] alloc] initWithMark:retoredMark];
    return memento;
}

#pragma mark -
#pragma mark Private methods

- (instancetype)initWithMark:(id<Mark>)mark {
    if (self = [super init]) {
        self.mark = mark;
    }
    return self;
}

@end
