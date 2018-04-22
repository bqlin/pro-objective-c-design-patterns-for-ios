//
//  PaperCanvasView.m
//  TouchPainter
//
//  Created by Bq Lin on 2018/4/22.
//  Copyright © 2018年 LinBq. All rights reserved.
//

#import "PaperCanvasView.h"

@implementation PaperCanvasView

- (instancetype)initWithFrame:(CGRect)frame {
	// Add a paper image view on top as the canvas background
	if (self = [super initWithFrame:frame]) {
		UIImage *backgroundImage = [UIImage imageNamed:@"paper"];
		UIImageView *backgroundView = [[UIImageView alloc] initWithImage:backgroundImage];
		[self addSubview:backgroundView];
	}
	return self;
}

// implementation for other behaviors

@end
