//
//  RootViewController.h
//  collection不规则
//
//  Created by dllo on 15/9/22.
//  Copyright (c) 2015年 刘志强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LzqCollectionViewFlowLayout.h"
#import "Model.h"
#import "LzqCollectionViewCell.h"
@interface RootViewController : UIViewController <myFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,retain)NSMutableArray *allArray;
@property(nonatomic,retain)UICollectionView *collectionView;
@property (nonatomic,retain)NSMutableArray *array;
@end
