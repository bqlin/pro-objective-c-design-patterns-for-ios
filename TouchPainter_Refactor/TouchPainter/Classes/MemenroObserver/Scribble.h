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
