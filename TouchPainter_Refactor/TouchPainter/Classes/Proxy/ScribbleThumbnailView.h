//
//  ScribbleThumbnailView.h
//  TouchPainter
//
//  Created by LinBq on 2017/6/7.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "ScribbleSource.h"

@interface ScribbleThumbnailView : UIView<ScribbleSource>

@property (nonatomic, strong, readonly) UIImage *image;
@property (nonatomic, strong, readonly) Scribble *scribble;
@property (nonatomic, copy) NSString *imagePath;
@property (nonatomic, copy) NSString *scribblePath;

@end
