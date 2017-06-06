//
//  Command.h
//  TouchPainter
//
//  Created by LinBq on 2017/6/5.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Command : NSObject

@property (nonatomic, strong) NSDictionary *userInfo;

- (void)execute;
- (void)undo;

@end
