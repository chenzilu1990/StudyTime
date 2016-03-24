//
//  STNavViewController.m
//  studyTime
//
//  Created by chenzilu on 16/2/23.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import "STNavViewController.h"

@implementation STNavViewController
+ (void)load{
    
    NSMutableDictionary *attNor = [NSMutableDictionary dictionary];
    attNor[NSFontAttributeName] = [UIFont systemFontOfSize:19];
    attNor[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    [bar setTitleTextAttributes:attNor];
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBarBackGround"] forBarMetrics:UIBarMetricsDefault];

    bar.tintColor = [UIColor whiteColor];

}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    // 非根控制器才需要设置
    if (self.childViewControllers.count) {
        // 只要把系统返回按钮覆盖,就不会再有滑动返回功能
        // 不但要设置返回按钮,并且还要恢复滑动返回功能
        // 覆盖了返回按钮,滑动手势并没有被干掉,只是失效,代理做了事情
        // 隐藏底部条
        viewController.hidesBottomBarWhenPushed = YES;
        
        
    }
    
    // 这里才是真正跳转
    [super pushViewController:viewController animated:animated];

}

 @end
