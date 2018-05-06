//
//  PaletteViewController.h
//  TouchPainter
//
//  Created by LinBq on 2017/6/5.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommandBarButton.h"
#import "CommandSlider.h"
#import "SetStrokeColorCommand.h"
#import "SetStrokeSizeCommand.h"

/**
 调色视图控制器
 */
@interface PaletteViewController : UIViewController <SetStrokeColorCommandDelegate, SetStrokeSizeCommandDelegate>

// slider event handler
- (IBAction)onCommandSliderValueChanged:(CommandSlider *)slider;

@end
