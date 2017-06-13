//
//  ScribbleManager.h
//  TouchPainter
//
//  Created by LinBq on 2017/6/6.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Scribble.h"
#import "ScribbleThumbnailViewImageProxy.h"

@interface ScribbleManager : NSObject

- (void)saveScribble:(Scribble *)scribble thumbnail:(UIImage *)image;
- (NSInteger)numberOfScribbles;
- (Scribble *)scribbleAtIndex:(NSInteger)index;
- (UIView *)scribbleThumbnailViewAtIndex:(NSInteger)index;

@end
