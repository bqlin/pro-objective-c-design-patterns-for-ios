//
//  MarkEnumerator.h
//  TouchPainter
//
//  Created by LinBq on 2017/6/6.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableArray+Stack.h"
#import "Mark.h"

@interface MarkEnumerator : NSEnumerator

- (instancetype)initWithWithMark:(id<Mark>)mark;
- (void)traverseAndBuildStackWithMark:(id<Mark>)mark;

// !!!: omit NSEnumerator interface

@end
