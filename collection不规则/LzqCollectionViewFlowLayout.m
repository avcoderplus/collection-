//
//  LzqCollectionViewFlowLayout.m
//  collection不规则
//
//  Created by dllo on 15/9/22.
//  Copyright (c) 2015年 刘志强. All rights reserved.
//

#import "LzqCollectionViewFlowLayout.h"




@implementation LzqCollectionViewFlowLayout


- (void)prepareLayout
{
    self.maxHeight = 0;
    self.array = [NSMutableArray array];
    CGFloat LeftY = 0;
    CGFloat RightY = 0;
    CGFloat maxLeft = 0;
    CGFloat maxRight = 0;
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    for (int i = 0; i < count; i++) {
        NSIndexPath *index = [NSIndexPath indexPathForItem:i inSection:0];
        
        UICollectionViewLayoutAttributes  *attri = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:index];
        float offsecX = 0;
        
        if (i%2 == 0)
        {
            offsecX = 5;
        }
        
        
        else
        {
            offsecX = 190;
        }

        CGSize itemSize = [self.mydelegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:index];
        if (i%2 == 0) {
            attri.frame = CGRectMake(offsecX,LeftY, itemSize.width,itemSize.height);
            
            maxLeft = LeftY +itemSize.height;
            LeftY += itemSize.height+5;
        }
        else
        {
            attri.frame = CGRectMake(offsecX, RightY, itemSize.width, itemSize.height);
            maxRight = RightY +itemSize.height;
            RightY += itemSize.height +5;
        }
        self.maxHeight = MAX(self.maxHeight, CGRectGetMaxY(attri.frame));
        
        //存入数组中
        [self.array addObject:attri];

        
        
        
    }
}


//
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (int i= 0; i< self.array.count; i++) {
        UICollectionViewLayoutAttributes *att = [self.array objectAtIndex:i];
        if (CGRectIntersectsRect(rect, att.frame))
        {
            [arr addObject:att];
        }
        
    }
    return arr;
    
    
    
}
- (CGSize)collectionViewContentSize
{
    NSLog(@"===%f",self.maxHeight);
    
    return CGSizeMake(self.collectionView.frame.size.width, self.maxHeight);
}


@end
