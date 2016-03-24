//
//  UIImageView+XMGExtension.m
//  3期-百思不得姐
//
//  Created by xiaomage on 15/9/6.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "UIImageView+XMGExtension.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (XMGExtension)
- (void)setHeader:(NSString *)url
{
    [self setCircleHeader:url];
}

- (void)setRectHeader:(NSString *)url
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}

- (void)setCircleHeader:(NSString *)url
{
    XMGWeakSelf;
    UIImage *placeholder = [[UIImage imageNamed:@"defaultUserIcon"] circleImage];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:
     ^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       // 如果图片下载失败，就不做任何处理，按照默认的做法：会显示占位图片
       if (image == nil) return;
       
       weakSelf.image = [image circleImage];
   }];
}
@end
