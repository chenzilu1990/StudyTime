//
//  NSCalendar+Init.m
//  日期处理
//
//  Created by 1 on 16/1/13.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "NSCalendar+Init.h"

@implementation NSCalendar (Init)
+ (instancetype)xmg_calendar
{
    if ([NSCalendar respondsToSelector:@selector(calendarWithIdentifier:)]) {
        return [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else {
        return [NSCalendar currentCalendar];
    }
}
@end
