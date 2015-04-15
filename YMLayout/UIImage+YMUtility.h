//
//  UIImage+YMUtility.h
//  ImageUtility
//
//  Created by newyunmall on 15/3/27.
//  Copyright (c) 2015年 newyunmall. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 Types of supported crop modes.
 */

@interface UIImage (YMUtility)
-(UIImage *)imageWithColor:(UIColor *)color rect:(CGRect)rect;
-(UIImage *)imageByCorp:(CGRect)cropRect;
-(UIImage *)scaleImageKeepRatio:(CGFloat)scaleSize;
-(UIImage *)compressImage:(CGFloat)qulity;
-(UIImage *)scaleCorpedImage:(CGRect)cropRect scaleSize:(CGFloat)scaleSize;
-(UIImage*)circularScaleAndCropImage:(CGRect)frame;
-(UIImage*)cropImageByCircleCustomShap:(UIBezierPath*)path frame:(CGRect)frame;
@end
