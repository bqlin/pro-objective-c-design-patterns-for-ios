//
//  ScribbleMemento.h
//  TouchPainter
//
//  Created by LinBq on 2017/6/6.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

@interface ScribbleMemento : NSObject

+ (instancetype)mementoWithData:(NSData *)data;
- (NSData *)data;

@end

@interface ScribbleMemento ()

@property (nonatomic, copy) id <Mark> mark;
@property (nonatomic, assign) BOOL hasCompleteSnapshot;

- (instancetype)initWithMark:(id<Mark>)mark;

@end
