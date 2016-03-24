//
//  UITextField+SBTextField.m
//  budejie
//
//  Created by chenzilu on 16/1/8.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import "UITextField+SBTextField.h"

#import <objc/message.h>
@implementation UITextField (SBTextField)

+(void)load{
    
    Method setPlaceholderMethod = class_getInstanceMethod(self, @selector(setPlaceholder:));
    
    Method sb_setPlaceholderMethod = class_getInstanceMethod(self, @selector(sb_setPlaceholder:));
    method_exchangeImplementations(sb_setPlaceholderMethod , setPlaceholderMethod);
    
}

- (void)setPlaceholderColore:(UIColor *)placeholderColore{
    
    objc_setAssociatedObject(self, @"placeholderColore", placeholderColore, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    UILabel *placeLable = [self valueForKeyPath:@"placeholderLabel"];
    placeLable.textColor = placeholderColore;
}

- (UIColor *)placeholderColore{
    return objc_getAssociatedObject(self, @"placeholderColore");
}

- (void)sb_setPlaceholder:(NSString *)placeholder{
    [self sb_setPlaceholder:placeholder];
    
    self.placeholderColore = self.placeholderColore;
    
    
}

@end
