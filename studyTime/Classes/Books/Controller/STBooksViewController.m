//
//  STBooksViewController.m
//  studyTime
//
//  Created by chenzilu on 16/2/23.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import "STBooksViewController.h"
#import "STBookshelfCollVC.h"
#import "STRecomCollVC.h"
#import "STCatelogTableVC.h"

@implementation STBooksViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    [self setupNavBar];
    [self setupTitleBar];
    [self setupChildVCs];
}


- (void)setupNavBar{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem sb_itemWithTitleColor:[UIColor whiteColor] selTitleColor:[UIColor grayColor] target:self action:@selector(leftBarBtnDidCilck) title:@"编辑"];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem sb_itemWithTitleColor:[UIColor whiteColor] hightLightTitleColor:[UIColor grayColor] target:self action:@selector(rightBarBtnDidClick) title:@"已购"];
    self.navigationItem.title = @"书籍";
}
- (void)setupTitleBar{
    self.isShowUnderLine = YES;
    self.underLineColor = STLightLogoColor;
    self.selColor = STLogoColor;
    self.norColor = [UIColor darkGrayColor];
    self.titleScrollViewColor = [UIColor whiteColor];
    self.titleHeight = 35;
}

- (void)setupChildVCs{
    UICollectionViewFlowLayout *layout1 = [[UICollectionViewFlowLayout alloc] init];
    layout1.itemSize = CGSizeMake(100, 100);

    UICollectionViewFlowLayout *layout2 = [[UICollectionViewFlowLayout alloc] init];
    layout2.itemSize = CGSizeMake(100, 100);

    UIViewController *vc1 = [[STBookshelfCollVC alloc] init];
    vc1.title = @"书架";
    UIViewController *vc2 = [[STRecomCollVC alloc] init];
    vc2.title = @"推荐";
    UIViewController *vc3 = [[STCatelogTableVC alloc] init];
    vc3.title = @"分类";
    [self addChildViewController:vc1];
    [self addChildViewController:vc2];
    [self addChildViewController:vc3];
}


#pragma mark -- 监听
- (void)leftBarBtnDidCilck{
    NSLog(@"%s",__func__);
}
- (void)rightBarBtnDidClick{
    NSLog(@"%s",__func__);
}
@end

