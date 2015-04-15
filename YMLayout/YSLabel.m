//
//  YSLabel.m
//  ImageUtility
//
//  Created by newyunmall on 15/4/1.
//  Copyright (c) 2015年 newyunmall. All rights reserved.
//

#import "YSLabel.h"

@implementation YSLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
/**
*  根据字体相关属性创建YSLabel
*
*  @param font      字体
*  @param textColor 字体颜色
*  @param text      内容
*
*  @return 返回YSLabel
*/
+(YSLabel *)createYSLabelWithFontProperty:(UIFont *)font textColor:(UIColor *)textColor text:(NSString *)text
{
    YSLabel *label = [[YSLabel alloc]init];
    label.font = font;
    label.textColor = textColor;
    label.text = text;
    [label sizeToFit];
    return  label;
}

+(YSLabel *)createYSLabelWithFrame:(UIFont *)font textColor:(UIColor *)textColor text:(NSString *)text frame:(CGRect)frame alignment:(NSTextAlignment)alignment numberOfLines:(NSInteger)numberOfLines
{
    YSLabel *label = [[YSLabel alloc]initWithFrame:frame];
    label.font = font;
    label.textColor = textColor;
    label.text = text;
    label.textAlignment = alignment;
    label.numberOfLines = numberOfLines;
    return label;
}

@end
