//
//  ScribbleThumbnailCell.m
//  TouchPainter
//
//  Created by LinBq on 2017/6/13.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "ScribbleThumbnailCell.h"

@implementation ScribbleThumbnailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)awakeFromNib {
	[super awakeFromNib];
    // Initialization code
}

+ (NSInteger)numberOfPlaceHolders {
    return 3;
}

- (void)addThumbnailView:(UIView *)thumbnailView atIndex:(NSInteger)index {
    if (index == 0) {
        [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    if (index < [self.class numberOfPlaceHolders]) {
        CGFloat x = index * 90 + (index + 1) * 12;
        CGFloat y = 10;
        CGFloat width = 90;
        CGFloat height = 130;
        
        thumbnailView.frame = CGRectMake(x, y, width, height);
        [self.contentView addSubview:thumbnailView];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
