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

@interface PaletteViewController : UIViewController <SetStrokeColorCommandDelegate>

// slider event handler
- (IBAction)onCommandSliderValueChanged:(CommandSlider *)slider;

@end
