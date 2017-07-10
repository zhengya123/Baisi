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
#define ImageName @"imageName"
#define TitleName @"titleName"
@interface MeViewController ()<
     UITableViewDelegate,
     UITableViewDataSource,
     collectionCellDelegate>

@property (nonatomic, strong) UITableView * tableView;


@end

@implementation MeViewController
{
    NSString * accessToken;

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
            [[ZY_BottonView shareView] show];
        }
            break;
            case 2:
        {
            [[ZY_ErrorView shareError] showWithStr:@"密码错误,请稍后重试"
                                              Font:18
                                              Time:4
             ];
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
            __weak typeof(self) weakSelf = self;
            NSMutableDictionary * params = [NSMutableDictionary dictionary];
            
            params[@"grant_type"] = @"client_credentials";
            params[@"client_id"] = @"h2eDo30k0Dah5NwdAAfOjGp0";
            params[@"client_secret"] = @"NbGZtGUY35gnSqExTAnFxjKLziiwGoSs";
            
            [HYBNetworking getWithUrl:@"https://aip.baidubce.com/oauth/2.0/token" refreshCache:YES params:params success:^(id response) {
                
                [weakSelf dealWithData:response];
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
            break;
            case 10:
        {
        //上传图片
        
            NSMutableDictionary * params = [NSMutableDictionary dictionary];
            params[@"access_token"] = accessToken;
            params[@"uid"] = @"2";
            params[@"user_info"] = @"FirstUser";
            params[@"group_id"] = @"GirstGroup";
            NSData * imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"42C6E4301D894F7EAD29B77305AEDFD0.jpg"], 0.5);
            params[@"image"]= [NSString stringWithFormat:@"%@",[imageData base64EncodedStringWithOptions:(NSDataBase64Encoding64CharacterLineLength)]];
            params[@"action_type"] = @"";
            [HYBNetworking postWithUrl:@"https://aip.baidubce.com/rest/2.0/face/v2/faceset/user/add" refreshCache:YES params:params success:^(id response) {
                ZYLog(@"上传图片成功 == %@",response);
            } fail:^(NSError *error) {
                ZYLog(@"err == %@",error);
            }];

        }
            break;
            case 11:
        {
        
            NSMutableDictionary * params = [NSMutableDictionary dictionary];
            params[@"access_token"] = accessToken;
            params[@"uid"] = @"2";
            [HYBNetworking postWithUrl:@"https://aip.baidubce.com/rest/2.0/face/v2/faceset/user/get" refreshCache:YES params:params success:^(id response) {
                ZYLog(@"用户查询成功 == %@",response);
                
            } fail:^(NSError *error) {
                ZYLog(@"查询失败 == %@",error);
            }];
        }
            break;
            case 12:
        {
            //对比
            NSMutableDictionary * parameter = [NSMutableDictionary dictionary];
            parameter[@"access_token"] = accessToken;
            parameter[@"group_id"] = @"GirstGroup";
            NSData * imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"75C3148C2326A55526B496658665B1FB.jpg"], 0.5);
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
- (void)dealWithData:(NSDictionary *)respon{
    ZYLog(@"成功 == %@",respon);
//获取token成功
    accessToken = respon[@"access_token"];
    
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
