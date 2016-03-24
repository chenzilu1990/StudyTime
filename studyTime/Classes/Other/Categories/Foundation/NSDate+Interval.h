//
//  NSDate+Interval.h
//  日期处理
//
//  Created by 1 on 16/1/12.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

/****** XMGDateInterval - begin ******/
@interface XMGDateInterval : NSObject
/** 相隔多少天 */
@property (nonatomic, assign) NSInteger day;
/** 相隔多少小时 */
@property (nonatomic, assign) NSInteger hour;
/** 相隔多少分钟 */
@property (nonatomic, assign) NSInteger minute;
/** 相隔多少秒 */
@property (nonatomic, assign) NSInteger second;
@end
/****** XMGDateInterval - end ******/


/****** NSDate (Interval) - begin ******/
@interface NSDate (Interval)
- (BOOL)xmg_isInToday;
- (BOOL)xmg_isInYesterday;
- (BOOL)xmg_isInTomorrow;
- (BOOL)xmg_isInThisYear;

/**
 *  计算self和anotherDate之间的时间间隔
 */
- (XMGDateInterval *)xmg_intervalSinceDate:(NSDate *)anotherDate;

 
@end
/****** NSDate (Interval) - begin ******/
