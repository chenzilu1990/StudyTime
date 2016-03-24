//
//  STBookwCell.m
//  studyTime
//
//  Created by chenzilu on 16/3/20.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import "STBookCell.h"

#import <UIImageView+WebCache.h>

#import "STBook.h"

@interface STBookCell ()
@property (weak, nonatomic) IBOutlet UIImageView *coverImgV;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *authorLab;

@end



@implementation STBookCell


- (void)setBook:(STBook *)book{
    _book = book;
    [self.coverImgV sd_setImageWithURL:[NSURL URLWithString:book.cover] placeholderImage:[UIImage imageNamed:@" 55_n"]];
    
    self.titleLab.text = book.title;
    self.authorLab.text = book.author;
    
}

- (void)awakeFromNib {
    // Initialization code
}

@end
