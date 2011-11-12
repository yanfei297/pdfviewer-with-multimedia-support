//
//  UITools.h
//  MultimediaPdfViewer
//
//  Created by Sayan Chatterjee on 12/11/11.
//  Copyright 2011 sayan1886@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UITools : NSObject

+ (UILabel *)createLabelWithFrame:(CGRect)frame LabelText:(NSString *)text;

+ (UIButton *)createButtonWithFrame:(CGRect)frame ButtonType:(UIButtonType)type buttonText:(NSString *)text target:(id)target action:(SEL)selector;

+ (UIButton *)createButtonWithFrame:(CGRect)frame ButtonType:(UIButtonType)type buttonText:(NSString *)text target:(id)target action:(SEL)selector hasTag:(int)tag;

+ (UIButton *)createButtonWithFrame:(CGRect)frame ButtonType:(UIButtonType)type buttonText:(NSString *)text target:(id)target action:(SEL)selector normalStateImage:(UIImage *)normalImage highlightedStateImage:(UIImage *)highlightedImage;

+ (UIButton *)createButtonWithFrame:(CGRect)frame ButtonType:(UIButtonType)type buttonText:(NSString *)text target:(id)target action:(SEL)selector normalStateImage:(UIImage *)normalImage highlightedStateImage:(UIImage *)highlightedImage hasTag:(int)tag;

+ (UITextField *)createTextFieldWithFrame:(CGRect)frame text:(NSString *)text placeHolder:(NSString *)placeHolder keyboardType:(UIKeyboardType)keyboardType;

+ (UISegmentedControl *)createSegmentedControlWithFrame:(CGRect)frame segment:(NSArray *)segments seletedItem:(int)index style:(UISegmentedControlStyle)style target:(id)target action:(SEL)selector;

+ (UIImageView *)createImageViewWithFrame:(CGRect)frame image:(UIImage *)image;

+ (NSString *)getStringMonth:(int)month;

@end
