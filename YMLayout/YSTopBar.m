//
//  YSTopBar.m
//  ImageUtility
//
//  Created by szhang on 15/4/1.
//  Copyright (c) 2015年 newyunmall. All rights reserved.
//

#import "YSTopBar.h"
#import "SDiPhoneVersion.h"
#import "YSLabel.h"
#import "SDiPhoneVersion.h"
#define ICONHEIGHT 44
#define ICONWIDTH 44
#define IPHONE6ICONHEIGHT 66
#define IPHONE6ICONWIDTH 66
#define TOPBARLINEHEIGHT 1
#define RGBCOLOR(r,g,b) ([UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1])
#define RGBACOLOR(r,g,b,a) ([UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f \
alpha:(a)])
@interface YSTopBar()
{
    UIView *leftConContainerView;
    UIView *rightConContainerView;
    UIView *lineView;
    UIView *centerView;
    YSLabel *titleLabel;
    UIImageView *titleImageView;
}
@end
@implementation YSTopBar
@synthesize backgroundColor,title;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)layoutSubviews
{
    if ([SDiPhoneVersion deviceVersion] == iPhone6Plus) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, [UIScreen mainScreen].bounds.size.width, IPHONE6ICONHEIGHT);
        leftConContainerView.frame = CGRectMake(0, 0, IPHONE6ICONWIDTH, IPHONE6ICONHEIGHT);
        rightConContainerView.frame = CGRectMake(self.frame.size.width-IPHONE6ICONWIDTH, 0, IPHONE6ICONWIDTH, IPHONE6ICONHEIGHT);
    }else{
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, [UIScreen mainScreen].bounds.size.width, ICONHEIGHT);
        leftConContainerView.frame = CGRectMake(0, 0, ICONWIDTH, ICONHEIGHT);
        rightConContainerView.frame = CGRectMake(self.frame.size.width-ICONWIDTH, 0, ICONWIDTH, ICONHEIGHT);
    }
    
}



-(id)init
{
    self = [super init];
    if (self) {
        if ([SDiPhoneVersion deviceVersion] == iPhone6Plus) {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, [UIScreen mainScreen].bounds.size.width, IPHONE6ICONHEIGHT);

            leftConContainerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, IPHONE6ICONWIDTH, IPHONE6ICONHEIGHT)];
            rightConContainerView = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width-IPHONE6ICONWIDTH, 0, IPHONE6ICONWIDTH, IPHONE6ICONHEIGHT)];
            CGFloat centerViewWidth = self.frame.size.width/2;
            centerView = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width, 0, centerViewWidth, IPHONE6ICONHEIGHT)];
        }else{
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, [UIScreen mainScreen].bounds.size.width, ICONHEIGHT);
            leftConContainerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ICONWIDTH, ICONHEIGHT)];
            rightConContainerView = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width-ICONWIDTH, 0, ICONWIDTH, ICONHEIGHT)];
            CGFloat centerViewWidth = self.frame.size.width/2;
            centerView = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width, 0, centerViewWidth, ICONHEIGHT)];
        }
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:leftConContainerView];
        [self addSubview:rightConContainerView];
        return self;
    }
    return nil;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        if ([SDiPhoneVersion deviceVersion] == iPhone6Plus) {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, [UIScreen mainScreen].bounds.size.width,IPHONE6ICONHEIGHT);
            leftConContainerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, IPHONE6ICONWIDTH, IPHONE6ICONHEIGHT)];
            rightConContainerView = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width-IPHONE6ICONWIDTH, 0, IPHONE6ICONWIDTH, IPHONE6ICONHEIGHT)];
        }else{
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, [UIScreen mainScreen].bounds.size.width, ICONHEIGHT);
            leftConContainerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ICONWIDTH, ICONHEIGHT)];
            rightConContainerView = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width-ICONWIDTH, 0, ICONWIDTH, ICONHEIGHT)];
        }
        [self addSubview:leftConContainerView];
        [self addSubview:rightConContainerView];
        return self;
    }
    return nil;
}

-(void)setBackgroundColor:(UIColor *)backgroundColor
{
    if ([backgroundColor isEqual:[UIColor whiteColor]]) {
        //如果是白色背景加一条细线
        if (!lineView) {
            lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-TOPBARLINEHEIGHT, self.frame.size.width, TOPBARLINEHEIGHT)];
            lineView.backgroundColor = RGBCOLOR(204, 204, 204);
            [self addSubview:lineView];
        }
    }else{
        if (lineView ) {
            [lineView removeFromSuperview];
        }
    }
    [super setBackgroundColor:backgroundColor];
}


-(id)initWithTopBarStyle:(TopBarStyle)style lefrBarItem:(YSButton *)lefrBarItem rightBarItem:(YSButton *)rightBarItem title:(NSString *)title titleImage:(UIImage *)titleImage
{
    self = [self init];
    [leftConContainerView addSubview:lefrBarItem];
    [rightConContainerView addSubview:rightBarItem];
    if (title) {
        [self setTitle:title];
    }
    if(titleImage)
    {
        [self setTitleImage:titleImage];
    }
    return self;
}

-(void)setTitle:(NSString *)title
{
    if (!titleLabel) {
        UIFont *font ;
        if ([SDiPhoneVersion deviceVersion] == iPhone6Plus) {
            font = [UIFont boldSystemFontOfSize:27];
        }else{
            font = [UIFont boldSystemFontOfSize:18];
        }
        titleLabel = [YSLabel createYSLabelWithFontProperty:font textColor:[UIColor blackColor] text:title];
        CGPoint point = CGPointMake(centerView.frame.size.width/2-titleLabel.frame.size.width/2, centerView.frame.size.height/2-titleLabel.frame.size.height/2);
        titleLabel.frame = CGRectMake(point.x, point.y, CGRectGetWidth(titleLabel.frame), CGRectGetHeight(titleLabel.frame));
        [centerView addSubview:titleLabel];
    }
}

-(void)setTitleImage:(UIImage *)titleImage
{
    
    if (!titleImageView) {
        titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, titleImage.size.width, titleImage.size.height)];
        //居中显示
    }
    CGRect frame = titleImageView.frame;
    CGFloat x = centerView.frame.size.width/2 - titleImageView.frame.size.width/2;
    CGFloat y = centerView.frame.size.height/2 - titleImageView.frame.size.height/2;
    frame.origin = CGPointMake(x, y);
    titleImageView.frame = frame;
    [centerView addSubview:titleImageView];
    
}

@end
