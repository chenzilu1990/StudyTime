//
//  UIColor+SBColor.h
//  换肤
//
//  Created by chenzilu on 15/12/23.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SBColor(r,g,b,a)  [UIColor sb_colorWithRed:(r) green:(g) blue:(b) alpha:(a)]
#define STLightLogoColor SBColor(106,76,156,0.8)
#define STLogoColor SBColor(106,76,156,1)

@interface UIColor (SBColor)
+ (UIColor *)sb_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;


@end
