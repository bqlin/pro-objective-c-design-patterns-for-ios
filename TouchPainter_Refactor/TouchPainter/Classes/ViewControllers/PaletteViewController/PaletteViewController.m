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
	
//	// initialize the RGB sliders with
//	// a StrokeColorCommand
//	SetStrokeColorCommand *colorCommand = (SetStrokeColorCommand *)_redSlider.command;
//	// set each color component provider
//	// to the color command
//	colorCommand.RGBValuesProvider = ^(CGFloat *red, CGFloat *green, CGFloat *blue) {
//		*red = _redSlider.value;
//		*blue = _blueSlider.value;
//		*green = _greenSlider.value;
//	};
//	// set a post-update provider to the command
//	// for any callback after a new color is set
//	colorCommand.postColorUpdateProvider = ^(UIColor *color) {
//		_paletteView.backgroundColor = color;
//	};
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
	
	// save the values of the sliders
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	[userDefaults setFloat:_redSlider.value forKey:RedKey];
	[userDefaults setFloat:_greenSlider.value forKey:GreenKey];
	[userDefaults setFloat:_blueSlider.value forKey:BlueKey];
	[userDefaults setFloat:_sizeSlider.value forKey:SizeKey];
}

- (void)setupUI {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:[CoordinatingController sharedInstance] action:@selector(requestViewChangeByObject:)];
	
	// restore the original values of the sliders
	// and the color of the small palette view
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	CGFloat redValue = [userDefaults floatForKey:RedKey];
	CGFloat greenValue = [userDefaults floatForKey:GreenKey];
	CGFloat blueValue = [userDefaults floatForKey:BlueKey];
	CGFloat sizeValue = [userDefaults floatForKey:SizeKey];
	
	_redSlider.value = redValue;
	_greenSlider.value = greenValue;
	_blueSlider.value = blueValue;
	_sizeSlider.value = sizeValue;
	
	UIColor *color = [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0];
	_paletteView.backgroundColor = color;
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
