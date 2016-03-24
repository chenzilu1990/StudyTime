//
//  STSearchViewController.m
//  studyTime
//
//  Created by chenzilu on 16/2/23.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import "STSearchViewController.h"
#import <Masonry.h>
#import "UISearchBar+Common.h"
#import <MJExtension.h>
@interface STSearchViewController ()<UISearchBarDelegate,UISearchControllerDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UISearchBar *searchBar;
@property (nonatomic, weak) UISearchDisplayController *searchController;
@property (nonatomic, strong) NSMutableArray *searchResults;
@end
@implementation STSearchViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self setupSearchBar];
    [self setupSearchController];

}

- (void)setupSearchBar{
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    [searchBar sizeToFit];
    searchBar.delegate = self;
    searchBar.showsCancelButton = YES;
    searchBar.sb_y = 20;
    searchBar.tintColor = [UIColor whiteColor];
    searchBar.placeholder = @" ";
    [searchBar insertBGColor:STLogoColor];
    [searchBar becomeFirstResponder];
    
    [self.navigationController.view addSubview:searchBar];
    
    self.searchBar = searchBar;
}


- (void)setupSearchController{
        UISearchDisplayController *searchVC = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
//        searchVC.searchResultsTableView.contentInset = UIEdgeInsetsMake(CGRectGetHeight(self.searchBar.frame), 0, CGRectGetHeight(self.tabBarController.tabBar.frame), 0);
//        searchVC.searchResultsTableView.tableFooterView = [[UIView alloc] init];
//        [searchVC.searchResultsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        searchVC.searchResultsDataSource = self;
        searchVC.searchResultsDelegate = self;
    self.searchController = searchVC;
}

#pragma mark -- delegate
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    self.searchResults = @[@(1),@(2)];
    [self.searchController.searchResultsTableView reloadData];
    NSLog(@"%@",self.tableView);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
      cell.textLabel.text = @"hahha";
    return cell;
}
@end
