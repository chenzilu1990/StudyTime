//
//  AppDelegate.m
//  studyTime
//
//  Created by chenzilu on 16/2/23.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import "AppDelegate.h"
#import "STTabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    

    self.window.rootViewController = [[STTabBarViewController alloc] init];

    
    [self.window makeKeyAndVisible];
    

    application.statusBarStyle = UIStatusBarStyleLightContent;
    
    return YES;
}

@end
