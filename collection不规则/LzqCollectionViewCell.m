//
//  LzqCollectionViewCell.m
//  collection不规则
//
//  Created by dllo on 15/9/22.
//  Copyright (c) 2015年 刘志强. All rights reserved.
//

#import "LzqCollectionViewCell.h"

@implementation LzqCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatSubViews];
    }
    return self;
}


- (void)creatSubViews
{
    self.myimage = [[UIImageView alloc]initWithFrame:self.contentView.frame];
    self.myimage.image= [UIImage imageNamed:@"placeHoderImage"];
    [self.contentView addSubview:self.myimage];
    
    
}


- (void)setModel:(Model *)model
{
    if (_model != model)
    {
        _model = model;
    }
    NSURL *url = [NSURL URLWithString:model.thumbURL];
    [self.myimage  sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeHoderImage"]];
    
    
}



@end
