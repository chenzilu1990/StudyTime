
//  UIView+SBView.m
//  UIView
//
//  Created by chenzilu on 15/12/4.
//  Copyright © 2015年 chenzilu. All rights reserved.
//

#import "UIView+SBView.h"

@implementation UIView (SBView)

+ (instancetype)sb_viewFromNib{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil][0];
}

- (BOOL)sb_intersectWithView:(UIView *)anotherView
{
    if (anotherView == nil) {
        anotherView = [UIApplication sharedApplication].keyWindow;
    }
    
    CGRect rect1 = [self convertRect:self.bounds toView:nil];
    CGRect rect2 = [anotherView convertRect:anotherView.bounds toView:nil];
    return CGRectIntersectsRect(rect1, rect2);
}


 
- (CGFloat)sb_x{
    return self.frame.origin.x;
}

- (CGFloat)sb_y{
    return self.frame.origin.y;
}

- (CGFloat)sb_width{
    return self.frame.size.width;
}

- (CGFloat)sb_height{
    return self.frame.size.height;
}

- (CGFloat)sb_centerX{
    return self.center.x;
}

- (CGFloat)sb_centerY{
    return self.center.y;
}

- (CGSize)sb_size{
    return self.frame.size;
}

- (CGPoint)sb_origin{
    return self.frame.origin;
}

- (CGFloat)sb_right{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)sb_bottom{
    return self.frame.origin.y + self.frame.size.height;
}



- (void)setSb_x:(CGFloat)sb_x{
    CGRect frame = self.frame;
    frame.origin.x = sb_x;
    self.frame = frame;
}

- (void)setSb_y:(CGFloat)sb_y{
    CGRect frame = self.frame;
    frame.origin.y = sb_y;
    self.frame = frame;
}



- (void)setSb_width:(CGFloat)sb_width{
    CGRect frame = self.frame;
    frame.size.width = sb_width;
    self.frame = frame;
}

- (void)setSb_height:(CGFloat)sb_height{
    CGRect frame = self.frame;
    frame.size.height = sb_height;
    self.frame = frame;
}

- (void)setSb_centerX:(CGFloat)sb_centerX{
    self.center = CGPointMake(sb_centerX, self.center.y);
}

- (void)setSb_centerY:(CGFloat)sb_centerY{
    self.center = CGPointMake(self.center.x, sb_centerY);
}

- (void)setSb_size:(CGSize)sb_size{
    CGRect frame = self.frame;
    frame.size = sb_size;
    self.frame = frame;
}

- (void)setSb_origin:(CGPoint)sb_origin{
    CGRect frame = self.frame;
    frame.origin = sb_origin;
    self.frame = frame;
}


- (void)setSb_right:(CGFloat)sb_right{
    CGRect frame =  self.frame;
    frame.origin.x = sb_right - self.frame.size.width;
    self.frame = frame;
}

- (void)setSb_bottom:(CGFloat)sb_bottom{
    CGRect frame = self.frame;
    frame.origin.y = sb_bottom - self.frame.size.height;
    self.frame = frame;
}

@end
