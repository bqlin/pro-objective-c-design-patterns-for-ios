//
//  NSMutableArray+Stack.m
//  TouchPainter
//
//  Created by LinBq on 2017/6/5.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "NSMutableArray+Stack.h"

@implementation NSMutableArray (Stack)

- (void)push:(id)object {
    if (object != nil) {
        [self addObject:object];
    }
}

- (id)pop {
    if (self.count == 0) return nil;
    
    id object = self.lastObject;
    return object;
}

- (void)dropBottom {
    if (self.count == 0) return;
    
    [self removeObjectAtIndex:0];
}

@end
