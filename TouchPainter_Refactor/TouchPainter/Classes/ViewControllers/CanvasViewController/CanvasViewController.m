//
//  CanvasViewController.m
//  TouchPainter
//
//  Created by LinBq on 2017/6/5.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "CanvasViewController.h"
#import "Dot.h"
#import "Stroke.h"

static NSString * const RedKey = @"red";
static NSString * const GreenKey = @"green";
static NSString * const BlueKey = @"blue";
static NSString * const SizeKey = @"size";

@interface CanvasViewController ()
{
    CGPoint _startPoint;
}

@end

@implementation CanvasViewController

// hook up everything with a new Scribble instance
- (void)setScribble:(Scribble *)scribble {
    if (_scribble != scribble) {
        _scribble = scribble;
        
        // add itself to the scribble as
        // an observer for any changes to
        // its internal state - mark
        [_scribble addObserver:self forKeyPath:MarkKey options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // initialize a Scribble model
    Scribble *scribble = [[Scribble alloc] init];
    self.scribble = scribble;
    
    // setup default stroke color and size
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    CGFloat redValue = [userDefaults floatForKey:RedKey];
    CGFloat greenValue = [userDefaults floatForKey:GreenKey];
    CGFloat blueValue = [userDefaults floatForKey:BlueKey];
    CGFloat sizeValue = [userDefaults floatForKey:SizeKey];
    
    self.strokeSize = sizeValue;
    self.strokeColor = [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // Get a default canvas view
    // with the factory method of
    // the CanvasViewGenerator
    //CanvasViewGenerator *defaultGenerator = [[CanvasViewGenerator alloc] init];
    //[self loadCanvasViewWithGenerator:defaultGenerator];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark -
#pragma mark Stroke color and size accessor methods

- (void)setStrokeSize:(CGFloat)strokeSize {
    // enforce the smallest size
    // allowed
    if (strokeSize < 5.0) {
        _strokeSize = 5.0;
    } else {
        _strokeSize = strokeSize;
    }
}

#pragma mark -
#pragma mark Toolbar button hit method

- (void)onBarButtonHit:(id)sender {
    UIBarButtonItem *barButton = sender;
    switch (barButton.tag) {
        case 4:{
            [self.undoManager undo];
        }break;
        case 5:{
            [self.undoManager redo];
        }break;
        default:{}break;
    }
}

- (void)onCustomBarButtonHit:(CommandBarButton *)sender {
    [sender.command execute];
}

#pragma mark -
#pragma mark Loading a CanvasView from a CanvasViewGenerator

- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator {
    [_canvasView removeFromSuperview];
    //CGRect frame = CGRectMake(0, 0, 320, 436);
    CGRect frame = self.canvasView.frame;
    CanvasView *canvasView = [generator canvasViewWithFrame:frame];
    self.canvasView = canvasView;
    self.canvasView.backgroundColor = [UIColor redColor];
    //NSInteger viewIndex = self.view.subviews.count - 1;
    //[self.view insertSubview:self.canvasView atIndex:viewIndex];
    [self.view addSubview:self.canvasView];
}

#pragma mark -
#pragma mark Touch Event Handlers

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _startPoint = [touches.anyObject locationInView:self.canvasView];
    NSLog(@"%s", __FUNCTION__);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint lastPoint = [touches.anyObject previousLocationInView:self.canvasView];
    
    // add a new stroke to scribble
    // if this is indeed a drag from
    // a finger
    if (CGPointEqualToPoint(lastPoint, _startPoint)) {
        id<Mark> newStroke = [[Stroke alloc] init];
        [newStroke setColor:self.strokeColor];
        [newStroke setSize:self.strokeSize];
        
        //[scribble_ addMark:newStroke shouldAddToPreviousMark:NO];
        
        // retrieve a new NSInvocation for drawing and
        // set new arguments for the draw command
        NSInvocation *drawInvocation = [self drawScribbleInvocation];
        [drawInvocation setArgument:&newStroke atIndex:2];
        
        // retrieve a new NSInvocation for undrawing and
        // set a new argument for the undraw command
        NSInvocation *undrawInvocation = [self undrawScribbleInvocation];
        [undrawInvocation setArgument:&newStroke atIndex:2];
        
        // execute the draw command with the undraw command
        [self executeInvocation:drawInvocation withUndoInvocation:undrawInvocation];
    }
    
    // add the current touch as another vertex to the
    // temp stroke
    CGPoint thisPoint = [touches.anyObject locationInView:self.canvasView];
    Vertex *vertex = [[Vertex alloc] initWithLocation:thisPoint];
    
    // we don't need to undo every vertex
    // so we are keeping this
    [self.scribble addMark:vertex shouldAddToPreviousMark:YES];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint lastPoint = [touches.anyObject previousLocationInView:self.canvasView];
    CGPoint thisPoint = [touches.anyObject locationInView:self.canvasView];
    
    // if the touch never moves (stays at the same spot until lifted now)
    // just add a dot to an existing stroke composite
    // otherwise add it to the temp stroke as the last vertex
    if (CGPointEqualToPoint(lastPoint, thisPoint)) {
        Dot *singleDot = [[Dot alloc] initWithLocation:thisPoint];
        singleDot.color = self.strokeColor;
        singleDot.size = self.strokeSize;
        
        //[scribble_ addMark:singleDot shouldAddToPreviousMark:NO];
        
        // retrieve a new NSInvocation for drawing and
        // set new arguments for the draw command
        NSInvocation *drawInvocation = [self drawScribbleInvocation];
        [drawInvocation setArgument:&singleDot atIndex:2];
        
        // retrieve a new NSInvocation for undrawing and
        // set a new argument for the undraw command
        NSInvocation *undrawInvocation = [self undrawScribbleInvocation];
        [undrawInvocation setArgument:&singleDot atIndex:2];
        
        // execute the draw command with the undraw command
        [self executeInvocation:drawInvocation withUndoInvocation:undrawInvocation];
    }
    
    // reset the start point here
    _startPoint = CGPointZero;
    
    // if this is the last point of stroke
    // don't bother to draw it as the user
    // won't tell the difference
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // reset the start point here
    _startPoint = CGPointZero;
}

#pragma mark -
#pragma mark Scribble observer method

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([object isKindOfClass:[Scribble class]] && [keyPath isEqualToString:MarkKey]) {
        id<Mark> mark = [change objectForKey:NSKeyValueChangeNewKey];
        self.canvasView.mark = mark;
        [self.canvasView setNeedsDisplay];
    }
}

#pragma mark -
#pragma mark Draw Scribble Invocation Generation Methods

- (NSInvocation *)drawScribbleInvocation {
    NSMethodSignature *executeMethodSignature = [_scribble methodSignatureForSelector:@selector(addMark:shouldAddToPreviousMark:)];
    NSInvocation *drawInvocation =[NSInvocation invocationWithMethodSignature:executeMethodSignature];
    
    drawInvocation.target = self.scribble;
    drawInvocation.selector = @selector(addMark:shouldAddToPreviousMark:);
    BOOL attachToPreviousMark = NO;
    [drawInvocation setArgument:&attachToPreviousMark atIndex:3];
    
    return drawInvocation;
}

- (NSInvocation *)undrawScribbleInvocation {
    NSMethodSignature *unexecuteMethodSignature = [self.scribble methodSignatureForSelector:@selector(removeMark:)];
    NSInvocation *undrawInvocation = [NSInvocation invocationWithMethodSignature:unexecuteMethodSignature];
    undrawInvocation.target = self.scribble;
    undrawInvocation.selector = @selector(removeMark:);
    
    return undrawInvocation;
}

#pragma mark Draw Scribble Command Methods

- (void)executeInvocation:(NSInvocation *)invocation withUndoInvocation:(NSInvocation *)undoInvocation {
    [invocation retainArguments];
    
    [[self.undoManager prepareWithInvocationTarget:self] unexecuteInvocation:undoInvocation withRedoInvocation:invocation];
    
    [invocation invoke];
}

- (void)unexecuteInvocation:(NSInvocation *)invocation withRedoInvocation:(NSInvocation *)redoInvocation {
    [[self.undoManager prepareWithInvocationTarget:self] executeInvocation:redoInvocation withUndoInvocation:invocation];
    
    [invocation invoke];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
