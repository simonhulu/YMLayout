//
//  YSButton.m
//  ImageUtility
//
//  Created by newyunmall on 15/4/1.
//  Copyright (c) 2015年 newyunmall. All rights reserved.
//

#import "YSButton.h"

@implementation YSButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(YSButton *)createButtonWithImage:(UIImage *)image highLightImage:(UIImage *)highLightImage frame:(CGRect)frame
{
    YSButton *button = [YSButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highLightImage forState:UIControlStateHighlighted];
    return button;
}

+(YSButton *)createButtonWithTitle:(NSString *)title highLightTitle:(NSString *)highLightTitle frame:(CGRect)frame titleColor:(UIColor *)titleColor highLightTitleColor:(UIColor *)highLightTitleColor
{
    YSButton *button = [YSButton buttonWithType:UIButtonTypeSystem];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:highLightTitle forState:UIControlStateHighlighted];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setTitleColor:highLightTitleColor forState:UIControlStateHighlighted];
    return button;
}

+(YSButton *)createButtonWithTitleOnImage:(NSString *)title highLightTitle:(NSString *)highLightTitle frame:(CGRect)frame titleColor:(UIColor *)titleColor highLightTitleColor:(UIColor *)highLightTitleColor image:(UIImage *)image highLightImage:(UIImage *)highLightImage
{
    YSButton *button = [YSButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:highLightTitle forState:UIControlStateHighlighted];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setTitleColor:highLightTitleColor forState:UIControlStateHighlighted];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highLightImage forState:UIControlStateHighlighted];
    return button;
}

@end
