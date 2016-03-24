//
//  UINib+STNib.m
//  studyTime
//
//  Created by chenzilu on 16/3/23.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import "UINib+STNib.h"

@implementation UINib (STNib)
+ (instancetype)NibWithClass:(Class)cla bundle:(NSBundle *)bundle{
    UINib *nib = [UINib nibWithNibName:NSStringFromClass(cla) bundle:bundle];
    return nib;
}
@end
