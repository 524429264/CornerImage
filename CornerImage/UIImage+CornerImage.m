//
//  UIImage+CornerImage.m
//  Day2016-01-24-图像圆角
//
//  Created by NationSky on 16/1/24.
//  Copyright © 2016年 nsky. All rights reserved.
//

#import "UIImage+CornerImage.h"

@implementation UIImage (CornerImage)
- (UIImage *)roundedCornerImageWithCornerRadius:(CGFloat)cornerRadius
{
    CGFloat w = self.size.width;
    CGFloat h = self.size.height;
    CGFloat scale = [UIScreen mainScreen].scale;
    if (cornerRadius < 0) {
        cornerRadius = 0;
    }else if(cornerRadius > MIN(w, h)){
        cornerRadius = MIN(w, h)/2.0;
    }
    UIImage *image = nil;
    CGRect imageFrame = CGRectMake(0, 0, w, h);
    UIGraphicsBeginImageContextWithOptions(self.size, NO, scale);
    [[UIBezierPath bezierPathWithRoundedRect:imageFrame cornerRadius:cornerRadius] addClip];
    [self drawInRect:imageFrame];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
