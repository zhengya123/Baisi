//
//  ApproveListViewController.m
//  Baisi
//
//  Created by dqong on 2017/6/27.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "ApproveListViewController.h"
#import "ApproveDetialViewController.h"
@interface ApproveListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArr;
@end

@implementation ApproveListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   self.navigationItem.title = @"请假列表";
    [self.view addSubview:self.tableView];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [self.dataArr[indexPath.row] objectForKey:@"ApproveTitle"];
    return cell;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ApproveDetialViewController * DetailVC = [ApproveDetialViewController new];
    DetailVC.Type = [self.dataArr[indexPath.row] objectForKey:@"Type"];
    DetailVC.UserName = [self.dataArr[indexPath.row] objectForKey:@"name"];
    DetailVC.approveTitle = [self.dataArr[indexPath.row] objectForKey:@"ApproveTitle"];
    [self.navigationController pushViewController:DetailVC animated:YES];

}

- (NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray new];
        
        [_dataArr addObjectsFromArray:@[
                                        @{@"name":@"苍老师",@"ApproveTitle":@"请假数据",@"Type":@"1"},
                                        @{@"name":@"苍老师",@"ApproveTitle":@"物品领用数据",@"Type":@"2"},
                                        @{@"name":@"苍老师",@"ApproveTitle":@"外出数据",@"Type":@"3"},
                                        @{@"name":@"苍老师",@"ApproveTitle":@"通用数据",@"Type":@"4"}
                                        ]];
    }
    return _dataArr;
}
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}
@end
