//
//  Scribble.h
//  TouchPainter
//
//  Created by LinBq on 2017/6/6.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"
#import "ScribbleMemento.h"

static NSString * const MarkKey = @"mark";

@interface Scribble : NSObject

// 通过方法操作 Mark 对象，并在内部手动发送 KVO 通知
// methods for Mark management
- (void)addMark:(id<Mark>)mark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark;
- (void)removeMark:(id<Mark>)mark;

// methods for memento
- (instancetype)initWithMemento:(ScribbleMemento *)memento;
+ (instancetype)scribbleWithMemento:(ScribbleMemento *)memento;
- (ScribbleMemento *)scribbleMemento;
- (ScribbleMemento *)scribbleMementoWithCompleteSnapshot:(BOOL)hasCompleteSnapshot;
- (void)attachStateFromMemento:(ScribbleMemento *)memento;

@end
