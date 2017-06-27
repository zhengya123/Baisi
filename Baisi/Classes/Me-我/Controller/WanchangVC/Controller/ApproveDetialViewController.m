//
//  ApproveDetialViewController.m
//  Baisi
//
//  Created by dqong on 2017/6/27.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "ApproveDetialViewController.h"
#import "ApproveDetailLeaveTitle.h"
#import "ApproveLeaveModel.h"
#import "ApproveGoOutTitle.h"
#import "ApproveGoOutModel.h"
#import "ApproveReceiveTitle.h"
@interface ApproveDetialViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) ApproveDetailLeaveTitle * tableViewHeaderTitle_approve;
@property (nonatomic, strong) ApproveGoOutTitle       * tableViewHeaderTitle_GoOut;
@property (nonatomic, strong) ApproveReceiveTitle     * tableViewHeaderTitle_Receive;

@end

@implementation ApproveDetialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = [NSString stringWithFormat:@"%@%@",self.UserName,self.approveTitle];
    [self createUI];
}
#pragma Mark- 加载UI
- (void)createUI{
    [self.view addSubview:self.tableView];
    if ([self.Type isEqualToString:@"1"]) {
        self.tableView.tableHeaderView = self.tableViewHeaderTitle_approve;
    }else if ([self.Type isEqualToString:@"2"]){
        self.tableView.tableHeaderView = self.tableViewHeaderTitle_Receive;
    
    }else if ([self.Type isEqualToString:@"3"]){
    
        self.tableView.tableHeaderView = self.tableViewHeaderTitle_GoOut;
    }
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([self.Type isEqualToString:@"1"]) {
        NSDictionary * dic1 = @{
                                @"department":@"北京必应科技",
                                @"approveType":@"事假",
                                @"beginTime":@"2017-03-15",
                                @"endTime":@"2017-03-15",
                                @"approveNum":@"1",
                                @"approveReason":@"我试试这个换行可以吗，我试试这个换行可以吗，我试试这个换行可以吗，我试试这个换行可以吗，我试试这个换行可以吗，我试试这个换行可以吗，我试试这个换行可以吗我试试这个换行可以吗"
                                };
        ApproveLeaveModel * model = [ApproveLeaveModel setPartmentWithDic:dic1];
        [self.tableViewHeaderTitle_approve changeFrameWithReasonText:model];
        self.tableViewHeaderTitle_approve.frame = CGRectMake(0, 0, SCREEN_W,  30 * 5 + 30 + [self.tableViewHeaderTitle_approve returnHeight] + 10);

    }else if ([self.Type isEqualToString:@"2"]){
        NSDictionary * dic3 = @{
                                @"department":@"总裁办",
                                @"goodsUse":@"更多",
                                @"goodsName":@"哈哈",
                                @"goodsNum":@"4"
                                };
        ApproveReceiveModel * model = [ApproveReceiveModel setPartmentWithDicc:dic3];
        [self.tableViewHeaderTitle_Receive setTextWithModel:model];
        self.tableViewHeaderTitle_Receive.frame = CGRectMake(0, 0, SCREEN_W, [self.tableViewHeaderTitle_Receive returnFrameHeight]);
    
    }else if ([self.Type isEqualToString:@"3"]){
        NSDictionary * dic2 = @{
                                @"department":@"北京必应科技",
                                @"beginTime":@"2017-03-15 10:20",
                                @"endTime":@"2017-03-15 10:20",
                                @"GoOutTime":@"1",
                                @"GoOutReason":@"我试试这个换行可以吗"
                                };
        ApproveGoOutModel * model = [ApproveGoOutModel setPartmentWith:dic2];
        [self.tableViewHeaderTitle_GoOut changeFrameWithReasonText:model];
        self.tableViewHeaderTitle_GoOut.frame = CGRectMake(0, 0, SCREEN_W, 30 * 4 + 30 + [self.tableViewHeaderTitle_GoOut returnHeight]);
    
    }
}
#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = @"测试";
    return cell;

}

#pragma mark - lan
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}
- (ApproveDetailLeaveTitle *)tableViewHeaderTitle_approve{
    if (_tableViewHeaderTitle_approve == nil) {
        _tableViewHeaderTitle_approve = [ApproveDetailLeaveTitle new];
        _tableViewHeaderTitle_approve.backgroundColor = [UIColor colorWithRed:253/255.0 green:189/255.0 blue:192/255.0 alpha:1.0];
    }
    return _tableViewHeaderTitle_approve;
}
- (ApproveReceiveTitle *)tableViewHeaderTitle_Receive{
    if (_tableViewHeaderTitle_Receive == nil) {
        _tableViewHeaderTitle_Receive = [ApproveReceiveTitle new];
        _tableViewHeaderTitle_Receive.backgroundColor = [UIColor colorWithRed:195/255.0 green:230/255.0 blue:250/255.0 alpha:1.0];
    }
    return _tableViewHeaderTitle_Receive;

}
- (ApproveGoOutTitle *)tableViewHeaderTitle_GoOut{
    if (_tableViewHeaderTitle_GoOut == nil) {
        _tableViewHeaderTitle_GoOut = [ApproveGoOutTitle new];
        _tableViewHeaderTitle_GoOut.backgroundColor = [UIColor colorWithRed:228/255.0 green:191/255.0 blue:224/255.0 alpha:1.0];
    }
    return _tableViewHeaderTitle_GoOut;
}
@end
