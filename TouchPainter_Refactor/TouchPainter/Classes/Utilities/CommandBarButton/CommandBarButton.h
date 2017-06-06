//
//  CommandBarButton.h
//  TouchPainter
//
//  Created by LinBq on 2017/6/5.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Command.h"

@interface CommandBarButton : UIBarButtonItem

@property (nonatomic, strong) IBOutlet Command *command;

@end
