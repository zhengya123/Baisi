//
//  AddMainVC.m
//  Baisi
//
//  Created by dqong on 2017/4/18.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "AddMainVC.h"
#import "PrefixHeader.pch"

#import "PersonalViewController.h"
@interface AddMainVC ()

@end

@implementation AddMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    UIButton *leftBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setFrame:CGRectMake(0, 0, 30, 30)];
    [leftBtn setImage:[UIImage imageNamed:@"goBack"] forState:UIControlStateNormal];
    [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 15)];
    [leftBtn addTarget:self action:@selector(navbackClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];//为导航栏添加左侧按钮
}
-(void)navbackClick:(UIButton *)btn{
    [self dismissViewControllerAnimated:YES completion:nil];


}
- (IBAction)loginBtn:(UIButton *)sender {
    PersonalViewController * person = [PersonalViewController new];
    [self.navigationController pushViewController:person animated:YES];
    
}
@end
