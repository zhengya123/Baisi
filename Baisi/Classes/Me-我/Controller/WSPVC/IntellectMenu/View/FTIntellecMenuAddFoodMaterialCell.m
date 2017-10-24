//
//  FTIntellecMenuAddFoodMaterialCell.m
//  Baisi
//
//  Created by 中商国际 on 2017/10/24.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "FTIntellecMenuAddFoodMaterialCell.h"
#import "FTMaterialCell.h"
#import "FTIntellecMenuMaterialModel.h"
#define BGColor [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:0.8];
@interface FTIntellecMenuAddFoodMaterialCell ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, strong) UIView * linV;
@property (nonatomic, strong) UIButton * addMtericalBtn;
@property (nonatomic, strong) UIButton * clearBtn;
@property (nonatomic, strong) UIView   * middleV;
@end

@implementation FTIntellecMenuAddFoodMaterialCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}
- (void)createUI{
    [self.contentView addSubview:self.tableView];

}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.contentView.backgroundColor = BGColor;
    self.tableView.frame = CGRectMake(10, 0, self.frame.size.width - 20, self.frame.size.height);
    self.titleView.frame = CGRectMake(0, 0, self.frame.size.width - 20, 60);
    self.footView.frame  = CGRectMake(0, 0, self.frame.size.width - 20, 60);
    self.tableView.tableHeaderView = self.titleView;
    self.tableView.tableFooterView = self.footView;
    [self addTitleView];
    [self addFootView];
    [self.dataArray removeAllObjects];
    for (NSDictionary * dic in self.dataArr) {
        FTIntellecMenuMaterialModel * model = [FTIntellecMenuMaterialModel setParameter:dic];
        [self.dataArray addObject:model];
    }

       [self.tableView reloadData];
}
- (void)addTitleView{


}
- (void)addFootView{
    self.linV.frame = CGRectMake(0, 0, self.footView.frame.size.width, 2);
    self.addMtericalBtn.frame = CGRectMake(0, CGRectGetMaxY(self.linV.frame), self.footView.frame.size.width/2, self.footView.frame.size.height - CGRectGetMaxY(self.linV.frame));
    self.clearBtn.frame = CGRectMake(CGRectGetMaxX(self.addMtericalBtn.frame) + 1, CGRectGetMaxY(self.linV.frame), self.footView.frame.size.width/2 - 1, self.footView.frame.size.height - CGRectGetMaxY(self.linV.frame));
    self.middleV.frame = CGRectMake(CGRectGetMaxX(self.addMtericalBtn.frame), self.footView.frame.size.height/4, 1, self.footView.frame.size.height/2);
    [self.footView addSubview:self.linV];
    [self.footView addSubview:self.addMtericalBtn];
    [self.footView addSubview:self.clearBtn];
    [self.footView addSubview:self.middleV];

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FTMaterialCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    FTIntellecMenuMaterialModel * model = self.dataArray[indexPath.row];
    cell.model = model;
    return cell;

}
#pragma mark - 添加食材按钮
- (void)addMaterialClick:(UIButton *)btn{
    ZYLog(@"添加食材按钮点击");
}
- (void)clearClick:(UIButton *)btn{
    ZYLog(@"点击清空按钮");
}
#pragma mark - tableView
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[FTMaterialCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}
- (NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}
- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}
- (UIView *)titleView{
    if (_titleView == nil) {
        _titleView = [UIView new];
        _titleView.backgroundColor = [UIColor yellowColor];
    }
    return _titleView;
}
- (UIView *)footView{
    if (_footView == nil) {
        _footView = [UIView new];
        _footView.backgroundColor = [UIColor whiteColor];
    }
    return _footView;
}
- (UIView *)linV{
    if(_linV == nil){
        _linV = [UIView new];
        _linV.backgroundColor = BGColor;
    }
    return _linV;
}
- (UIView *)middleV{
    if (_middleV == nil) {
        _middleV = [UIView new];
        _middleV.backgroundColor = BGColor;
    }
    return _middleV;
}
- (UIButton *)addMtericalBtn{
    if (_addMtericalBtn == nil) {
        _addMtericalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addMtericalBtn setTitle:@"添加其他食材" forState:UIControlStateNormal];
        [_addMtericalBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_addMtericalBtn addTarget:self action:@selector(addMaterialClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addMtericalBtn;
}
- (UIButton *)clearBtn{
    if (_clearBtn == nil) {
        _clearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_clearBtn setTitle:@"清空" forState:UIControlStateNormal];
        [_clearBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_clearBtn addTarget:self action:@selector(clearClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clearBtn;
}
@end
