//
//  NSMutableArray+Stack.h
//  TouchPainter
//
//  Created by LinBq on 2017/6/5.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Stack)

- (void)push:(id)object;
- (id)pop;
- (void)dropBottom;

@end
