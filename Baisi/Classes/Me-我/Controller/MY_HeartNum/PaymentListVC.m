//
//  PaymentListVC.m
//  Baisi
//
//  Created by dqong on 2017/4/12.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "PaymentListVC.h"

@interface PaymentListVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIView * tableHeaderView;
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation PaymentListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.title = @"充值服务";
    [self createUI];
}

-(void)createUI{

    
    
    
    
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.tableHeaderView;


}
#pragma mark - TableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    cell.textLabel.text = @"测试";
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}
#pragma mark - lan
-(UIView *)tableHeaderView{
    if (_tableHeaderView == nil) {
        _tableHeaderView = [UIView new];
        _tableHeaderView.backgroundColor = [UIColor whiteColor];
    }
    return _tableHeaderView;
}
-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}
@end
