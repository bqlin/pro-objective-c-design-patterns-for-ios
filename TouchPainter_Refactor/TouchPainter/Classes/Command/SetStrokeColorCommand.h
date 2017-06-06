//
//  SetStrokeColorCommand.h
//  TouchPainter
//
//  Created by LinBq on 2017/6/5.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Command.h"

typedef void (^RGBValuesProvider)(CGFloat *red, CGFloat *green, CGFloat *blue);
typedef void (^PostColorUpdateProvider)(UIColor *color);

@class SetStrokeColorCommand;

@protocol SetStrokeColorCommandDelegate

- (void)command:(SetStrokeColorCommand *)command didRequestColorComponentsForRed:(CGFloat*)red green:(CGFloat*)green blue:(CGFloat*)blue;

- (void)command:(SetStrokeColorCommand *)command didFinishColorUpdateWithColor:(UIColor *)color;

@end

@interface SetStrokeColorCommand : Command

@property (nonatomic, weak) IBOutlet id<SetStrokeColorCommandDelegate> delegate;
@property (nonatomic, copy) RGBValuesProvider RGBValuesProvider;
@property (nonatomic, copy) PostColorUpdateProvider postColorUpdateProvider;

- (void)execute;

@end
