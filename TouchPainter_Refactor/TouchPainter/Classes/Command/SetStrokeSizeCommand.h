//
//  SetStrokeSizeCommand.h
//  TouchPainter
//
//  Created by LinBq on 2017/6/13.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Command.h"

@class SetStrokeSizeCommand;

@protocol SetStrokeSizeCommandDelegate <NSObject>

@optional
- (void)command:(SetStrokeSizeCommand *)command didRequestForStrokeSize:(CGFloat *)size;

@end

@interface SetStrokeSizeCommand : Command

@property (nonatomic, weak) IBOutlet id<SetStrokeSizeCommandDelegate> delegate;

@end
