//
//  MeViewController.m
//  Baisibudejie
//
//  Created by dqong on 16/10/8.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "MeViewController.h"
#import "PrefixHeader.pch"
#import "Me_tableFootViewCollectionViewCell.h"
#import "CollectionTableViewCell.h"
#import "CoreLocationVC.h"
#import "KaidianCompanyInfoController.h"
#import "PersonalViewController.h"
#import "ZY_RootNavigationController.h"
#import "ZY_BottonView.h"
#import "ZY_ErrorView.h"
#import "ZY_AlertNotesView.h"
#import "OcTopUs-Loading.h"
#import "PeopleWorking-Loading.h"
#import "Waiting_Loading.h"
#import "SureCustomActionSheet.h"
#import "FaceRecogintionVC.h"
#import "FaceComparisonVC.h"
#import "TESTViewController.h"
#import "RelationSelectView.h"
#import "GenderSelectView.h"
#import "TestVC.h"
#define ImageName @"imageName"
#define TitleName @"titleName"
@interface MeViewController ()<
     UITableViewDelegate,
     UITableViewDataSource,
     collectionCellDelegate,
RelationShipDelegate,
GenderSelectDelegate>

@property (nonatomic, strong) UITableView * tableView;


@end

@implementation MeViewController
{
    NSString * accessToken;

}
- (void)selectRelation:(NSString *)str{
    ZYLog(@"%@",str);

}
- (void)genderSelect:(NSString *)gender{
    ZYLog(@"性别选择回调 == %@",gender);

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //self.navigationController.navigationBar.hidden = YES;
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
   // self.navigationController.navigationBar.hidden = NO;
    [[ZY_BottonView shareView] remove];
    [[OcTopUs_Loading shareLoading] hides];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.title = @"我的";
    [self createUI];
//    self.navigationController.tabBarItem.badgeValue = @"1";
//    self.navigationController.tabBarItem.badgeColor = [UIColor greenColor];
    //self.tabBarController.tabBar
}
-(void)createUI{
    [self.view addSubview:self.tableView];
   
   // self.tableView.tableFooterView = self.collectionView;


}

#pragma mark - tableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        return 22/4 * 100 + 110;
    }else{
        return 44;
    }

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        CollectionTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CollectionCell"];
        cell.delegate = self;
//        cell.dataArrays = self.dataArray;
//        [cell.collectionView reloadData];
        return cell;
    }else{
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        switch (indexPath.section) {
            case 0:
            {
                cell.imageView.image = [UIImage imageNamed:@"setup-head-default"];
                cell.textLabel.text  = @"登陆/注册";
                
            }
                break;
            case 1:
            {
                cell.textLabel.text = @"个人信息";
            }
                break;
            default:
                break;
        }
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.section) {
        case 0:
        {
            LoginViewController * LoginVC = [LoginViewController new];
            [self presentViewController:LoginVC animated:YES completion:nil];
        
        }
            break;
            case 1:
        {
        //个人信息
            PersonalViewController * personalVC = [PersonalViewController new];
            [self.navigationController pushViewController:personalVC animated:YES];
        }
            break;
           
        default:
            break;
    }

}
#pragma marl - collectionCellDelegate
-(void)didselection:(NSIndexPath *)indexpath{
    switch (indexpath.row) {
        case 0:
        {
         ZYLog(@"1");
            KaidianCompanyInfoController * kai = [KaidianCompanyInfoController new];
            [self.navigationController pushViewController:kai animated:YES];
        }
            break;
            case 1:
        {
            //[[ZY_BottonView shareView] show];
            //[[RelationSelectView shareView] showWithView:self.view Delegate:self];
            [[GenderSelectView shareView] shoeWithView:self.view Delegate:self];
        }
            break;
            case 2:
        {
//            [[ZY_ErrorView shareError] showWithStr:@"密码错误,请稍后重试"
//                                              Font:18
//                                              Time:4
//             ];
            TestVC * testVC = [TestVC new];
            [self.navigationController pushViewController:testVC animated:YES];
            ZYLog(@"3");
        }
            break;
            case 3:
        {
        
            [[ZY_ErrorView shareError] showWithStr:@"这个正常" Font:18 Time:3];
        }
            break;
            case 4:
        {
        
            [[ZY_ErrorView shareError] showWithStr:@"反正这是一个很长的字符串,我想让他换行看看行不行" Font:18 Time:3];
        }
            break;
            case 5:
        {
        
         [[ZY_ErrorView shareError] showWithStr:@"反正这是一个很长的字符串,我想让他换行看看行不行,反正这是一个很长的字符串,我想让他换行看看行不行,反正这是一个很长的字符串,我想让他换行看看行不行" Font:18 Time:3];
        }
            break;
            case 6:
        {
            [[ZY_AlertNotesView shareView]show:@"反正这是一个很长的字符串,我想让他换行看看行不行,反正这是一个很长的字符串,我想让他换行看看行不行,反正这是一个很长的字符串,我想让他换行看看行不行" Font:15];
        }
            break;
            case 7:
        {
        
            [[OcTopUs_Loading shareLoading] show];
            [self performSelector:@selector(OcTopUs_Load) withObject:nil afterDelay:10];
        }
            break;
            case 8:
        {
            [[PeopleWorking_Loading shareLoading] show];
            [self performSelector:@selector(OcTopUs_Load) withObject:nil afterDelay:10];
        
        }
            break;
            case 9:
        {
//            [[Waiting_Loading shareLoading] show];
//             [self performSelector:@selector(OcTopUs_Load) withObject:nil afterDelay:10];
            //人脸识别
            FaceRecogintionVC * faceVC = [FaceRecogintionVC new];
            [self.navigationController pushViewController:faceVC animated:YES];
        }
            break;
            case 10:
        {
          //人脸对比
            FaceComparisonVC * comparisonVC = [FaceComparisonVC new];
            [self.navigationController pushViewController:comparisonVC animated:YES];
        }
            break;
            case 11:
        {
            TESTViewController * test = [TESTViewController new];
            [self.navigationController pushViewController:test animated:YES];
           
        }
            break;
            case 12:
        {
            //对比
            NSMutableDictionary * parameter = [NSMutableDictionary dictionary];
            parameter[@"access_token"] = accessToken;
            parameter[@"group_id"] = @"SecGroup";
            NSData * imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"FBDB4CDC2B7D61D279AA080CEDAD41A3.jpg"], 0.5);
            parameter[@"image"]= [NSString stringWithFormat:@"%@",[imageData base64EncodedStringWithOptions:(NSDataBase64Encoding64CharacterLineLength)]];
            [HYBNetworking postWithUrl:@"https://aip.baidubce.com/rest/2.0/face/v2/identify" refreshCache:YES params:parameter success:^(id response) {
                ZYLog(@"对比成功 == %@",response);
            } fail:^(NSError *error) {
                ZYLog(@"对比失败 == %@",error);
            }];
        
        }
            break;
        default:
            break;
    }

}

-(void)OcTopUs_Load{
    [[OcTopUs_Loading shareLoading] hides];
    [[PeopleWorking_Loading shareLoading] hides];
    [[Waiting_Loading shareLoading] hides];

}
#pragma mark - lan
-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H - 44 - 64 - 5) style:UITableViewStylePlain];
       // _tableView.backgroundColor = [UIColor lightGrayColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[CollectionTableViewCell class] forCellReuseIdentifier:@"CollectionCell"];
        
    }
    return _tableView;

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[ZY_BottonView shareView]remove];

}

@end
