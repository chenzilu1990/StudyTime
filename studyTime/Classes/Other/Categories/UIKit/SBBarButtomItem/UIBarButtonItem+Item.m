//
//  UIBarButtonItem+Item.m
//  01-BuDeJie
//
//  Created by 1 on 16/1/4.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "UIBarButtonItem+Item.h"
#import "UIButton+SBButton.h"
//#import <objc/objc-runtime.h>
#import <objc/message.h>

@implementation UIBarButtonItem (Item)


+ (void)load{
    // 获取xmg_setPlaceholder方法
    Method sb_initWithCustomView =  class_getInstanceMethod(self, @selector(sb_initWithCustomView:));
    
    // 获取setPlaceholder方法
    Method initWithCustomView =  class_getInstanceMethod(self, @selector(initWithCustomView:));
    
    // 交互两个方法实现
    method_exchangeImplementations(initWithCustomView, sb_initWithCustomView);

    
}

#pragma mark -- public
/**
 *  高亮图片
 */


+ (UIBarButtonItem *)sb_itemWithImage:(UIImage *)image highLightImage:(UIImage *)highImage target:(id)target action:(SEL)action
{
    
    UIBarButtonItem *item = [self sb_itemWithImage:image highLightImage:highImage selImage:nil target:target action:action titleColor:nil hightLightTitleColor:nil selTitleColor:nil title:nil];
    
      return item;
}
/**
 *  高亮文字
 */
+ (UIBarButtonItem *)sb_itemWithTitleColor:(UIColor *)color hightLightTitleColor:(UIColor *)hightcolor target:(id)target action:(SEL)action title:(NSString *)title{
    
    UIBarButtonItem *item = [self sb_itemWithImage:nil highLightImage:nil selImage:nil target:target action:action titleColor:color hightLightTitleColor:hightcolor selTitleColor:nil title:title];
    return item;
}
/**
 *  高亮图文
 */
 
+ (UIBarButtonItem *)sb_itemWithImage:(UIImage *)image highLightImage:(UIImage *)highImage target:(id)target action:(SEL)action titleColor:(UIColor *)color hightLightTitleColor:(UIColor *)hightColor title:(NSString *)title{
    
    UIBarButtonItem *item = [self sb_itemWithImage:image highLightImage:highImage selImage:nil target:target action:action titleColor:color hightLightTitleColor:hightColor selTitleColor:nil title:title];
    return item;
}
/**
 *  选中图片
 */
+ (UIBarButtonItem *)sb_itemWithImage:(UIImage *)image selImage:(UIImage *)selImage target:(id)target action:(SEL)action
{
    UIBarButtonItem *item = [self sb_itemWithImage:image highLightImage:nil selImage:selImage target:target action:action titleColor:nil hightLightTitleColor:nil selTitleColor:nil title:nil];
    
    return item;
}

/**
 *  选中文字
 */

+ (UIBarButtonItem *)sb_itemWithTitleColor:(UIColor *)color selTitleColor:(UIColor *)selColor target:(id)target action:(SEL)action title:(NSString *)title{
    
    UIBarButtonItem *item = [self sb_itemWithImage:nil highLightImage:nil selImage:nil target:target action:action titleColor:color hightLightTitleColor:nil selTitleColor:selColor title:title];
    return item;
}

/**
 *  选中图文
 */
+ (UIBarButtonItem *)sb_itemWithImage:(UIImage *)image selImage:(UIImage *)selImage target:(id)target action:(SEL)action titleColor:(UIColor *)color selTitleColor:(UIColor *)selColor title:(NSString *)title{
    
    UIBarButtonItem *item = [self sb_itemWithImage:image highLightImage:nil selImage:selImage target:target action:action titleColor:color hightLightTitleColor:nil selTitleColor:selColor title:title];
    return item;
}

#pragma mark -- core

/**
 *  根方法
*/

+ (UIBarButtonItem *)sb_itemWithImage:(UIImage *)image highLightImage:(UIImage *)highImage selImage:(UIImage *)selImage target:(id)target action:(SEL)action titleColor:(UIColor *)color hightLightTitleColor:(UIColor *)hightColor selTitleColor:(UIColor *)selColor title:(NSString *)title{
    
     UIButton *button = [UIButton sb_buttonWithImage:image highLightImage:highImage selImage:selImage target:target action:action titleColor:color hightLightTitleColor:hightColor selTitleColor:selColor title:title];
    
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
    

}


- (instancetype)sb_initWithCustomView:(UIView *)customView{
    

    if ([customView isKindOfClass:[UIButton class]]) {
        // 把按钮包装成view,处理点击区域太大
        UIView *barButtonView = [[UIView alloc] initWithFrame:customView.bounds];
        
        [barButtonView addSubview:customView];
        
        return [self sb_initWithCustomView:barButtonView];

    }else{
     

        return [self sb_initWithCustomView:customView];
    }
    
}
 


@end
