//
//  WMTimePicker.h
//  WMTimePicker
//
//  Created by Antmanler on 10.08.13.
//  Copyright (c) 2013 withme365.com. All rights reserved.
//  Original from http://goo.gl/8sEvUW, modified by antmanler
//  Thanks to Marcus https://github.com/mwermuth for his wonderful work.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@protocol WMTimePickerDelegate;

@interface WMTimePicker : UIControl

@property (nonatomic, weak) id<WMTimePickerDelegate> delegate;

@property (nonatomic, copy)NSCalendar *calendar;
@property (nonatomic, strong)UIColor *fontColor;
@property (nonatomic, strong)UIFont  *font;
@property (nonatomic) NSDate* date;
@property (nonatomic) BOOL shouldUseShadows;

- (void)update;
- (void)setDate:(NSDate *)date animated:(BOOL)animated;
@end


@protocol WMTimePickerDelegate <NSObject>

@optional
- (UIView *)backgroundViewForDatePicker:(WMTimePicker*)picker;
- (UIColor *)backgroundColorForDatePicker:(WMTimePicker*)picker;

- (UIView *)datePicker:(WMTimePicker*)picker backgroundViewForComponent:(NSInteger)component;
- (UIColor *)datePicker:(WMTimePicker*)picker backgroundColorForComponent:(NSInteger)component;

- (UIView *)shadowViewForTimePicker:(WMTimePicker*)picker;

- (UIView *)overlayViewForDatePickerSelector:(WMTimePicker *)picker;
- (UIColor *)overlayColorForDatePickerSelector:(WMTimePicker *)picker;

- (UIView *)viewForDatePickerSelector:(WMTimePicker *)picker;
- (UIColor *)viewColorForDatePickerSelector:(WMTimePicker *)picker;

@end
