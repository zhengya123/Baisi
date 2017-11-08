//
//  FellowViewController.m
//  Baisibudejie
//
//  Created by dqong on 16/10/8.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "FellowViewController.h"
#import "PrefixHeader.pch"
#import "TableViewRefreshMethod.h"
@interface FellowViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
@end

@implementation FellowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.title = @"关注";
    [self createUI];
    [self getData];
}

-(void)createUI{
    [self.view addSubview:self.tableView];
    __weak typeof(self) weakSelf = self;
    [TableViewRefreshMethod tableViewRefresh:self.tableView success:^(refreshType refresh) {
    if (refresh == TableViewHeaderRefresh) {
        [weakSelf headerFreshs];
    }else{
        [weakSelf fooderFreshs];
    }
    }];

}

- (void)headerFreshs{
    ZYLog(@"刷新");
    [self performSelector:@selector(delays) withObject:nil afterDelay:3];
}
- (void)delays{
    [TableViewRefreshMethod endFresh:self.tableView];

}
- (void)fooderFreshs{
    ZYLog(@"加载");
    [self performSelector:@selector(delays) withObject:nil afterDelay:3];
}
-(void)getData{
    
    
}
-(void)dealWithData:(id)response{


}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat yy = scrollView.contentOffset.y;
    ZYLog(@"%f",yy);

}
#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = @"测试";
    return cell;
}
#pragma mark - 懒
-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -34, SCREEN_W, SCREEN_H + 70) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;

}
@end
