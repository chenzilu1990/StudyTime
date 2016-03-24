//
//  STBookShelfLayout.m
//  coll
//
//  Created by chenzilu on 16/3/19.
//  Copyright © 2016年 chenzilu. All rights reserved.
//

#import "STBookShelfLayout.h"
#define ScreenW  [UIScreen mainScreen].bounds.size.width
#define ScreenH  [UIScreen mainScreen].bounds.size.height


@interface STBookShelfLayout ()
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger  count1;
@property (nonatomic, assign) CGFloat  contentH;

@end


@implementation STBookShelfLayout
static NSInteger const marginW = 15;
static NSInteger const marginH = 44;
static NSInteger const space = 25;
static NSInteger const rank = 3;
static NSInteger const rowSpace = 10;
static NSInteger const height = 175;


//- (void)prepareLayout{
//    [super prepareLayout];
//    self.isHeadV = YES;
//}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    self.contentH = 0;
    NSMutableArray *arrM = [NSMutableArray array];
    
    NSInteger sectionCount = [self.collectionView.dataSource numberOfSectionsInCollectionView:self.collectionView];
    
    for (int j = 0; j < sectionCount; j++) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:j];
        
        UICollectionViewLayoutAttributes *headAtt = [self layoutAttributesForSupplementaryViewOfKind:@"head" atIndexPath:indexPath];
        
        [arrM addObject:headAtt];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];

        
        NSInteger count = [self.collectionView.dataSource collectionView:self.collectionView numberOfItemsInSection:j];
        
         for (int i = 0; i < count; i++) {
            
            NSIndexPath  *index = [NSIndexPath indexPathForItem:i inSection:j];
            
            UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:index];
            
            [arrM addObject:attr];
            
        }
        

        self.contentH += (height + rowSpace) * ((count - 1) / rank) + height + (self.isHeadV ? marginH : 20);
        

    }
    
    
    return arrM;
    
}

- (CGSize)collectionViewContentSize{
    
    return CGSizeMake(0,self.contentH);
}


- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *headAtt = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];

    headAtt.frame = CGRectMake(0,  self.contentH, ScreenW, marginH);
    
    return headAtt;
}


- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
   
    CGFloat width = (ScreenW - (2 * marginW + (rank - 1) * space)) / rank;
    
    CGFloat x =  marginW + (indexPath.item % rank) * (width + space);
    CGFloat y = self.contentH + (self.isHeadV ? marginH : 20) + (indexPath.item / rank) * (height + rowSpace);
    
    attr.frame = CGRectMake(x , y, width, height);
    
    
    return attr;
}


@end
