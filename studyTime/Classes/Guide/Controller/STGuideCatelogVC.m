//
//  STGuideCatelogVC.m
//  studyTime
//
//  Created by chenzilu on 16/3/16.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import "STGuideCatelogVC.h"
#import "STGuideList.h"
#import <MJExtension.h>
#import <SVProgressHUD.h>

@interface STGuideCatelogVC ()
@property (nonatomic, strong) AFHTTPSessionManager *mgr;
@property (nonatomic, strong) NSMutableArray *guideLists;
@end

@implementation STGuideCatelogVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableV];
    [self loadList];
   
}
- (void)setupTableV{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"GuideList"];
    self.tableView.rowHeight = 58;
    self.tableView.backgroundColor = SBColor(239, 239, 244, 1);
}
- (void)loadList{
    [self.mgr.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    static NSString * const baseURL = @"http://www.dxy.cn/webservices/app-department";
    
    
    [self.mgr GET:baseURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [STGuideList mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{@"ID" : @"id"};
        }];
        
        NSMutableArray *listArr = [STGuideList mj_objectArrayWithKeyValuesArray:responseObject[@"message"][0][@"children"]];
        
        self.guideLists = listArr;

        [self.tableView reloadData];
 
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"请检查网络..."];

    }];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.guideLists.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GuideList"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = self.tableView.backgroundColor;
    STGuideList *list = self.guideLists[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"guide_news"];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.text = list.name;
    return cell;
}
#pragma mark -- 懒加载

- (AFHTTPSessionManager *)mgr{
    if (_mgr == nil) {
        _mgr = [AFHTTPSessionManager manager];
    }
    return _mgr;
}



@end
