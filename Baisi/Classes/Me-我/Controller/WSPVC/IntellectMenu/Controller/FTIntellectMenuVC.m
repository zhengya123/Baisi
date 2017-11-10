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
#import "FTMaterialStepCell.h"
#import "FTMaterialTipsCell.h"
#import "SureCustomActionSheet.h"
#import "PrefixHeader.pch"
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height
#define BGColor [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:0.8];
@interface FTIntellectMenuVC ()<
UITableViewDelegate,
UITableViewDataSource,
FTIntellecMenuTwoSelectCellDelegate,
FTAddFoodMaterialDelegate,
FTMaterialStepDelegate>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * mutArray;
@property (nonatomic, strong) NSMutableArray * dataArry;
@property (nonatomic, strong) UIButton * navcancelBtn;
@property (nonatomic, strong) UIButton * navFinishBtn;
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
    self.tableView.tableHeaderView = self.titleView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNav];
    [self createUI];
    [self detailDataisreload:YES];
    
}
- (void)createNav{
    self.navigationItem.title = @"菜谱上传";
    self.navcancelBtn.frame = CGRectMake(0, 0, 40, 40);
    UIBarButtonItem * LeftMenu = [[UIBarButtonItem alloc]initWithCustomView:self.navcancelBtn];
    self.navigationItem.leftBarButtonItem = LeftMenu;
   
    self.navFinishBtn.frame = CGRectMake(0, 0, 40, 40);
    UIBarButtonItem * rightMenu = [[UIBarButtonItem alloc]initWithCustomView:self.navFinishBtn];
    self.navigationItem.rightBarButtonItem = rightMenu;
}
#pragma mark - 取消
- (void)navCancelClick:(UIButton *)btn{
    [self dismissViewControllerAnimated:YES completion:nil];

}
- (void)navFinishClick:(UIButton *)btn{
    [self.tableView setEditing:NO animated:YES];
    btn.hidden = YES;


}
- (void)createUI{
    [self.view addSubview:self.tableView];
    

}
- (void)detailDataisreload:(BOOL)isL{
    for (NSDictionary * dic in self.mutArray) {
        if ([dic[@"type"] isEqualToString:@"1"]) {
         FTIntellecMenuSelectModel * model = [FTIntellecMenuSelectModel setParameter:dic];
         [self.dataArry addObject:model];
        }else if ([dic[@"type"] isEqualToString:@"2"]){
            
            NSDictionary * d = @{@"addMeterial":[dic objectForKey:@"addMeterial"]};
            
            [self.dataArry addObject:d];
        }else if ([dic[@"type"] isEqualToString:@"3"]){
            NSDictionary * d = @{@"StepMethod":@""};
            [self.dataArry addObject:d];
        
        }else if ([dic[@"type"] isEqualToString:@"4"]){
            NSDictionary * d = @{@"tips":@""};
            [self.dataArry addObject:d];
        }
        
    }

    if (isL == YES) {
       [self.tableView reloadData];
    }
    
}
#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArry.count;
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
        cell.delegate = self;
        cell.getDataArr = [self.dataArry[indexPath.section] objectForKey:@"addMeterial"];
        return cell;
    }else if ([[self.mutArray[indexPath.section] objectForKey:@"type"] isEqualToString:@"3"]){
        FTMaterialStepCell * cell = [tableView dequeueReusableCellWithIdentifier:@"stepCell"];
        cell.delegate = self;
        return cell;
    
    }else if ([[self.mutArray[indexPath.section] objectForKey:@"type"] isEqualToString:@"4"]){
        FTMaterialTipsCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TipsCell"];
        return cell;
    }else{
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([[self.mutArray[indexPath.section] objectForKey:@"type"] isEqualToString:@"2"]) {
        ZYLog(@"=== %@",self.dataArry);
        NSArray * ar = [self.dataArry[indexPath.section] objectForKey:@"addMeterial"];
        if (ar.count > 1) {
            NSArray * ar1 = [[self.dataArry[indexPath.section] objectForKey:@"addMeterial"][0] objectForKey:@"data"];
            //NSArray * ar2 = [[self.dataArry[indexPath.section] objectForKey:@"addMeterial"][1] objectForKey:@"data"];
            return 44 * (ar1.count + ar.count - 1)+ 120;
        }else{
        NSArray * ar1 = [[self.dataArry[indexPath.section] objectForKey:@"addMeterial"][0] objectForKey:@"data"];
            return 44 * ar1.count + 120;
        }
    }else if ([[self.mutArray[indexPath.section] objectForKey:@"type"] isEqualToString:@"3"]){
        return 154 + (SCREEN_W - 20) * 9/16;
    
    }else if ([[self.mutArray[indexPath.section] objectForKey:@"type"] isEqualToString:@"4"]){
        return 150;
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
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleNone;
    
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    NSLog(@"正在移动的 == %ld",(long)sourceIndexPath.section);
    NSLog(@"移动后的 == %ld",(long)destinationIndexPath.section);
    [self.dataArry removeAllObjects];
    NSMutableDictionary * dic = [NSMutableDictionary new];
    dic = self.mutArray[sourceIndexPath.section];
    NSLog(@"11111  == %@",dic);
    [self.mutArray removeObjectAtIndex:sourceIndexPath.section];
    [self.mutArray insertObject:dic atIndex:destinationIndexPath.section];
    [self detailDataisreload:YES];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
#pragma mark - delegate
- (void)ClickdelegateMethod:(NSIndexPath *)index str:(NSString *)Str type:(NSString *)type{
    if ([type isEqualToString:@"2"]) {
        if ([Str isEqualToString:@"left"]) {
            ZYLog(@"添加一步");
            [self.dataArry removeAllObjects];
            [self.mutArray insertObject:@{@"type":@"3"} atIndex:index.section];
            
            //[self.mutArray addObjectsFromArray:@[@{@"type":@"4"}]];
            [self detailDataisreload:NO];
            [self.tableView reloadData];
            
        }else{
            ZYLog(@"调整步骤");
            self.navFinishBtn.hidden = NO;
            [self.tableView setEditing:YES animated:YES];
        }
    }else{
    
        if ([Str isEqualToString:@"left"]) {
            ZYLog(@"耗时选择 == %ld",(long)index.row);
            NSArray * selectArr = @[@"10分钟左右",@"10-30分钟",@"30-60分钟",@"1小时以上"];
            SureCustomActionSheet * optionView = [[SureCustomActionSheet alloc]initWithTitleView:nil optionsArr:selectArr cancelTitle:@"取消" selectedBlock:^(NSInteger index) {
                ZYLog(@"%@",selectArr[index]);
                
            } cancelBlock:^{
                ZYLog(@"耗时选择取消了");
            }];
            
            [self.view addSubview:optionView];
        
        }else{
            ZYLog(@"难度选择 == %ld",(long)index.row);
            NSArray * selectArr = @[@"新手",@"初级",@"中级",@"高级"];
            SureCustomActionSheet * optionView = [[SureCustomActionSheet alloc]initWithTitleView:nil optionsArr:selectArr cancelTitle:@"取消" selectedBlock:^(NSInteger index) {
                ZYLog(@"%@",selectArr[index]);
                
            } cancelBlock:^{
                ZYLog(@"难度选择取消了");
            }];
            [self.view addSubview:optionView];
        }
    }

}
- (void)addTipsMethod:(NSIndexPath *)index{
    ZYLog(@"添加小贴士");
    [self.dataArry removeAllObjects];
    [self.mutArray insertObject:@{@"type":@"4"} atIndex:index.section + 1];
    
    //[self.mutArray addObjectsFromArray:@[@{@"type":@"4"}]];
    [self detailDataisreload:NO];
    [self.tableView reloadData];
}
- (void)recordcurveMethod:(NSIndexPath *)index{
    ZYLog(@"录制烹饪曲线");

}
- (void)addFoodMaterical:(NSString *)type index:(NSIndexPath *)dex arr:(NSMutableArray *)muarr{
    ZYLog(@"返回的arr == %@",muarr);
    if ([type isEqualToString:@"add"]) {
        ZYLog(@"添加食材");
        NSMutableArray * arr = [NSMutableArray new];
        [arr addObjectsFromArray:muarr];
        [arr insertObject:@{@"type":@"addfood",@"data":@[@{@"foodName":@"西红柿",@"foodSize":@"250克"}]} atIndex:1];
        NSDictionary * dic = @{
                               @"type":@"2",
                               @"addMeterial":arr
                               };
        [self.dataArry removeAllObjects];
        [self.mutArray replaceObjectAtIndex:dex.section withObject:dic];
        [self detailDataisreload:YES];
    
    }else if ([type isEqualToString:@"clear"]){
        ZYLog(@"清除");
        [self.dataArry removeAllObjects];
        [self.mutArray removeObjectAtIndex:dex.section];
        NSDictionary * dic = @{@"type":@"2",
                               @"addMeterial":@[
                                       @{
                                       @"type":@"recommend",
                                       @"data":@[]
                                       }
//                                       ,
//                                       @{
//                                           @"type":@"addfood",
//                                           @"data":@[]
//                                           }
                                       ]};
        [self.mutArray insertObject:dic atIndex:dex.section];
        [self detailDataisreload:YES];
        
        
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
        [_tableView registerClass:[FTMaterialStepCell class] forCellReuseIdentifier:@"stepCell"];
        [_tableView registerClass:[FTMaterialTipsCell class] forCellReuseIdentifier:@"TipsCell"];
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
- (UIButton *)navFinishBtn{
    if (_navFinishBtn == nil) {
        _navFinishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_navFinishBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_navFinishBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _navFinishBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_navFinishBtn addTarget:self action:@selector(navFinishClick:) forControlEvents:UIControlEventTouchUpInside];
        _navFinishBtn.hidden = YES;
    }
    return _navFinishBtn;
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
                                            @"type2":@"1",
                                            @"left":@"耗时选择",
                                            @"right":@"难度选择"
                                        },
                                        @{
                                            @"type":@"2",
                                            @"addMeterial":@[
                                                            @{
                                                                @"type":@"recommend",
                                                                @"data":@[
                                                                           @{@"foodName":@"西红柿",@"foodSize":@"250克"},
                                                                           @{@"foodName":@"土豆",@"foodSize":@"适量"},
                                                                           @{@"foodName":@"番茄",@"foodSize":@"适量"},
                                                                           @{@"foodName":@"洋葱",@"foodSize":@"适量"},
                                                                           @{@"foodName":@"鸡蛋",@"foodSize":@"适量"},
                                                                           @{@"foodName":@"管他什么东西",@"foodSize":@"适量"},
                                                                           @{@"foodName":@"盐",@"foodSize":@"适量"}
                                                                               ]
                                                                
                                                        }
                                                    
                                                    ]
                                            
                                            },
                                        @{
                                            @"type":@"3"
                                            },
                                        @{
                                            @"type":@"1",
                                            @"type2":@"2",
                                            @"left":@"添加一步",
                                            @"right":@"调整步骤"
                                            }
                                        ]];
    }
    return _mutArray;
}
@end
