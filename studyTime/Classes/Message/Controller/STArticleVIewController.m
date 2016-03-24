//
//  STArticleVIewController.m
//  studyTime
//
//  Created by chenzilu on 16/3/9.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import "STArticleVIewController.h"
#import "Article.h"
#import <SVProgressHUD.h>
@interface STArticleVIewController ()

@property (nonatomic, strong)IBOutlet UIWebView *webV;
@property (nonatomic, strong) AFHTTPSessionManager *mgr;
@property (nonatomic, strong) NSString *body;
@end

@implementation STArticleVIewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.article.url]];
    [self.webV loadRequest:request];
//    [self loadArticle];
    
}


- (void)loadArticle{
    
    [self.mgr.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    static NSString * const baseURL = @"http://www.dxy.cn/webservices/article";
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"id"] = self.article.ID;
    parameters[@"ac"] = @"058417c6-2724-4002-92b7-0e4462b31bbb";
    parameters[@"deviceName"] = @"iphone";
    parameters[@"hardName"] =@"iphone";
    parameters[@"mc"] = @"01ff1d87d9d8f6258fea36bf8e533783095e3addudidfor7";


    parameters[@"vs"] = @"9.2";
    
    [self.mgr GET:baseURL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.body = responseObject[@"message"][@"body"];

        NSString *js = [NSString stringWithFormat:@"document.write('<img  alt=\"图片1.jpg\" src=\"http://img.dxycdn.com/cms/upload/userfiles/image/2016/03/10/B1457408746_small.jpg\" title=\"\"/>'); document.getElementsByTagName('img').width = %%100" ] ;
        
        [self.webV stringByEvaluatingJavaScriptFromString:js];


    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"请检查网络..."];

    }];
}



#pragma mark -- 懒加载

- (AFHTTPSessionManager *)mgr{
    if (_mgr == nil) {
        _mgr = [AFHTTPSessionManager manager];
    }
    return _mgr;
}
@end
