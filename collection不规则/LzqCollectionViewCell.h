//
//  LzqCollectionViewCell.h
//  collection不规则
//
//  Created by dllo on 15/9/22.
//  Copyright (c) 2015年 刘志强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "UIImageView+WebCache.h"
@interface LzqCollectionViewCell : UICollectionViewCell
@property (nonatomic,retain)UIImageView *myimage;
@property (nonatomic,retain)Model *model;
@end
