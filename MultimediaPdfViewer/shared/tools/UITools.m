//
//  UITools.m
//  MultimediaPdfViewer
//
//  Created by Sayan Chatterjee on 12/11/11.
//  Copyright 2011 sayan1886@gmail.com. All rights reserved.
//

#import "UITools.h"

@implementation UITools

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

+ (UILabel *)createLabelWithFrame:(CGRect)frame LabelText:(NSString *)text{
    UILabel *label = [[[UILabel alloc] initWithFrame:frame] autorelease];
    label.backgroundColor = [UIColor clearColor];
    label.text = text;
    label.textAlignment = UITextAlignmentLeft;
    label.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    label.font = [UIFont fontWithName:@"Helvetica" size:17.0f];
    return label;
}

+ (UIButton *)createButtonWithFrame:(CGRect)frame ButtonType:(UIButtonType)type buttonText:(NSString *)text target:(id)target action:(SEL)selector{
    UIButton *button = [UIButton buttonWithType:type];
    button.frame = frame;
//    button.titleLabel.text = text;
//    button.titleLabel.textAlignment = UITextAlignmentCenter;
//    button.titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    [button setTitle:text forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)createButtonWithFrame:(CGRect)frame ButtonType:(UIButtonType)type buttonText:(NSString *)text target:(id)target action:(SEL)selector hasTag:(int)tag {
    UIButton *button = [UIButton buttonWithType:type];
    button.frame = frame;
    button.tag = tag;
    //    button.titleLabel.text = text;
    //    button.titleLabel.textAlignment = UITextAlignmentCenter;
    //    button.titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    [button setTitle:text forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

+ (UIButton *)createButtonWithFrame:(CGRect)frame ButtonType:(UIButtonType)type buttonText:(NSString *)text target:(id)target action:(SEL)selector normalStateImage:(UIImage *)normalImage highlightedStateImage:(UIImage *)highlightedImage {
    UIButton *button = [UIButton buttonWithType:type];
    button.frame = frame;
    //    button.titleLabel.text = text;
    //    button.titleLabel.textAlignment = UITextAlignmentCenter;
    //    button.titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    [button setTitle:text forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button setImage:normalImage forState:UIControlStateNormal];
    if (highlightedImage) {
        [button setImage:highlightedImage forState:UIControlStateHighlighted];
    }
    return button;
}

+ (UIButton *)createButtonWithFrame:(CGRect)frame ButtonType:(UIButtonType)type buttonText:(NSString *)text target:(id)target action:(SEL)selector normalStateImage:(UIImage *)normalImage highlightedStateImage:(UIImage *)highlightedImage hasTag:(int)tag{
    UIButton *button = [UIButton buttonWithType:type];
    button.frame = frame;
    button.tag = tag;
    //    button.titleLabel.text = text;
    //    button.titleLabel.textAlignment = UITextAlignmentCenter;
    //    button.titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    [button setTitle:text forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button setImage:normalImage forState:UIControlStateNormal];
    if (highlightedImage) {
        [button setImage:highlightedImage forState:UIControlStateHighlighted];
    }
    return button;
}


+ (UITextField *)createTextFieldWithFrame:(CGRect)frame text:(NSString *)text placeHolder:(NSString *)placeHolder keyboardType:(UIKeyboardType)keyboardType {
    UITextField *textField = [[[UITextField alloc] initWithFrame:frame] autorelease];
    textField.text = text;
    textField.placeholder = placeHolder;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.textAlignment = UITextAlignmentLeft;
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.font = [UIFont fontWithName:@"Helvetica" size:17.0f];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    return textField;
}

+ (UISegmentedControl *)createSegmentedControlWithFrame:(CGRect)frame segment:(NSArray *)segments seletedItem:(int)index style:(UISegmentedControlStyle)style target:(id)target action:(SEL)selector{
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:segments];
    segmentedControl.frame = frame;
    segmentedControl.selectedSegmentIndex = index;
    segmentedControl.segmentedControlStyle = style;
    [segmentedControl addTarget:target action:selector forControlEvents:UIControlEventValueChanged];
    return [segmentedControl autorelease];
}

+ (UIImageView *)createImageViewWithFrame:(CGRect)frame image:(UIImage *)image{
    UIImageView *imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
    imageView.frame = frame;
    return imageView;
}

+ (NSString *)getStringMonth:(int)month{
    switch (month) {
        case 1:
            return @"Jan";
            break;
        case 2:
            return @"Feb";
            break;
        case 3:
            return @"Mar";;
            break;
        case 4:
            return @"Apr";;
            break;
        case 5:
            return @"May";
            break;
        case 6:
            return @"Jun";
            break;
        case 7:
            return @"Jul";
            break;
        case 8:
            return @"Aug";;
            break;
        case 9:
            return @"Sep";
            break;
        case 10:
            return @"Oct";
            break;
        case 11:
            return @"Nov";
            break;
        case 12:
            return @"Dec";
            break;
        default:
            return @"Jan";
            break;
    }
}


@end
