//
//  RelationSelectView.m
//  Baisi
//
//  Created by dqong on 2017/9/21.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "RelationSelectView.h"
#import "RelationShipCell.h"

@interface RelationSelectView ()<
UICollectionViewDelegate,
UICollectionViewDataSource>



@end
@implementation RelationSelectView

+ (RelationSelectView *)shareView{
    static RelationSelectView * relationView = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        relationView = [[RelationSelectView alloc]init];
    });
    return relationView;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.frame = [[UIScreen mainScreen] bounds];
        self.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.baseView];
        [self.baseView addSubview:self.titlelabel];
        [self.baseView addSubview:self.cancelBtn];
        [self.baseView addSubview:self.fatherBtn];
        [self.baseView addSubview:self.monthBtn];
        [self.baseView addSubview:self.collectionView];
        
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
}
- (void)showWithView:(UIView *)view Delegate:(id<RelationShipDelegate>)delegate{

    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.7;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [self.baseView.layer addAnimation:animation forKey:nil];
    [view addSubview:self];
    self.delegate = delegate;
    self.baseView.frame = CGRectMake(40, self.frame.size.height/2 - 150, self.frame.size.width - 80, 130 + self.dataArrays.count/4 * 40 + 40);
    self.baseView.backgroundColor = [UIColor whiteColor];
    self.cancelBtn.frame = CGRectMake(self.baseView.frame.size.width - 40, 5, 30, 30);
    self.titlelabel.frame = CGRectMake(0, 20, self.baseView.frame.size.width, 20);
    self.fatherBtn.frame = CGRectMake(self.baseView.frame.size.width/4 - 30, CGRectGetMaxY(self.titlelabel.frame) + 30, 60, 30);
    self.monthBtn.frame = CGRectMake(self.baseView.frame.size.width/4 * 3 - 30, CGRectGetMaxY(self.titlelabel.frame) + 30, 60, 30);
    self.collectionView.frame = CGRectMake(0, CGRectGetMaxY(self.fatherBtn.frame) + 10, self.baseView.frame.size.width, self.dataArrays.count/4 * 40 + 40);
    [self.collectionView reloadData];
}
- (void)hides{

    [self removeFromSuperview];
    

}
- (void)cancelBtnClick:(UIButton *)btn{
    [self hides];

}
- (void)fatherClick:(UIButton *)btn{
    [self.delegate selectRelation:@"爸爸"];
    [self hides];
}
- (void)monthClick:(UIButton *)btn{
    [self.delegate selectRelation:@"妈妈"];
    [self hides];
}


#pragma mark - collectionViewDelegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    ZYLog(@"%lu",(unsigned long)self.dataArrays.count);
    return self.dataArrays.count;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    RelationShipCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    cell.relationlabel.text = [self.dataArrays[indexPath.row] objectForKey:@"Relation"];
    return cell;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ZYLog(@"点击了collection的 == %@",[self.dataArrays[indexPath.row] objectForKey:@"Relation"]);
    
    [self.delegate selectRelation:[self.dataArrays[indexPath.row] objectForKey:@"Relation"]];
    [self hides];
    
    
}
#pragma mark - layout delegate
//设置每个cell(item)的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(self.baseView.frame.size.width/4,40);
    
}
//描述的是所有cell最外边组成的视图与collectionView上、左、下、右的间隔
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0,0, 0, 0);
    
}
#pragma mark - lan
-(UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout * flow = [[UICollectionViewFlowLayout alloc]init];
        [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
        flow.minimumLineSpacing = 0;
        flow.minimumInteritemSpacing = 0;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 80, self.baseView.frame.size.width, self.dataArrays.count/4 * 40 + 40) collectionViewLayout:flow];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.bounces = NO;
        [_collectionView registerClass:[RelationShipCell class] forCellWithReuseIdentifier:@"CollectionViewCell"];
    }
    return _collectionView;
    
}
-(NSArray *)dataArrays{
    if (_dataArrays == nil) {
        _dataArrays = @[
                        @{@"Relation":@"爷爷"},
                        @{@"Relation":@"奶奶"},
                        @{@"Relation":@"外公"},
                        @{@"Relation":@"外婆"},
                        @{@"Relation":@"叔叔"},
                        @{@"Relation":@"婶婶"},
                        @{@"Relation":@"舅父"},
                        @{@"Relation":@"舅妈"},
                        @{@"Relation":@"姑父"},
                        @{@"Relation":@"姑妈"},
                        @{@"Relation":@"姨夫"},
                        @{@"Relation":@"姨妈"},
                        @{@"Relation":@"哥哥"},
                        @{@"Relation":@"姐姐"},
                        @{@"Relation":@"其他"}
                        ];
    }
    return _dataArrays;
}

#pragma mark - lan
- (UIView *)baseView{
    if (_baseView == nil) {
        _baseView = [UIView new];
        _baseView.layer.masksToBounds = YES;
        _baseView.layer.cornerRadius  = 8;
    }
    
    return _baseView;
}
- (UIButton *)cancelBtn{
    if (_cancelBtn == nil) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelBtn setTitle:@"X" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}
- (UILabel *)titlelabel{
    if (_titlelabel == nil) {
        _titlelabel = [UILabel new];
        _titlelabel.textAlignment = NSTextAlignmentCenter;
        _titlelabel.text = @"选择与孩子的关系";
        _titlelabel.font = [UIFont systemFontOfSize:17];
    }
    return _titlelabel;
}
- (UIButton *)fatherBtn{
    if (_fatherBtn == nil) {
        _fatherBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_fatherBtn setTitle:@"爸爸" forState:UIControlStateNormal];
        [_fatherBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _fatherBtn.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
        _fatherBtn.layer.masksToBounds = YES;
        _fatherBtn.layer.cornerRadius  = 14;
        [_fatherBtn addTarget:self action:@selector(fatherClick:) forControlEvents:UIControlEventTouchUpInside];
    
    }
    return _fatherBtn;
}
- (UIButton *)monthBtn{
    if (_monthBtn == nil) {
        _monthBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_monthBtn setTitle:@"妈妈" forState:UIControlStateNormal];
        [_monthBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _monthBtn.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
        _monthBtn.layer.masksToBounds = YES;
        _monthBtn.layer.cornerRadius  = 14;
        [_monthBtn addTarget:self action:@selector(monthClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _monthBtn;
}

@end
