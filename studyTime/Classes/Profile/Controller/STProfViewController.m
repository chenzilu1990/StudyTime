//
//  STProfViewController.m
//  studyTime
//
//  Created by chenzilu on 16/2/23.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import "STProfViewController.h"
#import "UIScrollView+APParallaxHeader.h"
#import "STUserHeaderView.h"
#import "STUserPrefer.h"
#import <MJExtension.h>
#import "STUserPerferGroup.h"

static NSString * const ID = @"userPrefer";

@interface STProfViewController ()

@property (nonatomic, strong) NSArray *groups;

@end


@implementation STProfViewController
- (void)viewDidLoad{
    [super viewDidLoad];

    [self setupTableView];
}

- (void)setupTableView{
    STUserHeaderView *userView = [STUserHeaderView sb_viewFromNib];
    [self.tableView addParallaxWithView:userView andHeight:170 andShadow:NO];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"head"];
    self.tableView.rowHeight = 45;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
 
}




#pragma mark -- 懒加载
- (NSArray *)groups{
    if (_groups == nil) {
        [STUserPerferGroup mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"userPrefers" : [STUserPrefer class]};
        }];
        
        _groups = [STUserPerferGroup mj_objectArrayWithFilename:@"STUserPrefer.plist"];
    }
    return _groups;
}
#pragma mark -- 代理事件
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groups.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *arr = [self.groups[section] userPrefers];
    return arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
      STUserPrefer *prefer = [self.groups[indexPath.section] userPrefers][indexPath.row] ;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.text = prefer.title;
    cell.imageView.image = [UIImage imageNamed:prefer.icon];
    cell.detailTextLabel.text = @"jekhekjw";

    return cell;
    
}

 
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    return @"wek"
//    ;}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *view = [[UIView alloc] init];
//    view.backgroundColor = [UIColor redColor];
//    view.sb_height = 40;
//    return view;
//}
@end
