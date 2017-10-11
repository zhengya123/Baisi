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
#import "ApproveDetailStateCell.h"
#import "ApproveDetailStateModel.h"
#import "ApproveCommonTitle.h"
#import "ApproveCommonModel.h"
@interface ApproveDetialViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) UIView      * tableHeaderViews;
@property (nonatomic, strong) UIImageView * userImageV;
@property (nonatomic, strong) UILabel     * userNameLabel;
@property (nonatomic, strong) UILabel     * userTypeLabel;
@property (nonatomic, strong) ApproveDetailLeaveTitle * approveView;
@property (nonatomic, strong) ApproveGoOutTitle       * GoOutView;
@property (nonatomic, strong) ApproveReceiveTitle     * ReceiveView;
@property (nonatomic, strong) ApproveCommonTitle      * CommonView;
@property (nonatomic, strong) NSMutableArray * dataArr;

@end

@implementation ApproveDetialViewController
{
    
    NSArray * arr;//假数据
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = [NSString stringWithFormat:@"%@%@",self.UserName,self.approveTitle];
    [self createUI];
}
#pragma Mark- 加载UI
- (void)createUI{
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.tableHeaderViews;
    [self.tableHeaderViews addSubview:self.userImageV];
    [self.tableHeaderViews addSubview:self.userNameLabel];
    [self.tableHeaderViews addSubview:self.userTypeLabel];
    self.userImageV.frame = CGRectMake(10, 10, 60, 60);
    self.userNameLabel.frame = CGRectMake(CGRectGetMaxX(self.userImageV.frame) + 10, 10, SCREEN_W - CGRectGetMaxX(self.userImageV.frame) + 10, 30);
    self.userTypeLabel.frame = CGRectMake(CGRectGetMaxX(self.userImageV.frame) + 10, CGRectGetMaxY(self.userNameLabel.frame), SCREEN_W - CGRectGetMaxX(self.userImageV.frame) + 10, 30);
    
    if ([self.Type isEqualToString:@"1"]) {
        
        [self.tableHeaderViews addSubview:self.approveView];
        
    }else if ([self.Type isEqualToString:@"2"]){
        
        [self.tableHeaderViews addSubview:self.ReceiveView];
    
    }else if ([self.Type isEqualToString:@"3"]){
    
        [self.tableHeaderViews addSubview:self.GoOutView];
    }else if ([self.Type isEqualToString:@"4"]){
        [self.tableHeaderViews addSubview:self.CommonView];
    
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
                                @"approveReason":@"去大保健"
                                };
        arr = @[
                @{
                    @"userName":@"苍老师",
                    @"State":@"发起申请",
                    @"Time":@"2017.06.22 12:30",
                    @"type":@"1",@
                    "receiveContent":@""
                    },
                @{
                    @"userName":@"苍老师",
                    @"State":@"正在审核",
                    @"Time":@"",
                    @"type":@"2",
                    @"receiveContent":@""
                    },
                @{
                    @"userName":@"我",
                    @"State":@"审核不通过",
                    @"Time":@"",
                    @"type":@"3",
                    @"receiveContent":@"大保健不带我，拒绝"
                    }
                ];
        ApproveLeaveModel * model = [ApproveLeaveModel setPartmentWithDic:dic1];
        [self.approveView changeFrameWithReasonText:model];
        self.approveView.frame = CGRectMake(0, 80, SCREEN_W,  [self.approveView returnHeights]);
        self.tableHeaderViews.frame = CGRectMake(0, 0, SCREEN_W, [self.approveView returnHeights] + 80);
        
        
    }else if ([self.Type isEqualToString:@"2"]){
        NSDictionary * dic2 = @{
                                @"department":@"总裁办",
                                @"goodsUse":@"更多",
                                @"goodsName":@"哈哈",
                                @"goodsNum":@"4"
                                };
        arr = @[
                @{
                    @"userName":@"苍老师",
                    @"State":@"发起申请",
                    @"Time":@"2017.06.22 12:30",
                    @"type":@"1",@
                    "receiveContent":@""
                    }
                ];
        
        ApproveReceiveModel * model = [ApproveReceiveModel setPartmentWithDicc:dic2];
        [self.ReceiveView setTextWithModel:model];
        self.ReceiveView.frame = CGRectMake(0, 80, SCREEN_W, [self.ReceiveView returnFrameHeight]);
        self.tableHeaderViews.frame = CGRectMake(0, 0, SCREEN_W, 80 + [self.ReceiveView returnFrameHeight]);
        
    }else if ([self.Type isEqualToString:@"3"]){
        NSDictionary * dic3 = @{
                                @"department":@"北京必应科技",
                                @"beginTime":@"2017-03-15 10:20",
                                @"endTime":@"2017-03-15 10:20",
                                @"GoOutTime":@"1",
                                @"GoOutReason":@"我试试这个换行可以吗我试试这个换行可以吗我试试这个换行可以吗我可以吗试试这个换行可以吗我试试这个换行可以吗我试试这个换行可以吗我试试这个换行可以吗我试试这个换行可以吗试试这个换行可以吗我试试这个换行可以吗我试试这个换行可以吗我试试这个换行可以吗我试试这个换行可以吗"
                                };
        arr = @[
                @{
                    @"userName":@"苍老师",
                    @"State":@"发起申请",
                    @"Time":@"2017.06.22 12:30",
                    @"type":@"1",@
                    "receiveContent":@""
                    },
                @{
                    @"userName":@"苍老师",
                    @"State":@"通过",
                    @"Time":@"",
                    @"type":@"1",
                    @"receiveContent":@""
                    },
                @{
                    @"userName":@"苍老师",
                    @"State":@"正在审核",
                    @"Time":@"",
                    @"type":@"2",
                    @"receiveContent":@""
                    }
                ];
        ApproveGoOutModel * model = [ApproveGoOutModel setPartmentWith:dic3];
        [self.GoOutView changeFrameWithReasonText:model];
        self.GoOutView.frame = CGRectMake(0, 80, SCREEN_W, [self.GoOutView returnHeight]);
        self.tableHeaderViews.frame = CGRectMake(0, 0, SCREEN_W, CGRectGetMaxY(self.GoOutView.frame));
        
    }else if ([self.Type isEqualToString:@"4"]){
        NSDictionary * dic4 = @{
                                @"department":@"总裁办",
                                @"applyContent":@"拒绝",
                                @"approveDetail":@"不知道这是啥",
                                @"accessoryName":@"IMG_4952.PNG",
                                @"accessotySize":@"44.18KB"
                                };
        
        arr = @[
                @{
                    @"userName":@"苍老师",
                    @"State":@"发起申请",
                    @"Time":@"2017.06.22 12:30",
                    @"type":@"1",
                    @"receiveContent":@""
                    },
                @{
                    @"userName":@"苍老师",
                    @"State":@"通过",
                    @"Time":@"",
                    @"type":@"1",
                    @"receiveContent":@""
                    }
                ];
        ApproveCommonModel * model = [ApproveCommonModel setParameterWith:dic4];
        [self.CommonView setTextWith:model];
        self.CommonView.frame = CGRectMake(0, 80, SCREEN_W, [self.CommonView returnFrameHeight]);
        self.tableHeaderViews.frame = CGRectMake(0, 0, SCREEN_W, CGRectGetMaxY(self.CommonView.frame));
    }
    
    
    
    
    for (NSDictionary * dic in arr) {
        ApproveDetailStateModel * model = [ApproveDetailStateModel setpartmentWith:dic];
        [self.dataArr addObject:model];
    }
    
    self.userNameLabel.text = self.UserName;
    self.userTypeLabel.text = @"等待我审批";
    self.userTypeLabel.textColor = [UIColor colorWithRed:202/255.0 green:174/255.0 blue:105/255.0 alpha:1.0];
    [self.tableView reloadData];
}
#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ApproveDetailStateModel * model = self.dataArr[indexPath.row];
    if ([model.ReceiveContent isEqualToString:@""]) {
        return 110;
    }else{
        return 160;
    }
    

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ApproveDetailStateCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    ApproveDetailStateModel * model = self.dataArr[indexPath.row];
    cell.statemodel = model;
    if (indexPath.row == self.dataArr.count - 1) {
        cell.lineV2.hidden = YES;
    }else{
        cell.lineV2.hidden = NO;
    }
    return cell;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"点击了 == %ld",(long)indexPath.row);

}
#pragma mark - lan
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ApproveDetailStateCell class] forCellReuseIdentifier:@"Cell"];
        //[_tableView registerNib:[UINib nibWithNibName:@"ApproveDetailStateCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}
- (UIView *)tableHeaderViews{
    if (_tableHeaderViews == nil) {
        _tableHeaderViews = [UIView new];
        _tableHeaderViews.backgroundColor = [UIColor whiteColor];
    }
    return _tableHeaderViews;
}
- (UIImageView *)userImageV{
    if (_userImageV == nil) {
        _userImageV = [UIImageView new];
        _userImageV.backgroundColor = [UIColor redColor];
        _userImageV.layer.masksToBounds = YES;
        _userImageV.layer.cornerRadius  = 30;
    }

    return _userImageV;
}
- (UILabel *)userNameLabel{
    if (_userNameLabel == nil) {
        _userNameLabel = [UILabel new];
        _userNameLabel.textColor = [UIColor blackColor];
        _userNameLabel.font = [UIFont systemFontOfSize:18];
        _userNameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _userNameLabel;

}
- (UILabel *)userTypeLabel{
    if (_userTypeLabel == nil) {
        _userTypeLabel = [UILabel new];
        _userTypeLabel.font = [UIFont systemFontOfSize:17];
        _userTypeLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _userTypeLabel;
}
- (ApproveDetailLeaveTitle *)approveView{
    if (_approveView == nil) {
        _approveView = [ApproveDetailLeaveTitle new];
        _approveView.backgroundColor = [UIColor colorWithRed:253/255.0 green:189/255.0 blue:192/255.0 alpha:1.0];
    }
    return _approveView;
}
- (ApproveReceiveTitle *)ReceiveView{
    if (_ReceiveView == nil) {
        _ReceiveView = [ApproveReceiveTitle new];
        _ReceiveView.backgroundColor = [UIColor colorWithRed:195/255.0 green:230/255.0 blue:250/255.0 alpha:1.0];
    }
    return _ReceiveView;

}
- (ApproveGoOutTitle *)GoOutView{
    if (_GoOutView == nil) {
        _GoOutView = [ApproveGoOutTitle new];
        _GoOutView.backgroundColor = [UIColor colorWithRed:228/255.0 green:191/255.0 blue:224/255.0 alpha:1.0];
    }
    return _GoOutView;
}
- (ApproveCommonTitle *)CommonView{
    if (_CommonView == nil) {
        _CommonView = [ApproveCommonTitle new];
        _CommonView.backgroundColor = [UIColor colorWithRed:20/255.0 green:142/255.0 blue:230/255.0 alpha:1.0];
    }
    return _CommonView;
}
- (NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}
@end
