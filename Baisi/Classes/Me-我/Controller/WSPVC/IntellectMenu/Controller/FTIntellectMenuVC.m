//
//  FTIntellectMenuVC.m
//  Baisi
//
//  Created by 中商国际 on 2017/10/23.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "FTIntellectMenuVC.h"
#import "FTIntellecMenuTitleView.h"
#import "ZY_Method.h"
#import "FTIntellecMenuTwoSelectCell.h"
#import "FTIntellecMenuSelectModel.h"
#import "FTIntellecMenuAddFoodMaterialCell.h"

#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height
#define BGColor [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:0.8];
@interface FTIntellectMenuVC ()<UITableViewDelegate,UITableViewDataSource,FTIntellecMenuTwoSelectCellDelegate>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * mutArray;
@property (nonatomic, strong) NSMutableArray * dataArry;
@property (nonatomic, strong) UIButton * navcancelBtn;
@property (nonatomic, strong) FTIntellecMenuTitleView * titleView;
@end

@implementation FTIntellectMenuVC
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.backgroundColor = BGColor;
    self.tableView.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H);
    NSString * desStr = @"简介\n1.十年前她被选择成为国家电视套新闻主播。\n2.却因毫无经验而遭遇挫败，得点时期却因毫无经验而遭遇挫败，得点却因毫无经验而遭遇挫败，得点却因毫无经验而遭遇挫败，得点";
    self.titleView.titleName = @"椰蓉奶香面包";
    self.titleView.img = [ZY_Method imageWithColor:[UIColor grayColor]];
    self.titleView.describe = desStr;
    self.titleView.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_W * 9/16 + 65 + 20+ [self heightWithString:desStr fontSize:13 width:SCREEN_W - 20]);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNav];
    [self createUI];
    [self detailData];
    
}
- (void)createNav{
    self.navigationItem.title = @"菜谱上传";
    self.navcancelBtn.frame = CGRectMake(0, 0, 40, 40);
    UIBarButtonItem * LeftMenu = [[UIBarButtonItem alloc]initWithCustomView:self.navcancelBtn];
    self.navigationItem.leftBarButtonItem = LeftMenu;
}
- (void)navCancelClick:(UIButton *)btn{
    [self dismissViewControllerAnimated:YES completion:nil];

}
- (void)createUI{
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.titleView;

}
- (void)detailData{
    for (NSDictionary * dic in self.mutArray) {
        if ([dic[@"type"] isEqualToString:@"1"]) {
         FTIntellecMenuSelectModel * model = [FTIntellecMenuSelectModel setParameter:dic];
         [self.dataArry addObject:model];
        }else if ([dic[@"type"] isEqualToString:@"2"]){
            NSArray * ar = [dic objectForKey:@"addMeterial"];
            [self.dataArry addObject:ar];
        }
        
    }

    [self.tableView reloadData];
}
#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.mutArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([[self.mutArray[indexPath.section] objectForKey:@"type"]isEqualToString:@"1"]) {
        FTIntellecMenuTwoSelectCell * cell = [tableView dequeueReusableCellWithIdentifier:@"AddMaterialBtnCell"];
        FTIntellecMenuSelectModel * model = self.dataArry[indexPath.section];
        cell.delegate = self;
        cell.models = model;
        return cell;
    }else if ([[self.mutArray[indexPath.section] objectForKey:@"type"] isEqualToString:@"2"]){
        FTIntellecMenuAddFoodMaterialCell * cell = [tableView dequeueReusableCellWithIdentifier:@"AddMaterialCell"];
        cell.dataArr = self.dataArry[indexPath.section];
        return cell;
    }
    else{
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        return cell;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([[self.mutArray[indexPath.section] objectForKey:@"type"] isEqualToString:@"2"]) {
        NSMutableArray * ar = [NSMutableArray new];
        
        return 44 * 7 + 120;
    }else{
        return 44;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


#pragma mark - delegate
- (void)ClickdelegateMethod:(NSIndexPath *)index str:(NSString *)Str{
    if ([Str isEqualToString:@"left"]) {
        ZYLog(@"左边 == %ld",(long)index.row);
    }else{
        ZYLog(@"右边 == %ld",(long)index.row);
    }

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    CGFloat yoffset = scrollView.contentOffset.y;
    if (yoffset < 0) {
        //ZYLog(@"%f",yoffset);
    }

}
-(CGFloat)heightWithString:(NSString*)string fontSize:(CGFloat)fontSize width:(CGFloat)width
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 10;// 字体的行间距
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize], NSParagraphStyleAttributeName:paragraphStyle};
    CGSize newSize;
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_0) {
        newSize = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    }
    return newSize.height;
    
}

#pragma mark - lan
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[FTIntellecMenuTwoSelectCell class] forCellReuseIdentifier:@"AddMaterialBtnCell"];
        [_tableView registerClass:[FTIntellecMenuAddFoodMaterialCell class] forCellReuseIdentifier:@"AddMaterialCell"];
    }
    return _tableView;
}
- (UIButton *)navcancelBtn{
    if (_navcancelBtn == nil) {
        _navcancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_navcancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_navcancelBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _navcancelBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_navcancelBtn addTarget:self action:@selector(navCancelClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _navcancelBtn;
}
- (FTIntellecMenuTitleView *)titleView{
    if (_titleView == nil) {
        _titleView = [FTIntellecMenuTitleView new];
        _titleView.backgroundColor = [UIColor whiteColor];
    }
    return _titleView;
}
- (NSMutableArray *)dataArry{
    if (_dataArry == nil) {
        _dataArry = [NSMutableArray new];
    }
    return _dataArry;
}
- (NSMutableArray *)mutArray{
    if (_mutArray == nil) {
        _mutArray = [NSMutableArray new];
        [_mutArray addObjectsFromArray:@[
                                        @{
                                            @"type":@"1",
                                            @"left":@"耗时选择",
                                            @"right":@"难度选择"
                                        },
                                        @{
                                            @"type":@"2",
                                            @"addMeterial":@[
                                                    @{@"foodName":@"西红柿",@"foodSize":@"250克"},
                                                    @{@"foodName":@"土豆",@"foodSize":@"适量"},
                                                    @{@"foodName":@"番茄",@"foodSize":@"适量"},
                                                    @{@"foodName":@"洋葱",@"foodSize":@"适量"},
                                                    @{@"foodName":@"鸡蛋",@"foodSize":@"适量"},
                                                    @{@"foodName":@"管他什么东西",@"foodSize":@"适量"},
                                                    @{@"foodName":@"盐",@"foodSize":@"适量"}
                                                    ]
                                            },
                                        @{
                                            @"type":@"1",
                                            @"left":@"添加一步",
                                            @"right":@"调整步骤"
                                            }
                                        ]];
    }
    return _mutArray;
}
@end
