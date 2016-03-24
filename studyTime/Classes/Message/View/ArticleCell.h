//
//  ArticleCell.h
//  test
//
//  Created by chenzilu on 16/3/2.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Article;

UIKIT_EXTERN CGFloat const ArticleCellH;

@interface ArticleCell : UITableViewCell
@property (nonatomic, strong) Article *article;
@end
