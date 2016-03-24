//
//  STMegViewController.m
//  studyTime
//
//  Created by chenzilu on 16/3/8.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import "STMegViewController.h"
#import "STTagViewController.h"
#import "STSearchViewController.h"
#import "STNavViewController.h"
@implementation STMegViewController

- (void)viewDidLoad{
    [super viewDidLoad];

    [self setupNavBar];
    [self setupChildViewControllers];
    [self setupTitleBar];
    
}

 
- (void)setupNavBar{
    self.navigationItem.title = @"资讯";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem sb_itemWithImage:[UIImage imageNamed:@"search"] highLightImage:nil target:self action:@selector(didClickLeftBarButton)];
 
}

- (void)setupTitleBar{
    self.isShowUnderLine = YES;
    self.underLineColor = STLightLogoColor;
    self.selColor = STLogoColor;
    self.norColor = [UIColor darkGrayColor];
    self.titleScrollViewColor = [UIColor whiteColor];
    self.titleHeight = 35;
}

- (void)setupChildViewControllers{
    UIViewController *tagVC1 = [[STTagViewController alloc] init];
     tagVC1.title = @"最新资讯";
    [self addChildViewController:tagVC1];
    
    UIViewController *tagVC2 = [[STTagViewController alloc] init];
    tagVC2.title = @"同行推荐";
    [self addChildViewController:tagVC2];
}



#pragma mark -- 监听
- (void)didClickLeftBarButton{
    UIViewController *vc = [[STNavViewController alloc] initWithRootViewController:[[STSearchViewController alloc] init]];
    
    [self presentViewController:vc animated:YES completion:nil];
}


@end
