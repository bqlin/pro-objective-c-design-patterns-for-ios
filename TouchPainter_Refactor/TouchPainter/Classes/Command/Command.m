//
//  Command.m
//  TouchPainter
//
//  Created by LinBq on 2017/6/5.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "Command.h"

@implementation Command

- (void)execute {
    // should throw an exception.
}

- (void)undo {
    // do nothing
    // subclasses need to override this
    // method to perform actual undo.
}

@end
