//
//  UIImage+Image.h
//  01-BuDeJie
//
//  Created by 1 on 15/12/31.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)

/**
 *  加载最原始的图片
 *
 *  @param imageName 图片名称
 *
 *  @return 返回最原始图片
 */
+ (UIImage *)imageWithOriginalImageName:(NSString *)imageName;

@end
