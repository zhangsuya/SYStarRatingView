//
//  UIImage+Tint.h
//  SYStarRatingView
//
//  Created by Mac on 16/3/30.
//  Copyright © 2016年 suya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tint)
- (UIImage *) imageWithTintColor:(UIColor *)tintColor;
- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor;
@end
