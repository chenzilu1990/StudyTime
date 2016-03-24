//
//  UITextField+XMGExtension.m
//  3期-百思不得姐
//
//  Created by xiaomage on 15/9/11.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "UITextField+XMGExtension.h"

/** 占位文字颜色 */
static NSString * const XMGPlaceholderColorKey = @"placeholderLabel.textColor";

@implementation UITextField (XMGExtension)

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    BOOL change = NO;
    
    // 保证有占位文字
    if (self.placeholder == nil) {
        self.placeholder = @" ";
        change = YES;
    }
    
    // 设置占位文字颜色
    [self setValue:placeholderColor forKeyPath:XMGPlaceholderColorKey];
    
    // 恢复原状
    if (change) {
        self.placeholder = nil;
    }
}

- (UIColor *)placeholderColor
{
    return [self valueForKeyPath:XMGPlaceholderColorKey];
}
@end
