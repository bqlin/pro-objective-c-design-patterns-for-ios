//
//  PaletteViewController.m
//  TouchPainter
//
//  Created by LinBq on 2017/6/5.
//  Copyright © 2017年 LinBq. All rights reserved.
//

#import "PaletteViewController.h"
#import "CoordinatingController.h"

@interface PaletteViewController ()
{
    __weak IBOutlet CommandSlider *_redSlider;
    __weak IBOutlet CommandSlider *_greenSlider;
    __weak IBOutlet CommandSlider *_blueSlider;
    __weak IBOutlet CommandSlider *_sizeSlider;
    __weak IBOutlet UIView *_paletteView;
}


@end

@implementation PaletteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupUI];
}

- (void)setupUI {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:[CoordinatingController sharedInstance] action:@selector(requestViewChangeByObject:)];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // block the touches to bottom view controller
    //NSLog(@"%s", __FUNCTION__);
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

#pragma mark -
#pragma mark Slider event handler

- (void)onCommandSliderValueChanged:(CommandSlider *)slider {
    [slider.command execute];
}

#pragma mark -
#pragma mark SetStrokeColorCommandDelegate methods

- (void)command:(SetStrokeColorCommand *)command didRequestColorComponentsForRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue {
    *red = _redSlider.value;
    *blue = _blueSlider.value;
    *green = _greenSlider.value;
}

- (void)command:(SetStrokeColorCommand *)command didFinishColorUpdateWithColor:(UIColor *)color {
    _paletteView.backgroundColor = color;
}

#pragma mark SetStrokeSizeCommandDelegate method

- (void)command:(SetStrokeSizeCommand *)command didRequestForStrokeSize:(CGFloat *)size {
    *size = _sizeSlider.value;
}

@end
