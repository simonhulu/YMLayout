//
//  YSTopBar.h
//  ImageUtility
//
//  Created by szhang on 15/4/1.
//  Copyright (c) 2015年 newyunmall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSButton.h"
typedef NS_ENUM(NSInteger, TopBarStyle)
{
    TopBarNormalStyle,
    TopBarURLStyle,
};
@interface YSTopBar : UIView
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)UIImage *titleImage;
@property(nonatomic,weak)UIColor *backgroundColor;
@end
