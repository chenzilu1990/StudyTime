//
//  UIColor+SBColor.m
//  换肤
//
//  Created by chenzilu on 15/12/23.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "UIColor+SBColor.h"

@implementation UIColor (SBColor)

+ (UIColor *)sb_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha{
    
    UIColor *color = [UIColor colorWithRed:((float)red / 255.0f) green:((float)green / 255.0f) blue:((float)blue/ 255.0f) alpha:alpha];
    
    return color;
}
@end
