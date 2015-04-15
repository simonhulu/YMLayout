//
//  UIImage+YMUtility.m
//  ImageUtility
//
//  Created by szhang on 15/3/27.
//  Copyright (c) 2015年 newyunmall. All rights reserved.
//

#import "UIImage+YMUtility.h"
@interface UIImage()
- (void)addRoundedRectToPath:(CGRect)rect context:(CGContextRef)context ovalWidth:(CGFloat)ovalWidth ovalHeight:(CGFloat)ovalHeight;
@end
@implementation UIImage (YMUtility)
-(UIImage *)imageWithColor:(UIColor *)color rect:(CGRect)rect
{
    if (!color) {
        return nil;
    }
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 *  裁剪该图片
 *
 *  @param cropRect 裁剪的区域
 *
 *  @return 裁剪出来的UIImage
 */
-(UIImage *)imageByCorp:(CGRect)cropRect
{
    UIImageOrientation imageOrientation = self.imageOrientation;
    CGFloat imageScale = self.scale;
    cropRect = CGRectApplyAffineTransform(cropRect, CGAffineTransformMakeScale(imageScale, imageScale));
    //create an image using data contained within the specified rect
    CGImageRef croppedCGImage = CGImageCreateWithImageInRect(self.CGImage, cropRect);
    UIImage *croppedImage = [UIImage imageWithCGImage:croppedCGImage scale:imageScale orientation:imageOrientation];
    CGImageRelease(croppedCGImage);
    return croppedImage;
}

/**
 *  等比例缩放图片
 *
 *  @param image     待缩放的图片
 *  @param scaleSize 缩放比例
 *
 *  @return 缩放后图片
 */
-(UIImage *)scaleImageKeepRatio:(CGFloat)scaleSize
{

    UIGraphicsBeginImageContext(CGSizeMake(self.size.width*scaleSize, self.size.height*scaleSize));
    [self drawInRect:CGRectMake(0, 0, self.size.width*scaleSize, self.size.height*scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  scaledImage;
}

/**
 *  压缩图片
 *
 *  @param qulity 压缩的比例 0-1.0
 *
 *  @return 返回压缩后图片
 */
-(UIImage *)compressImage:(CGFloat)qulity
{
    NSData *data = UIImageJPEGRepresentation(self, 1.0);
    UIImage *compressImage = [UIImage imageWithData:data];
    return compressImage;
}

/**
 *  压缩裁剪出来的图片
 *
 *  @param cropRect  待裁剪的区域
 *  @param scaleSize 压缩比例
 *
 *  @return 返回已经压缩的裁剪图片
 */
-(UIImage *)scaleCorpedImage:(CGRect)cropRect scaleSize:(CGFloat)scaleSize
{
    UIImage *corpImage = [self imageByCorp:cropRect ];
    UIImage *compress = [corpImage scaleImageKeepRatio:scaleSize];
    return compress;
}


-(UIImage*)circularScaleAndCropImage:(CGRect)frame {
    // This function returns a newImage, based on image, that has been:
    // - scaled to fit in (CGRect) rect
    // - and cropped within a circle of radius: rectWidth/2
    
    //Create the bitmap graphics context
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(frame.size.width, frame.size.height), NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //Get the width and heights
    CGFloat imageWidth = self.size.width;
    CGFloat imageHeight = self.size.height;
    CGFloat rectWidth = frame.size.width;
    CGFloat rectHeight = frame.size.height;
    
    //Calculate the scale factor
    CGFloat scaleFactorX = rectWidth/imageWidth;
    CGFloat scaleFactorY = rectHeight/imageHeight;
    
    //Calculate the centre of the circle
    CGFloat imageCentreX = rectWidth/2;
    CGFloat imageCentreY = rectHeight/2;
    
    // Create and CLIP to a CIRCULAR Path
    // (This could be replaced with any closed path if you want a different shaped clip)
    CGFloat radius = rectWidth/2;
    CGContextBeginPath (context);
    CGContextAddArc (context, imageCentreX, imageCentreY, radius, 0, 2*M_PI, 0);
    CGContextClosePath (context);
    CGContextClip (context);
    
    //Set the SCALE factor for the graphics context
    //All future draw calls will be scaled by this factor
    CGContextScaleCTM (context, scaleFactorX, scaleFactorY);
    
    // Draw the IMAGE
    CGRect myRect = CGRectMake(0, 0, imageWidth, imageHeight);
    [self drawInRect:myRect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UIImage*)cropImageByCircleCustomShap:(UIBezierPath*)path frame:(CGRect)frame{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    [path addClip];
    [self drawAtPoint:CGPointZero];
    UIImage* img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();;
    UIImage *pureCropImage = [img imageByCorp:frame];
    return pureCropImage;
}



@end
