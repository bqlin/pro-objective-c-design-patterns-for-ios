//
//  ScribbleSource.h
//  TouchPainter
//
//  Created by LinBq on 2017/6/7.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scribble.h"

@protocol ScribbleSource <NSObject>

- (Scribble *)scribble;

@end
