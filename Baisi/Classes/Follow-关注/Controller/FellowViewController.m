//
//  FellowViewController.m
//  Baisibudejie
//
//  Created by dqong on 16/10/8.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "FellowViewController.h"
#import "PrefixHeader.pch"
#import "HHPatientDataViewController.h"
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


}
-(void)getData{
    
    
}
-(void)dealWithData:(id)response{


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
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;

}
@end
