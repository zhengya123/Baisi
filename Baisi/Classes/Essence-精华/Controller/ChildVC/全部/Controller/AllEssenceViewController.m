//
//  AllEssenceViewController.m
//  Baisibudejie
//
//  Created by dqong on 2016/12/14.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "AllEssenceViewController.h"
#import "PrefixHeader.pch"
#import "ALLEssenceModel.h"
#import "ALLEssenceListCell.h"
#import "ImageLookVC.h"
#import "MJRefresh.h"
#import "TableViewRefreshMethod.h"
@interface AllEssenceViewController ()<UITableViewDelegate,UITableViewDataSource,ALLEssenceClickDelegate>

@property (nonatomic, strong) UITableView    * tableView;
@property (nonatomic, strong) NSMutableArray * dataArray;
/** maxtime */
@property (nonatomic, strong) NSString *currentMaxtime;
@end

@implementation AllEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    [self createUI];
    [self requestDataisFirst:YES];
    [self setUpRefresh];
   // self.navigationController.tabBarItem.badgeValue = @"1";
}
-(void)requestDataisFirst:(BOOL)isfirst{
    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    if (isfirst == YES) {
        params[@"a"] = @"list";
        params[@"c"] = @"data";
    }else{
        params[@"a"] = @"list";
        params[@"c"] = @"data";
        params[@"type"] = @1;
        params[@"maxtime"] = [NSString stringWithFormat:@"%@",self.currentMaxtime];
    
    }
   
    __weak typeof(self) weakSelf = self;
    [HYBNetworking getWithUrl:@"http://api.budejie.com/api/api_open.php" refreshCache:YES params:params success:^(id response) {
        
        [weakSelf dealWithData:response isFirst:(BOOL)isfirst];
        //有网的时候正常显示，父类图片隐藏
        weakSelf.NoNetImage.hidden = YES;
        
    } fail:^(NSError *error) {
        ZYLog(@"失败 == %@",error);
        ZYLog(@"失败code = %ld",(long)error.code);
        //没网界面显示没网
        [weakSelf.view bringSubviewToFront:self.NoNetImage];
        weakSelf.NoNetImage.hidden = NO;
    }];
    
}

-(void)dealWithData:(NSDictionary *)response isFirst:(BOOL)isF{
    ZYLog(@"成功 = %@",response);
    if (isF == YES) {
        
            [self.dataArray removeAllObjects];
            [self.tableView reloadData];
        
    }
    NSArray * listArray = [response objectForKey:@"list"];
    self.currentMaxtime = response[@"info"][@"maxtime"];
    for (NSDictionary * dic in listArray) {
        ALLEssenceModel * model = [ALLEssenceModel setModelWithDic:dic];
        [self.dataArray addObject:model];
    }
    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

#pragma mark - createUI
-(void)createUI{
    [self.view addSubview:self.tableView];

}
#pragma mark - tableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    AllEssenceListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    ALLEssenceModel * model = self.dataArray[indexPath.row];
    cell.model = model;
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ALLEssenceModel * model = self.dataArray[indexPath.row];
    CGFloat labelH = [ZY_Method heightWithString:model.text fontSize:15 width:SCREEN_W - 20];
    if ([model.is_gif isEqualToString:@"1"]) {
        return [model.height integerValue] + labelH + 100;
    }else{
    
        if ([model.height integerValue] >= 360) {
            return 360 + labelH + 100;
        }else{
            return [model.height integerValue] + labelH + 100;
        }
    }
    
}
#pragma mark - 全屏图片点击代理
-(void)fullScreenLook:(NSString *)imageUrls andHeight:(CGFloat)height{
    ImageLookVC * lookImage = [ImageLookVC new];
    lookImage.imageUrl      = imageUrls;
    lookImage.imageHeight   = height;
    [self presentViewController:lookImage animated:NO completion:nil];

}
#pragma mark - 刷新
- (void)setUpRefresh{
    
    __weak typeof(self) weakSelf = self;
    [TableViewRefreshMethod tableViewRefresh:self.tableView success:^(refreshType refresh) {
        if (refresh == TableViewHeaderRefresh) {
            [weakSelf headerFresh];
        }else{
            [weakSelf footerFresh];
        }
    }];
    
//    MJRefreshNormalHeader * header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerFresh)];
//    self.tableView.mj_header = header;
//    
//    MJRefreshBackNormalFooter * footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerFresh)];
//    self.tableView.mj_footer = footer;


}
-(void)headerFresh{

    [self requestDataisFirst:YES];

}
-(void)footerFresh{

    [self requestDataisFirst:NO];
}
#pragma mark - 懒加载
-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H - 64 - 44 - 44) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[AllEssenceListCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}
-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}
@end
