//
//  NSDate+XMGExtension.m
//  3期-百思不得姐
//
//  Created by xiaomage on 15/9/14.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "NSDate+XMGExtension.h"

@implementation NSDate (XMGExtension)
- (NSDateComponents *)intervalToDate:(NSDate *)date
{
    // 日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 想比较哪些元素
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    // 比较
    return [calendar components:unit fromDate:self toDate:date options:0];
}

- (NSDateComponents *)intervalToNow
{
    return [self intervalToDate:[NSDate date]];
}

/**
 * 是否为今年
 */
- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 获得年
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    
    return nowYear == selfYear;
}
//- (BOOL)isThisYear
//{
//    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
//    fmt.dateFormat = @"yyyy";
//    
//    NSString *nowYear = [fmt stringFromDate:[NSDate date]];
//    NSString *selfYear = [fmt stringFromDate:self];
//    
//    return [nowYear isEqualToString:selfYear];
//}

/**
 * 是否为今天
 */
//- (BOOL)isToday
//{
//    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
//    fmt.dateFormat = @"yyyy-MM-dd";
//
//    NSString *nowString = [fmt stringFromDate:[NSDate date]];
//    NSString *selfString = [fmt stringFromDate:self];
//
//    return [nowString isEqualToString:selfString];
//}
//- (BOOL)isToday
//{
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    
//    NSDate *now = [NSDate date];
//    
//    return [calendar component:NSCalendarUnitYear fromDate:now] == [calendar component:NSCalendarUnitYear fromDate:self]
//    && [calendar component:NSCalendarUnitMonth fromDate:now] == [calendar component:NSCalendarUnitMonth fromDate:self]
//    && [calendar component:NSCalendarUnitDay fromDate:now] == [calendar component:NSCalendarUnitDay fromDate:self];
//}
- (BOOL)isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return nowCmps.year == selfCmps.year
    && nowCmps.month == selfCmps.month
    && nowCmps.day == selfCmps.day;
}

/**
 * 是否为昨天
 */
- (BOOL)isYesterday
{
    // now : 2015-02-01 00:01:05 -->  2015-02-01
    // self : 2015-01-31 23:59:10 --> 2015-01-31
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    // 获得只有年月日的时间
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    NSDate *nowDate = [fmt dateFromString:nowString];
    
    NSString *selfString = [fmt stringFromDate:self];
    NSDate *selfDate = [fmt dateFromString:selfString];
    
    // 比较
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == 1;
}

/**
 * 是否为明天
 */
- (BOOL)isTomorrow
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    // 获得只有年月日的时间
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    NSDate *nowDate = [fmt dateFromString:nowString];
    
    NSString *selfString = [fmt stringFromDate:self];
    NSDate *selfDate = [fmt dateFromString:selfString];
    
    // 比较
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == -1;
}
@end
