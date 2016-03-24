//
//  UIView+SBView.h
//  UIView
//
//  Created by chenzilu on 15/12/4.
//  Copyright © 2015年 chenzilu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SBView)

+ (instancetype)sb_viewFromNib;



@property   CGFloat sb_x;

@property   CGFloat sb_y;

@property   CGFloat sb_width;

@property   CGFloat sb_height;

@property   CGFloat sb_centerX;

@property   CGFloat sb_centerY;

@property   CGSize  sb_size;

@property   CGPoint sb_origin;

@property   CGFloat sb_right;

@property   CGFloat sb_bottom;

/**
 *  判断屏幕上的self是否和anotherView有重叠
 */
- (BOOL)sb_intersectWithView:(UIView *)anotherView;
@end
