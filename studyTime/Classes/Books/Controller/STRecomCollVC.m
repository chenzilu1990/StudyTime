//
//  STRecomCollVC.m
//  studyTime
//
//  Created by chenzilu on 16/3/16.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import "STRecomCollVC.h"
#import "STBookShelfLayout.h"
#import "STCollHeadView.h"
#import "STCollHeadView.h"
#import "STBook.h"
#import "STBookGroup.h"
#import "STBookCell.h"
#import <MJExtension.h>
#import <SVProgressHUD.h>
@interface STRecomCollVC ()
@property (nonatomic, strong) AFHTTPSessionManager *mgr;
@property (nonatomic, strong) NSMutableArray *bookGroups;
@end

@implementation STRecomCollVC

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init{
    STBookShelfLayout *bookshelf = [[STBookShelfLayout alloc] init];
    bookshelf.isHeadV = YES;
    return [super initWithCollectionViewLayout:bookshelf];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCollectionV];
    [self loadEditorBooks];
    [self loadHotBooks];
    
}

- (void)setupCollectionV{
 
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([STBookCell class]) bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, STTabBarH, 0);
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([STCollHeadView class]) bundle:nil] forSupplementaryViewOfKind:@"head" withReuseIdentifier:@"head"];
    self.collectionView.backgroundColor = SBColor(239, 239, 244, 1);
}

- (void)loadEditorBooks{
    [self.mgr.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    static NSString * const baseURL = @"http://d.dxy.cn/book/api/read";
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"action"] = @"EditorRecommend";
    parameters[@"size"] = @6;
    parameters[@"tpg"] = @1;
    
    [self.mgr GET:baseURL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        [Article mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
//            return @{@"ID" : @"id"};
//        }];
        
        [STBookGroup mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"books" : [STBook class]};
            
        }];
        
        
        [self.bookGroups addObject:[STBookGroup mj_objectWithKeyValues:responseObject]];

        [self.collectionView reloadData];


    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"请检查网络..."];

    }];

}

- (void)loadHotBooks{
    static NSString * const baseURL = @"http://d.dxy.cn/book/api/read";
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"action"] = @"Recommend";
    parameters[@"size"] = @6;
    parameters[@"tpg"] = @1;
    
    [self.mgr GET:baseURL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //        [Article mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        //            return @{@"ID" : @"id"};
        //        }];
        
        [STBookGroup mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"books" : [STBook class]};
            
        }];
        
        [self.bookGroups addObject:[STBookGroup mj_objectWithKeyValues:responseObject]];

            [self.collectionView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"请检查网络..."];
        
    }];
    

}





- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return self.bookGroups.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    

    if (self.bookGroups.count > section ) {
        
        return [self.bookGroups[section] books].count;
    }else{
        return 0;
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    STBookCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSArray *books = [self.bookGroups[indexPath.section] books];
    cell.book = books[indexPath.item];

    

    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    STCollHeadView *view = [collectionView dequeueReusableSupplementaryViewOfKind:@"head" withReuseIdentifier:@"head" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        
        view.titleLabel.text = @"热门";
        
    }else{
        view.titleLabel.text = @"推荐";
        
    }

    return view;
}

#pragma mark --懒加载
- (AFHTTPSessionManager *)mgr{
    if (_mgr == nil) {
        _mgr = [AFHTTPSessionManager manager];
    }
    return _mgr;
}

- (NSMutableArray *)bookGroups{
    if (_bookGroups == nil) {
        
        _bookGroups = [NSMutableArray array];
        
    }
    return _bookGroups;
}

@end
