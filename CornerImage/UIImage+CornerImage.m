//
//  UIImage+CornerImage.m
//  Day2016-01-24-图像圆角
//
//  Created by NationSky on 16/1/24.
//  Copyright © 2016年 nsky. All rights reserved.
//

#import "UIImage+CornerImage.h"

@implementation UIImage (CornerImage)
- (UIImage *)roundedCornerImageWithCornerRadius:(CGFloat)radius
{
    CGFloat w = self.size.width;
    CGFloat h = self.size.height;
    CGFloat scale = [UIScreen mainScreen].scale;
    if (radius < 0) {
        radius = 0;
    }else if(radius > MIN(w, h)){
        radius = MIN(w, h)/2.0;
    }
    UIImage *image = nil;
    CGRect imageFrame = CGRectMake(0, 0, w, h);
    UIGraphicsBeginImageContextWithOptions(self.size, NO, scale);
    [[UIBezierPath bezierPathWithRoundedRect:imageFrame cornerRadius:radius] addClip];
    [self drawInRect:imageFrame];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


//图片剪切
- (UIImage*)imageByRoundCornerRadius:(CGFloat)radius
{
    UIGraphicsBeginImageContext(self.size);
    CGContextRef gc = UIGraphicsGetCurrentContext();
    
    float x1 = 0.;
    float y1 = 0.;
    float x2 = x1+self.size.width;
    float y2 = y1;
    float x3 = x2;
    float y3 = y1+self.size.height;
    float x4 = x1;
    float y4 = y3;
    radius = radius*2;
    
    CGContextMoveToPoint(gc, x1, y1+radius);
    CGContextAddArcToPoint(gc, x1, y1, x1+radius, y1, radius);
    CGContextAddArcToPoint(gc, x2, y2, x2, y2+radius, radius);
    CGContextAddArcToPoint(gc, x3, y3, x3-radius, y3, radius);
    CGContextAddArcToPoint(gc, x4, y4, x4, y4-radius, radius);
    
    
    CGContextClosePath(gc);
    CGContextClip(gc);
    
    CGContextTranslateCTM(gc, 0, self.size.height);
    CGContextScaleCTM(gc, 1, -1);
    CGContextDrawImage(gc, CGRectMake(0, 0, self.size.width, self.size.height), self.CGImage);
    
    UIImage *newimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newimage;
}


@end
