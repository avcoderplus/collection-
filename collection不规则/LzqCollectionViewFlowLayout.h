//
//  LzqCollectionViewFlowLayout.h
//  collection不规则
//
//  Created by dllo on 15/9/22.
//  Copyright (c) 2015年 刘志强. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol myFlowLayout <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;


@end

@interface LzqCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic,assign)id<myFlowLayout>mydelegate;
@property (nonatomic,retain)NSMutableArray *array;
@property (nonatomic,assign)CGFloat maxHeight;


@end
