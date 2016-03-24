//
//  NSString+SBFormatString.m
//  budejie
//
//  Created by chenzilu on 16/1/12.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import "NSString+SBFormatString.h"

@implementation NSString (SBFormatString)

+ (instancetype)stringFormatWithNumber:(NSUInteger)number{
    
    NSString *str = nil;
    if (number >= 10000) {
        str =[NSString stringWithFormat:@"%.1f万", number / 10000.0] ;
    } else if (number > 0) {
        str = [NSString stringWithFormat:@"%zd", number];
    }
    return str;
    
}

@end
