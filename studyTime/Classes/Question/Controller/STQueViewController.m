//
//  STQueViewController.m
//  studyTime
//
//  Created by chenzilu on 16/2/23.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import "STQueViewController.h"
#import <MJExtension.h>
#import "STQuestion.h"
#import "STQuestionGroup.h"
#import "STQuesHeaderView.h"

#import "UIScrollView+APParallaxHeader.h"
@interface STQueViewController ()
@property (nonatomic, strong) NSMutableArray *questionGroups;
@property (nonatomic, weak) UIView *headerV;
@end


@implementation STQueViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    [self setupNavBar];
    
    [self setupTableView];
}

- (void)setupNavBar{
    self.navigationItem.title = @"问答";
}
- (void)setupTableView{
    STQuesHeaderView *userView = [STQuesHeaderView sb_viewFromNib];
    [self.tableView addParallaxWithView:userView andHeight:100 andShadow:NO];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

    self.tableView.bounces = NO;
    self.tableView.rowHeight = 45;
}

#pragma mark -- delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.questionGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *ques = [self.questionGroups[section] questions];
    return ques.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
 
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    
    STQuestion *que = [self.questionGroups[indexPath.section] questions][indexPath.row];
    cell.textLabel.text = que.title;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.imageView.image = [UIImage imageNamed:que.icon];
    return cell;
}



#pragma mark -- 懒加载
- (NSMutableArray *)questionGroups{
    if (_questionGroups == nil) {
        
        [STQuestionGroup mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"questions" : [STQuestion class]};
        }];
        
        _questionGroups = [STQuestionGroup mj_objectArrayWithFilename:@"STQuestion.plist"];
        
    }
    return _questionGroups;
}

- (UIView *)headerV{
    if (_headerV == nil) {
        _headerV = [STQuesHeaderView sb_viewFromNib];


    }
    return _headerV;
}


@end
