//
//  HHAllMemberViewController.m
//  Baisi
//
//  Created by dqong on 2017/4/12.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "HHAllMemberViewController.h"
#import "HHAllMemberViewCell.h"
#import "HHAllMemberVCModel.h"
#import "HHjiujiuDetailViewController.h"
@interface HHAllMemberViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray   * dataArray;


@end

@implementation HHAllMemberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:243/255.0 alpha:1.0];
    self.navigationItem.title = @"成员列表";

    [self createUI];
    NSArray * arr = @[
                      @{@"member_id":@"1",@"name":@"张三1",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"2",@"name":@"张三2",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"3",@"name":@"张三3",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"4",@"name":@"张三4",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"5",@"name":@"张三5",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"6",@"name":@"张三6",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"7",@"name":@"张三7",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"8",@"name":@"张三8",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"9",@"name":@"张三9",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"10",@"name":@"张三10",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"11",@"name":@"张三11",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"12",@"name":@"张三12",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"13",@"name":@"张三13",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"14",@"name":@"张三14",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"15",@"name":@"张三15",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"16",@"name":@"张三16",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"17",@"name":@"张三17",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"18",@"name":@"张三18",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"19",@"name":@"张三19",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"20",@"name":@"张三20",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"21",@"name":@"张三21",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"22",@"name":@"张三22",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"23",@"name":@"张三23",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"16",@"name":@"张三16",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"17",@"name":@"张三17",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"18",@"name":@"张三18",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"19",@"name":@"张三19",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"20",@"name":@"张三20",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"21",@"name":@"张三21",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"22",@"name":@"张三22",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"23",@"name":@"张三23",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"16",@"name":@"张三16",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"17",@"name":@"张三17",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"18",@"name":@"张三18",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"19",@"name":@"张三19",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"20",@"name":@"张三20",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"21",@"name":@"张三21",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"22",@"name":@"张三22",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"23",@"name":@"张三23",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"},
                      @{@"member_id":@"24",@"name":@"张三24",@"img":@"http://img.ys7.com//group1/M00/EA/70/CmGCA1jt4DWAS0JvAACcPE1A69g226.jpg"}
                      ];
    for (NSDictionary * dic in arr) {
        HHAllMemberVCModel * model = [HHAllMemberVCModel setModelWithDic:dic];
        [self.dataArray addObject:model];
    }
    HHAllMemberVCModel * model = [HHAllMemberVCModel setModelWithDic:@{@"member_id":@"add",@"name":@"",@"img":@"mine-icon-manhua"}];
    [self.dataArray addObject:model];
    [self.collectionView reloadData];
}
#pragma mark - UI
-(void)createUI{
    [self.view addSubview:self.collectionView];

}

#pragma mark - collectionViewDelegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;

}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HHAllMemberViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    HHAllMemberVCModel * model = self.dataArray[indexPath.row];
    cell.vcmodel = model;
    return cell;

}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
HHAllMemberVCModel * model = self.dataArray[indexPath.row];
    
    if ([model.member_id isEqualToString:@"add"]) {
        NSLog(@"点击了添加按钮");
    }else{
        HHjiujiuDetailViewController * detail = [HHjiujiuDetailViewController new];
        [self.navigationController pushViewController:detail animated:YES];
        ZYLog(@"id == %@ -- name == %@",model.member_id,model.name);
    }


}
#pragma mark - layout delegate
//设置每个cell(item)的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(SCREEN_W/5, SCREEN_W/5 + 20);

}
//描述的是所有cell最外边组成的视图与collectionView上、左、下、右的间隔
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);

}
#pragma mark - lan
-(UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout * flow = [[UICollectionViewFlowLayout alloc]init];
        [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
        flow.minimumLineSpacing = 0;
        flow.minimumInteritemSpacing = 0;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) collectionViewLayout:flow];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.bounces = NO;
        [_collectionView registerClass:[HHAllMemberViewCell class] forCellWithReuseIdentifier:@"CollectionCell"];
    }
    return _collectionView;

}
-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}
@end
