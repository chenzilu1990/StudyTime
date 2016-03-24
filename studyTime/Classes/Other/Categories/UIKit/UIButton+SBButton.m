//
//  UIButton+SBButton.m
//  budejie
//
//  Created by chenzilu on 16/1/7.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import "UIButton+SBButton.h"

@implementation UIButton (SBButton)
#pragma mark -- public
/**
 *  高亮图片
 */


+ (instancetype)sb_buttonWithImage:(UIImage *)image highLightImage:(UIImage *)highImage target:(id)target action:(SEL)action
{
    
    UIButton *button = [self sb_buttonWithImage:image highLightImage:highImage selImage:nil target:target action:action titleColor:nil hightLightTitleColor:nil selTitleColor:nil title:nil];
    
    return button;
}
/**
 *  高亮文字
 */
+ (instancetype)sb_buttonWithTitleColor:(UIColor *)color hightLightTitleColor:(UIColor *)hightcolor target:(id)target action:(SEL)action title:(NSString *)title{
    UIButton *button = [self sb_buttonWithImage:nil highLightImage:nil selImage:nil target:target action:action titleColor:color hightLightTitleColor:hightcolor selTitleColor:nil title:title];
    return button;
}
/**
 *  高亮图文
 */

+ (instancetype)sb_buttonWithImage:(UIImage *)image highLightImage:(UIImage *)highImage target:(id)target action:(SEL)action titleColor:(UIColor *)color hightLightTitleColor:(UIColor *)hightColor title:(NSString *)title{
    UIButton *button = [self sb_buttonWithImage:image highLightImage:highImage selImage:nil target:target action:action titleColor:color hightLightTitleColor:hightColor selTitleColor:nil title:title];
    return button;
}
/**
 *  选中图片
 */
+ (instancetype)sb_buttonWithImage:(UIImage *)image selImage:(UIImage *)selImage target:(id)target action:(SEL)action
{
    UIButton *button = [self sb_buttonWithImage:image highLightImage:nil selImage:selImage target:target action:action titleColor:nil hightLightTitleColor:nil selTitleColor:nil title:nil];
    
    return button;
}

/**
 *  选中文字
 */

+ (instancetype)sb_buttonWithTitleColor:(UIColor *)color selTitleColor:(UIColor *)selColor target:(id)target action:(SEL)action title:(NSString *)title{
    UIButton *button = [self sb_buttonWithImage:nil highLightImage:nil selImage:nil target:target action:action titleColor:color hightLightTitleColor:nil selTitleColor:selColor title:title];
    return button;
}

/**
 *  选中图文
 */
+ (instancetype)sb_buttonWithImage:(UIImage *)image selImage:(UIImage *)selImage target:(id)target action:(SEL)action titleColor:(UIColor *)color selTitleColor:(UIColor *)selColor title:(NSString *)title{
    UIButton *button = [self sb_buttonWithImage:image highLightImage:nil selImage:selImage target:target action:action titleColor:color hightLightTitleColor:nil selTitleColor:selColor title:title];
    return button;
}

#pragma mark -- core

/**
 *  根方法
 */
+ (instancetype)sb_buttonWithImage:(UIImage *)image highLightImage:(UIImage *)highImage selImage:(UIImage *)selImage target:(id)target action:(SEL)action titleColor:(UIColor *)color hightLightTitleColor:(UIColor *)hightColor selTitleColor:(UIColor *)selColor title:(NSString *)title{
    // 创建按钮
    UIButton *button = [self buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    //标题
    [button setTitle:title forState:UIControlStateNormal];
    //标题颜色
    [button setTitleColor: color      forState:
     UIControlStateNormal];
    [button setTitleColor: hightColor forState:UIControlStateHighlighted];
    [button setTitleColor: selColor   forState:UIControlStateSelected];
    //图片
    [button setImage:image  forState:UIControlStateNormal];
    [button setImage:highImage forState:UIControlStateHighlighted];
    [button setImage:selImage forState:UIControlStateSelected];
    //响应方法
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //自适应
    [button sizeToFit];
    
    return button;
}



@end
