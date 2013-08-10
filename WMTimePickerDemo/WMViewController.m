//
//  WMViewController.m
//  WMTimePickerDemo
//
//  Created by Antmanler on 8/11/13.
//  Copyright (c) 2013 iwishow. All rights reserved.
//
#import "wmtimePicker.h"
#import "WMViewController.h"

@implementation UIColor(WMDemo)
+ (UIColor *)wmTopViewColor {
    return [UIColor colorWithRed:1.f green:1.f blue:1.f alpha:.25];
}

+ (UIColor*) wmViewBackgroundColor {
    UIImage *backgroundImg = nil;
    if ([UIScreen mainScreen].bounds.size.height == 568.f) {
        backgroundImg = [UIImage imageNamed:@"view_background-568h.png"];
    } else {
        backgroundImg = [UIImage imageNamed:@"view_background.png"];
    }
    
    return [UIColor colorWithPatternImage:backgroundImg];
}
@end

@interface WMViewController () <WMTimePickerDelegate>

@end

@implementation WMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor wmViewBackgroundColor];
    
    self.timePicker.delegate         = self;
    self.timePicker.fontColor        = [UIColor whiteColor];
    self.timePicker.font             = [UIFont fontWithName:@"HelveticaNeue-Light" size:19.f];
    self.timePicker.shouldUseShadows = YES;
    self.timePicker.date             = [NSDate date];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)timeChanged:(WMTimePicker *)sender {
    NSLog(@"%@", sender.date);
}

#pragma mark - WMTimePickerDelegate

- (UIColor *) backgroundColorForDatePicker:(WMTimePicker *)picker {
    return [UIColor clearColor];
}


- (UIColor *) datePicker:(WMTimePicker *)picker backgroundColorForComponent:(NSInteger)component {
    return [UIColor clearColor];
}

- (UIView *)viewForDatePickerSelector:(WMTimePicker *)picker {
    return [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"SettingTimePickerSelector"]];
}

- (UIView *)overlayViewForDatePickerSelector:(WMTimePicker *)picker {
    
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"SettingTimePickerOverlay"]];
    
    return imgView;
}

- (UIView *)shadowViewForTimePicker:(WMTimePicker *)picker {
    
    UIImage *img = nil;
    if ([UIScreen mainScreen].bounds.size.height == 568.f) {
        img = [UIImage imageNamed:@"SettingTimePickerOverlayShadow-568h"];
    } else {
        img = [UIImage imageNamed:@"SettingTimePickerOverlayShadow"];
    }
    
    return [[UIImageView alloc]initWithImage:img];
}


@end
