//
//  UIImage+CornerImage.h
//  Day2016-01-24-图像圆角
//
//  Created by NationSky on 16/1/24.
//  Copyright © 2016年 nsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CornerImage)
- (UIImage *)roundedCornerImageWithCornerRadius:(CGFloat)radius;

- (UIImage*)imageByRoundCornerRadius:(CGFloat)radius;


@end
