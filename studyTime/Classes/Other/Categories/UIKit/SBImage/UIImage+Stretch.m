//
//  UIImage+Stretch.m
//  UIView
//
//  Created by chenzilu on 15/12/4.
//  Copyright © 2015年 chenzilu. All rights reserved.
//

#import "UIImage+Stretch.h"

@implementation UIImage (Stretch)

+ (UIImage *)stretchImageName:(NSString *)imageName{
    return [[self imageNamed:imageName] strech];
}

- (UIImage *)strech{
    CGFloat width = self.size.width * 0.5;
    CGFloat heigth = self.size.height * 0.5;
    return [self stretchableImageWithLeftCapWidth:width topCapHeight:heigth];
}
@end
