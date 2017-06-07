//
//  ScribbleThumbnailViewImageProxy.h
//  TouchPainter
//
//  Created by LinBq on 2017/6/7.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "ScribbleThumbnailView.h"
#import "Command.h"

@interface ScribbleThumbnailViewImageProxy : ScribbleThumbnailView

@property (nonatomic, strong, readonly) UIImage *image;
@property (nonatomic, strong, readonly) Scribble *scribble;

@property (nonatomic, strong) Command *touchCommand;

@end
