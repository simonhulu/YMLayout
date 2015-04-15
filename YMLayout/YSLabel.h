//
//  YSLabel.h
//  ImageUtility
//
//  Created by newyunmall on 15/4/1.
//  Copyright (c) 2015年 newyunmall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSLabel : UILabel
+(YSLabel *)createYSLabelWithFontProperty:(UIFont *)font textColor:(UIColor *)textColor text:(NSString *)text;
+(YSLabel *)createYSLabelWithFrame:(UIFont *)font textColor:(UIColor *)textColor text:(NSString *)text frame:(CGRect)frame alignment:(NSTextAlignment)alignment numberOfLines:(NSInteger)numberOfLines;
@end
