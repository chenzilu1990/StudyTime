//
//  UIImage+Image.m
//  01-BuDeJie
//
//  Created by 1 on 15/12/31.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)

+ (UIImage *)imageWithOriginalImageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    // 注意:一定要记得赋值
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

}

@end
