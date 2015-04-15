//
//  YSButton.h
//  ImageUtility
//
//  Created by newyunmall on 15/4/1.
//  Copyright (c) 2015年 newyunmall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSButton : UIButton

+(YSButton *)createButtonWithImage:(UIImage *)image highLightImage:(UIImage *)highLightImage frame:(CGRect)frame;

+(YSButton *)createButtonWithTitle:(NSString *)title highLightTitle:(NSString *)highLightTitle frame:(CGRect)frame titleColor:(UIColor *)titleColor highLightTitleColor:(UIColor *)highLightTitleColor;


@end
