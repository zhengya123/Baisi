//
//  SegmentVC.m
//  Baisi
//
//  Created by 中商国际 on 2017/10/16.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "SegmentVC.h"
#import "QNPersonalHeaderView.h"
#import "PersonalHeaderView.h"
#import "FJSegmentedBaseViewController.h"

@interface SegmentVC ()<PersonHeaderViewDelegate>
@property (nonatomic, strong) PersonalHeaderView * headerV;
@end
@implementation SegmentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupControls];
    
    [self configViewControllerModelArray];
}

- (void)brnClick{
    [self.navigationController popViewControllerAnimated:YES];

}
// 设置 子控件
- (void)setupControls {
    
    self.navigationItem.title = @"系列详情";
    
    //self.tableView.tableHeaderView = [QNPersonalHeaderView createView];
    self.tableView.tableHeaderView = self.headerV;
    self.tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.tableViewOffsetY = [self.tableView rectForSection:0].origin.y + 10;
    });
}

// 配置 课程 列表  数组
- (void)configViewControllerModelArray {
    self.configModelArray = [NSMutableArray array];
    [self.configModelArray addObject:[[FJConfigModel alloc] initWithTitleStr:@"系列简介" viewControllerStr:@"FJFirstShopViewController"]];
    [self.configModelArray addObject:[[FJConfigModel alloc] initWithTitleStr:@"系列课程" viewControllerStr:@"FJSecondShopViewController"]];
}

#pragma mark --- system delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FJSegementContentCell *doubleDeckCell = [FJSegementContentCell cellWithTableView:tableView];
    doubleDeckCell.configModelArray = self.configModelArray;
    doubleDeckCell.tagSectionViewHeight = 40.0f;
    doubleDeckCell.selectedIndex = 1;
    
    return doubleDeckCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [UIScreen mainScreen].bounds.size.height;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}


#pragma mark - lan
- (PersonalHeaderView *)headerV{
    if (_headerV == nil) {
        _headerV = [PersonalHeaderView new];
        _headerV.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
        _headerV.backgroundColor = [UIColor blueColor];
        _headerV.delegate = self;
    }
    return _headerV;
}
@end
