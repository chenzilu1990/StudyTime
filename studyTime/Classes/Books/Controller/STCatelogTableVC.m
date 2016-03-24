//
//  STCatelogTableVC.m
//  studyTime
//
//  Created by chenzilu on 16/3/16.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import "STCatelogTableVC.h"
#import "STCatelog.h"
#import "STCatelogCell.h"
#import <MJExtension.h>
#import <SVProgressHUD.h>
@interface STCatelogTableVC ()
@property (nonatomic, strong) AFHTTPSessionManager *mgr;
@property (nonatomic, strong) NSMutableArray *catelogs;
@end

@implementation STCatelogTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableV];
    [self loadSubject];
}

- (void)setupTableV{
 
    [self.tableView registerNib:[UINib NibWithClass:[STCatelogCell class] bundle:nil] forCellReuseIdentifier:@"topic"];
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"catelog"];
    self.tableView.backgroundColor = SBColor(239, 239, 244, 1);
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, STTabBarH, 0);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
 
}


- (void)loadSubject{
    [self.mgr.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    static NSString * const baseURL = @"http://d.dxy.cn/book/api/read?action=GetSubject";
    
    
    [self.mgr GET:baseURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSMutableArray *listArr = [STCatelog mj_objectArrayWithKeyValuesArray:responseObject[@"items"]];
        
        self.catelogs = listArr;

        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"请检查网络..."];
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.catelogs.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    STCatelog *log = self.catelogs[indexPath.row];
    if ([log.count isEqualToString:@"0"]) {
        STCatelogCell *cell = [tableView dequeueReusableCellWithIdentifier:@"topic"];
       
        cell.titleLab.text = log.name;
        cell.backgroundColor = [UIColor whiteColor];

        return cell;
    }else{
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"catelog"];
        cell.textLabel.textColor = [UIColor darkGrayColor];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
        cell.detailTextLabel.text  = [NSString stringWithFormat:@"%@",log.count];
        cell.imageView.image = nil;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.backgroundColor = self.tableView.backgroundColor;
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.text = log.name;
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    STCatelog *log = self.catelogs[indexPath.row];
    if ([log.count isEqualToString:@"0"]) {
        return 45;
    }else{
        return 60;
    }
    
}



#pragma mark -- 监听
- (AFHTTPSessionManager *)mgr{
    if (_mgr == nil) {
        _mgr = [AFHTTPSessionManager manager];
    }
    return _mgr;
}

@end
