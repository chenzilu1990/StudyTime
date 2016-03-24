//
//  UIBarButtonItem+Item.h
//  01-BuDeJie
//
//  Created by 1 on 16/1/4.
//  Copyright © 2016年 SB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)
/**
 *  高亮图片
*/

+ (UIBarButtonItem *)sb_itemWithImage:(UIImage *)image highLightImage:(UIImage *)highImage target:(id)target action:(SEL)action;
/**
 *  高亮文字
*/
+ (UIBarButtonItem *)sb_itemWithTitleColor:(UIColor *)color hightLightTitleColor:(UIColor *)hightcolor target:(id)target action:(SEL)action title:(NSString *)title;

/**
 *  高亮图文
*/
+ (UIBarButtonItem *)sb_itemWithImage:(UIImage *)image highLightImage:(UIImage *)highImage target:(id)target action:(SEL)action titleColor:(UIColor *)color hightLightTitleColor:(UIColor *)hightColor title:(NSString *)title;

/**
*  选中图片
*/
+ (UIBarButtonItem *)sb_itemWithImage:(UIImage *)image selImage:(UIImage *)selImage target:(id)target action:(SEL)action;

/**
 *  选中文字
 */

+ (UIBarButtonItem *)sb_itemWithTitleColor:(UIColor *)color selTitleColor:(UIColor *)selColor target:(id)target action:(SEL)action title:(NSString *)title;
/**
 *  选中图文
*/
+ (UIBarButtonItem *)sb_itemWithImage:(UIImage *)image selImage:(UIImage *)selImage target:(id)target action:(SEL)action titleColor:(UIColor *)color selTitleColor:(UIColor *)selColor title:(NSString *)title;




@end
