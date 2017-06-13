//
//  ScribbleThumbnailCell.h
//  TouchPainter
//
//  Created by LinBq on 2017/6/13.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScribbleThumbnailView.h"

@interface ScribbleThumbnailCell : UITableViewCell

+ (NSInteger)numberOfPlaceHolders;
- (void)addThumbnailView:(UIView *)thumbnailView atIndex:(NSInteger)index;

@end
