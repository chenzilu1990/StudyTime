//
//  UIImageView+Download.m
//  01-BuDeJie
//
//  Created by 1 on 16/1/15.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "UIImageView+Download.h"
#import <UIImageView+WebCache.h>
#import <AFNetworking.h>

@implementation UIImageView (Download)
- (void)xmg_setOriginImage:(NSString *)originImage smallImage:(NSString *)smallImage placeholder:(UIImage *)placeholder
{
    // 网络状态判断对真机有效, 有模拟器无效
    // WiFi : 直接下载大图(原图)
    // 非WiFi : 先下载小图(缩略图), 点击后再下载大图
    
    [self sd_setImageWithURL:[NSURL URLWithString:originImage] placeholderImage:placeholder];
    
    /*
    // 先查看缓存的大图片
    self.image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:originImage];
    
    if (self.image == nil) { // 没有缓存大图
        AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
        if (mgr.isReachableViaWiFi) { // WiFi
            [self sd_setImageWithURL:[NSURL URLWithString:originImage] placeholderImage:placeholder];
        } else { // 非WiFi
            self.image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:smallImage];

            if (self.image == nil) {
                if (mgr.isReachableViaWWAN) { // 手机自带网络
                    [self sd_setImageWithURL:[NSURL URLWithString:smallImage] placeholderImage:placeholder];
                } else { // 网络不行
                    // 显示占据图片
                    // 如果不显示占位图片, 就应该清空之前循环利用过来的图片
                    self.image = placeholder;
                }
            }
        }
    }
     */
}
@end
