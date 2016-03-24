//
//  ArticleCell.m
//  test
//
//  Created by chenzilu on 16/3/2.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import "ArticleCell.h"
#import <UIImageView+WebCache.h>
#import "Article.h"

CGFloat const ArticleCellH = 84;
@interface ArticleCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *shareCount;
@property (weak, nonatomic) IBOutlet UILabel *creatAtTime;

@end


@implementation ArticleCell

- (void)setArticle:(Article *)article{
    _article = article;
    

    [self.imageV sd_setImageWithURL:[NSURL URLWithString:article.imgpath]];
    
    self.titleLabel.text = article.title;

//    
//    if ([article.numOfShared isEqualToString:@"0"] ) {
//        self.shareCount.text = nil;
//    }else{
//        
//        self.shareCount.text = [NSString stringWithFormat:@"%@分享",article.numOfShared];
//    }
    
   
    if (article.voteid) {
        self.creatAtTime.text  = @"问答";
        self.creatAtTime.backgroundColor = [UIColor orangeColor];
        self.creatAtTime.textColor = [UIColor whiteColor];

    }else{
        
        self.creatAtTime.text = [article.articleDate substringToIndex:10];
        self.creatAtTime.backgroundColor = [UIColor clearColor];
        self.creatAtTime.textColor = [UIColor grayColor];
    }
    
   

}

- (void)awakeFromNib{

}

@end
