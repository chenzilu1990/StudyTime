//
//  STNewGuideVC.m
//  studyTime
//
//  Created by chenzilu on 16/3/16.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import "STNewGuideVC.h"

@interface STNewGuideVC ()

@end

@implementation STNewGuideVC

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (NSMutableDictionary *)parameters{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
 
    parameters[@"appImg"] = @"false";
    parameters[@"appTop"] = @"false";
    
    return parameters;
}
 @end
