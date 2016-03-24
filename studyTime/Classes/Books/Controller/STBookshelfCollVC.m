//
//  STBookshelfCollVC.m
//  studyTime
//
//  Created by chenzilu on 16/3/16.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import "STBookshelfCollVC.h"
#import "STBook.h"
#import "STBookShelfLayout.h"
#import "STBookCell.h"
#import <MJExtension.h>
#import <SVProgressHUD.h>
@interface STBookshelfCollVC ()
@property (nonatomic, strong) AFHTTPSessionManager *mgr;
@property (nonatomic, strong) NSMutableArray *books;
@end

@implementation STBookshelfCollVC

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init{
    
    STBookShelfLayout *bookshelf = [[STBookShelfLayout alloc] init];
    
    return [super initWithCollectionViewLayout:bookshelf];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCollectionV];
    [self loadBooks];
    
}
- (void)setupCollectionV{
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, STTabBarH, 0);
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([STBookCell class]) bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.backgroundColor = SBColor(239, 239, 244, 1);
}

- (void)loadBooks{
    [self.mgr.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    static NSString * const baseURL = @"http://i.dxy.cn/bbs/bbsapi/mobile";
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"productIds"] = @"cn.dxy.bone.book51,cn.dxy.bone.book63,cn.dxy.bone.book66,cn.dxy.bone.book86";
    parameters[@"s"] = @"book_buy_apple_list";
    parameters[@"appType"] = @1;
    
    [self.mgr GET:baseURL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.books = [STBook mj_objectArrayWithKeyValuesArray:responseObject[@"items"]];
        
        [self.collectionView reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"请检查网络..."];
        
    }];
    
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.books.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    STBookCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.book  = self.books[indexPath.item];
    return cell;
}

#pragma mark --懒加载
- (AFHTTPSessionManager *)mgr{
    if (_mgr == nil) {
        _mgr = [AFHTTPSessionManager manager];
    }
    return _mgr;
}

 
@end
