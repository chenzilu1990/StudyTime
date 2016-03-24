//
//  STTabBarViewController.m
//  studyTime
//
//  Created by chenzilu on 16/2/23.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import "STTabBarViewController.h"
#import "STNavViewController.h"
#import "STMegViewController.h"
#import "STGuideViewController.h"
#import "STBooksViewController.h"
#import "STQueViewController.h"
#import "STProfViewController.h"

#define STTabBarTitleColor SBColor(106,76,156,0.8)

@implementation STTabBarViewController

+ (void)load{
    
    NSMutableDictionary *attNor = [NSMutableDictionary dictionary];
    attNor[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    
    NSMutableDictionary *attSel = [NSMutableDictionary dictionary];
    attSel[NSForegroundColorAttributeName] = STLightLogoColor;
    
    
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    item.titlePositionAdjustment = UIOffsetMake(0, -2);
    [item setTitleTextAttributes:attNor forState:UIControlStateNormal];
    [item setTitleTextAttributes:attSel forState:UIControlStateSelected];
   
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setUpChildViewControllers];
    self.tabBar.translucent = NO;
}

- (void)setUpChildViewControllers{
    [self setViewController:[[STMegViewController alloc] init] image:[UIImage imageNamed:@"message"] selImage:[UIImage imageNamed:@"message_sel"] title:@"资讯"];
    
    [self setViewController:[[STGuideViewController alloc] init] image:[UIImage imageNamed:@"guide"] selImage:[UIImage imageNamed:@"guide_sel"] title:@"指南"];
    
    [self setViewController:[[STBooksViewController alloc] init] image:[UIImage imageNamed:@"books"] selImage:[UIImage imageNamed:@"books_sel"] title:@"书籍"];
    
    [self setViewController:[[STQueViewController alloc] initWithStyle:UITableViewStyleGrouped] image:[UIImage imageNamed:@"question"] selImage:[UIImage imageNamed:@"question_sel"] title:@"问题"];
    
    [self setViewController:[[STProfViewController alloc] initWithStyle:UITableViewStyleGrouped] image:[UIImage imageNamed:@"profile"] selImage:[UIImage imageNamed:@"profile_sel"] title:@"个人中心"];
}
 /**
 *  TabBar控制器添加子控制器,导航控制器添加根控制器,设置tabBar标题,图片,选中图片
 *
 *  @param vc       根控制器
 *  @param title    标题
 *  @param image    图片
 *  @param selimage 选中图片
 */
- (void)setViewController:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selimage title:(NSString *)title{
    UINavigationController *nav = [[STNavViewController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];
    
    nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image selectedImage:selimage];
    
}


@end
