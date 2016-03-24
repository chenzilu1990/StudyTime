//
//  UINib+STNib.h
//  studyTime
//
//  Created by chenzilu on 16/3/23.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (STNib)
+ (instancetype)NibWithClass:(Class)cla bundle:(NSBundle*)bundle;
@end
