//
//  STGuideViewController.m
//  studyTime
//
//  Created by chenzilu on 16/2/23.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import "STGuideViewController.h"
#import "STNewGuideVC.h"
#import "STGuideCatelogVC.h"
@implementation STGuideViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    [self setupNavBar];
    [self setupTitleBar];
    [self setupChildVCs];
}
- (void)setupNavBar{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem sb_itemWithImage:[UIImage imageNamed:@"search"] highLightImage:nil target:self action:@selector(leftBarBtnDidClick)];
    self.navigationItem.title = @"指南";
}
- (void)setupTitleBar{
    self.isShowUnderLine = YES;
    self.underLineColor = STLogoColor;
    self.selColor = STLightLogoColor;
    self.norColor = [UIColor darkGrayColor];
    self.titleScrollViewColor = [UIColor whiteColor];
    self.titleHeight = 35;
}
- (void)setupChildVCs{
    UIViewController *vc1 = [[STNewGuideVC alloc] init];
    vc1.title = @"最新指南";
    [self addChildViewController:vc1];
    UIViewController *vc2 = [[STGuideCatelogVC alloc] init];
    vc2.title = @"指南分类";
    [self addChildViewController:vc2];
}
- (void)leftBarBtnDidClick{
    NSLog(@"%s",__func__);
}
@end
