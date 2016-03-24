//
//  UIButton+SBButton.h
//  budejie
//
//  Created by chenzilu on 16/1/7.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SBButton)

/**
 *  高亮图片
 */

+ (instancetype)sb_buttonWithImage:(UIImage *)image highLightImage:(UIImage *)highImage target:(id)target action:(SEL)action;
/**
 *  高亮文字
 */
+ (instancetype)sb_buttonWithTitleColor:(UIColor *)color hightLightTitleColor:(UIColor *)hightcolor target:(id)target action:(SEL)action title:(NSString *)title;

/**
 *  高亮图文
 */
+ (instancetype)sb_buttonWithImage:(UIImage *)image highLightImage:(UIImage *)highImage target:(id)target action:(SEL)action titleColor:(UIColor *)color hightLightTitleColor:(UIColor *)hightColor title:(NSString *)title;

/**
 *  选中图片
 */
+ (instancetype)sb_buttonWithImage:(UIImage *)image selImage:(UIImage *)selImage target:(id)target action:(SEL)action;

/**
 *  选中文字
 */

+ (instancetype)sb_buttonWithTitleColor:(UIColor *)color selTitleColor:(UIColor *)selColor target:(id)target action:(SEL)action title:(NSString *)title;
/**
 *  选中图文
 */
+ (instancetype)sb_buttonWithImage:(UIImage *)image selImage:(UIImage *)selImage target:(id)target action:(SEL)action titleColor:(UIColor *)color selTitleColor:(UIColor *)selColor title:(NSString *)title;

/**
 * button coreFun
 */
+ (instancetype)sb_buttonWithImage:(UIImage *)image highLightImage:(UIImage *)highImage selImage:(UIImage *)selImage target:(id)target action:(SEL)action titleColor:(UIColor *)color hightLightTitleColor:(UIColor *)hightColor selTitleColor:(UIColor *)selColor title:(NSString *)title;

@end
