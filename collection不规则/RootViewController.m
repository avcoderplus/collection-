//
//  RootViewController.m
//  collection不规则
//
//  Created by dllo on 15/9/22.
//  Copyright (c) 2015年 刘志强. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LzqCollectionViewFlowLayout *flow = [[LzqCollectionViewFlowLayout alloc]init];
    flow.mydelegate = self;
    self.allArray = [NSMutableArray array];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:[[UIScreen mainScreen] bounds] collectionViewLayout:flow];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = [UIColor yellowColor];
    
    [self.collectionView registerClass:[LzqCollectionViewCell class] forCellWithReuseIdentifier:@"reuse"];
    
    
    NSString *filepath = [[NSBundle mainBundle]pathForResource:@"Data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filepath];
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
    self.array = [NSMutableArray array];
    for (NSDictionary *dic in arr) {
        Model *model = [[Model alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        [self.array addObject:model];
    }
    
    
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"执行顺序1111111111");
    
    return self.array.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"reuse";
    
    LzqCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    Model *model = [self.array objectAtIndex:indexPath.row];
    // cell.backgroundColor = [UIColor greenColor];
    
    //    if (indexPath.row % 2 == 0) {
    //
    //        cell.backgroundColor = [UIColor redColor];
    //    }
    
    cell.model = model;
    return cell;
}




-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //返回网路数据上每个item的宽和高
    Model *model = [self.array objectAtIndex:indexPath.row];
    return CGSizeMake( [model.width floatValue], [model.height floatValue]);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
