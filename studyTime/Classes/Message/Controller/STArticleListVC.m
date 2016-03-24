//
//  STArticleListVC.m
//  studyTime
//
//  Created by chenzilu on 16/3/16.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import "STArticleListVC.h"
#import "Article.h"
#import "ArticleCell.h"
#import "STArticleVIewController.h"
#import <UIImageView+WebCache.h>
#import <MJExtension.h>
#import <AFHTTPSessionManager.h>
#import <SVProgressHUD.h>
#import <MJRefresh.h>
@interface STArticleListVC ()
@property (nonatomic, strong) NSMutableArray *articles;
@property (nonatomic, strong) AFHTTPSessionManager *mgr;
@property (nonatomic, assign) NSInteger page;

@end

@implementation STArticleListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTableView];
    [self.tableView.mj_header beginRefreshing];
}

- (NSMutableDictionary *)parameters{
    return nil;
}
- (void)setUpTableView{
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ArticleCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.tableView.rowHeight = ArticleCellH;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, STTabBarH, 0);
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewArticles)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreArticles)];
    self.tableView.backgroundColor = SBColor(239, 239, 244, 1);
}

- (void)loadNewArticles{
    
    [self.mgr.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    static NSString * const baseURL = @"http://www.dxy.cn/webservices/article/latest/v3.3";
    NSMutableDictionary *parameters = [self parameters];
    parameters[@"limit"] = @20;
    parameters[@"pge"] = @"1";
 
    
    [self.mgr GET:baseURL parameters:[self parameters] progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [Article mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{@"ID" : @"id"};
        }];
        
        self.articles = [Article mj_objectArrayWithKeyValuesArray:responseObject[@"message"][@"list"]];
        
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        self.page = 1;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"请检查网络..."];
        [self.tableView.mj_header endRefreshing];
    }];
}


- (void)loadMoreArticles{
    
    [self.mgr.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    static NSString * const baseURL = @"http://www.dxy.cn/webservices/article/latest/v3.3";
    NSMutableDictionary *parameters = [self parameters];
    parameters[@"limit"] = @20;
    parameters[@"pge"] = [NSString stringWithFormat:@"%zd",self.page + 1];
 
    
    [self.mgr GET:baseURL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self.articles addObjectsFromArray:[Article mj_objectArrayWithKeyValuesArray:responseObject[@"message"][@"list"]]];
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
        self.page += 1;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"请检查网络..."];
        [self.tableView.mj_footer endRefreshing];
    }];
    
}

#pragma mark -- 监听

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.articles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ArticleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.article = self.articles[indexPath.row];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    STArticleVIewController *articleVC = [[STArticleVIewController alloc] init];
    articleVC.article =self.articles[indexPath.row];
    
    [self.navigationController pushViewController:articleVC animated:YES];
    
}



#pragma mark --懒加载
- (AFHTTPSessionManager *)mgr{
    if (_mgr == nil) {
        _mgr = [AFHTTPSessionManager manager];
    }
    return _mgr;
}



@end
