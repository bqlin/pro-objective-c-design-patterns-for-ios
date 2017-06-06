//
//  PrototypeController.m
//  TouchPainter
//
//  Created by LinBq on 2017/6/6.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "PrototypeController.h"
#import "Mark.h"
#import "CanvasView.h"

@interface PrototypeController ()

@end

@implementation PrototypeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // The following code snippets are
    // for illustration purposes in
    // the book only and not part of the
    // app
    id<Mark> selectedMark;
    NSMutableArray *templateArray = [[NSMutableArray alloc] initWithCapacity:1];
    id<Mark> patternTemplate = selectedMark.copy;
    
    // save the patternTemplate in
    // a data structure so it can be
    // used later
    [templateArray addObject:patternTemplate];
    
    CanvasView *canvasView;
    id<Mark> currentMark;
    int patternIndex;
    
    id<Mark> patternClone = templateArray[patternIndex];
    [currentMark addMark:patternClone];
    canvasView.mark = currentMark;
    [canvasView setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
