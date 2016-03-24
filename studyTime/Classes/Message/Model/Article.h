//
//  Article.h
//  test
//
//  Created by chenzilu on 16/3/2.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) NSString *numOfShared;
@property (nonatomic, strong) NSString *articleDate;
@property (nonatomic, strong) NSString *imgpath;
@property (nonatomic, strong) NSString *voteid;
@property (nonatomic, strong) NSString *ID;
@end
