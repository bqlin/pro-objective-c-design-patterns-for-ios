//
//  ClothCanvasView.m
//  TouchPainter
//
//  Created by Bq Lin on 2018/4/22.
//  Copyright © 2018年 LinBq. All rights reserved.
//

#import "ClothCanvasView.h"

@implementation ClothCanvasView

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		// Add a cloth image view on top as the canvas background
		UIImage *backgroundImage = [UIImage imageNamed:@"cloth"];
		UIImageView *backgroundView = [[UIImageView alloc] initWithImage:backgroundImage];
		[self addSubview:backgroundView];
	}
	return self;
}

// implementation for other behaviors

@end
