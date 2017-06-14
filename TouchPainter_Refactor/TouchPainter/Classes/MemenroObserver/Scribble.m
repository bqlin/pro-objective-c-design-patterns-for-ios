//
//  Scribble.m
//  TouchPainter
//
//  Created by LinBq on 2017/6/6.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "Scribble.h"
#import "Stroke.h"

@interface Scribble ()
{
    id<Mark> _incrementalMark;
}

// parentMark
@property (nonatomic, strong) id<Mark> mark;

@end

@implementation Scribble

- (instancetype)init {
    if (self = [super init]) {
        // the parent should be a composite
        // object (i.e. Stroke)
        _mark = [[Stroke alloc] init];
    }
    return self;
}

#pragma mark -
#pragma mark Methods for Mark management

- (void)addMark:(id<Mark>)mark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark {
    // manual KVO invocation
    [self willChangeValueForKey:MarkKey];
    
    // if the flag is set to YES
    // then add this aMark to the
    // *PREVIOUS*Mark as part of an
    // aggregate.
    // Based on our design, it's supposed
    // to be the last child of the main
    // parent
    if (shouldAddToPreviousMark) {
        [[_mark lastChild] addMark:mark];
    } else {
        [_mark addMark:mark];
        _incrementalMark = mark;
    }
    
    // manual KVO invocation
    [self didChangeValueForKey:MarkKey];
}

- (void)removeMark:(id<Mark>)mark {
    // do nothing if aMark is the parent
    if (mark == _mark) return;
    
    // manual KVO invocation
    [self willChangeValueForKey:MarkKey];
    
    [_mark removeMark:mark];
    
    // we don't need to keep the
    // incrementalMark_ reference
    // as it's just removed in the parent
    if (mark == _incrementalMark) {
        _incrementalMark = nil;
    }
    
    // manual KVO invocation
    [self didChangeValueForKey:MarkKey];
}

#pragma mark -
#pragma mark Methods for memento

- (instancetype)initWithMemento:(ScribbleMemento *)memento {
    if (self = [super init]) {
        if (memento.hasCompleteSnapshot) {
            self.mark = memento.mark;
        } else {
            // if the memento contains only
            // incremental mark, then we need to
            // create a parent Stroke object to
            // hold it
            _mark = [[Stroke alloc] init];
            [self attachStateFromMemento:memento];
        }
    }
    return self;
}

- (void)attachStateFromMemento:(ScribbleMemento *)memento {
    // attach any mark from a memento object
    // to the main parent
    [self addMark:memento.mark shouldAddToPreviousMark:NO];
}

- (ScribbleMemento *)scribbleMementoWithCompleteSnapshot:(BOOL)hasCompleteSnapshot {
    id<Mark> mementoMark = _incrementalMark;
    
    // if the resulting memento asks
    // for a complete snapshot, then
    // set it with _mark
    // but if incrementalMark_
    // is nil then we can't do anything
    // but bail out
    if (hasCompleteSnapshot) {
        mementoMark = _mark;
    } else if (mementoMark == nil) {
        return nil;
    }
    
    ScribbleMemento *memento = [[ScribbleMemento alloc] initWithMark:mementoMark];
    memento.hasCompleteSnapshot = hasCompleteSnapshot;
    
    return memento;
}

- (ScribbleMemento *)scribbleMemento {
    return [self scribbleMementoWithCompleteSnapshot:YES];
}

+ (instancetype)scribbleWithMemento:(ScribbleMemento *)memento {
    Scribble *scribble = [[Scribble alloc] initWithMemento:memento];
    return scribble;
}
@end
