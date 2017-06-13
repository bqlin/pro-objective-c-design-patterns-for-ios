//
//  OpenScribbleCommand.h
//  TouchPainter
//
//  Created by LinBq on 2017/6/13.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "Command.h"
#import "ScribbleSource.h"

@interface OpenScribbleCommand : Command

@property (nonatomic, strong) id<ScribbleSource> scribbleSource;

- (instancetype)initWithScribbleSource:(id<ScribbleSource>)scribbleSource;
- (void)execute;

@end
