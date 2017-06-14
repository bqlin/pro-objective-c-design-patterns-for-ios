//
//  CanvasViewController.h
//  TouchPainter
//
//  Created by LinBq on 2017/6/5.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scribble.h"
#import "CanvasView.h"
#import "CanvasViewGenerator.h"
#import "CommandBarButton.h"
#import "NSMutableArray+Stack.h"

@interface CanvasViewController : UIViewController

//@property (nonatomic, strong) CanvasView *canvasView;
@property (weak, nonatomic) IBOutlet CanvasView *canvasView;
@property (nonatomic, strong) Scribble *scribble;
@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, assign) CGFloat strokeSize;

- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator;

- (IBAction)onBarButtonHit:(id)sender;
// Save, 
- (IBAction)onCustomBarButtonHit:(CommandBarButton *)sender;

- (NSInvocation *)drawScribbleInvocation;
- (NSInvocation *)undrawScribbleInvocation;

- (void)executeInvocation:(NSInvocation *)invocation withUndoInvocation:(NSInvocation *)undoInvocation;
- (void)unexecuteInvocation:(NSInvocation *)invocation withRedoInvocation:(NSInvocation *)redoInvocation;

@end
