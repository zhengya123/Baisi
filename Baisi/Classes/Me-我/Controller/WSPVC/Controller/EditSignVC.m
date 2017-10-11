//
//  EditSignVC.m
//  Baisi
//
//  Created by dqong on 2017/6/8.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "EditSignVC.h"
#import "DescribeView.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface EditSignVC ()<addBtnDelegate>

@property (nonatomic, strong) UIScrollView * basescrollView;
@property (nonatomic, strong) UIButton     * navSureBtn;
@property (nonatomic, strong) UILabel      * titleLabel;
@property (nonatomic, strong) UITextField  * titleField;
@property (nonatomic, strong) UIView       * titleLineView;
@property (nonatomic, strong) UIView       * describeLineView;
@property (nonatomic, strong) DescribeView * describeView;
@property (nonatomic, strong) DescribeView * foodMaterial;

@end

@implementation EditSignVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"编辑标记点";
    [self createUI];
}

- (void)createUI{
    
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithCustomView:self.navSureBtn];
    UIBarButtonItem * navSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    navSpace.width = -20;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:navSpace,rightBtn, nil];
    
    [self.view addSubview:self.basescrollView];
    [self.basescrollView addSubview:self.titleLabel];
    [self.basescrollView addSubview:self.titleField];
    [self.basescrollView addSubview:self.titleLineView];
    [self.basescrollView addSubview:self.describeView];
    [self.basescrollView addSubview:self.describeLineView];
    [self.basescrollView addSubview:self.foodMaterial];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.basescrollView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.titleLabel.frame = CGRectMake(10, 10, ScreenWidth - 20, 30);
    self.titleField.frame = CGRectMake(10, CGRectGetMaxY(self.titleLabel.frame) + 10, ScreenWidth - 20, 35);
    self.titleLineView.frame = CGRectMake(10, CGRectGetMaxY(self.titleField.frame) + 35, ScreenWidth - 20, 1);
    [self RefreshUIFrame];
    
}
#pragma mark - 确定按钮
- (void)NavSureBtnClick:(UIButton *)btn{



}
#pragma DescribeDelegate
- (void)updateFrame{
    [self RefreshUIFrame];
    
}
- (void)RefreshUIFrame{


    self.describeView.frame = CGRectMake(10, CGRectGetMaxY(self.titleLineView.frame) + 35, ScreenWidth - 20, self.describeView.dataArray.count * 44 + 30 + 60);
    self.describeLineView.frame = CGRectMake(10,CGRectGetMaxY(self.describeView.frame) + 30, ScreenWidth - 20, 1);
    self.foodMaterial.frame = CGRectMake(10, CGRectGetMaxY(self.describeLineView.frame) + 30, ScreenWidth - 20, self.foodMaterial.dataArray.count * 44 + 30 + 60);
    
    self.basescrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.foodMaterial.frame)+ 30);

}
-(void)getChangeText1:(NSMutableArray *)arr{
    
         ZYLog(@"第一个数据 == %@",arr);
   
}
-(void)getChangeText2:(NSMutableArray *)arr{

         ZYLog(@"第二个数据 == %@",arr);
}
#pragma mark - lan
- (UIScrollView *)basescrollView{
    if (_basescrollView == nil) {
        _basescrollView = [UIScrollView new];
        _basescrollView.showsVerticalScrollIndicator = NO;
        _basescrollView.showsHorizontalScrollIndicator = NO;
        _basescrollView.scrollEnabled = YES;
    }
    return _basescrollView;

}
- (UIButton *)navSureBtn{
    if (_navSureBtn == nil) {
        _navSureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _navSureBtn.frame = CGRectMake(0, 0, 60, 40);
        _navSureBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_navSureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_navSureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_navSureBtn addTarget:self action:@selector(NavSureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _navSureBtn;
}
- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"标题";
        _titleLabel.textColor = [UIColor lightGrayColor];
    }
    return _titleLabel;
}
- (UITextField *)titleField{
    if (_titleField == nil) {
        _titleField = [UITextField new];
        _titleField.placeholder = @"加入食盐并翻炒";
        _titleField.borderStyle = UITextBorderStyleRoundedRect;
        _titleField.font = [UIFont fontWithName:@"Arial" size:15.0f];
        _titleField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _titleField.keyboardAppearance=UIKeyboardAppearanceDefault;
    }
    return _titleField;
}
- (UIView *)titleLineView{
    if (_titleLineView == nil) {
        _titleLineView = [UIView new];
        _titleLineView.backgroundColor = [UIColor lightGrayColor];
    }
    return _titleLineView;
}
- (UIView *)describeLineView{
    if (_describeLineView == nil) {
        _describeLineView = [UIView new];
        _describeLineView.backgroundColor = [UIColor lightGrayColor];
    }
    return _describeLineView;
}
- (DescribeView *)describeView{
    if (_describeView == nil) {
        _describeView = [DescribeView new];
        _describeView.backgroundColor = [UIColor whiteColor];
        _describeView.delegate = self;
        _describeView.V_titleLabel.text = @"描述";
        [_describeView.V_addBtn setTitle:@"添加新描述内容" forState:UIControlStateNormal];
        _describeView.type = @"1";
    }
    return _describeView;
}
- (DescribeView *)foodMaterial{
    if (_foodMaterial == nil) {
        _foodMaterial = [DescribeView new];
        _foodMaterial.backgroundColor = [UIColor whiteColor];
        _foodMaterial.delegate = self;
        _foodMaterial.V_titleLabel.text = @"食材用量";
        [_foodMaterial.V_addBtn setTitle:@"添加新食材" forState:UIControlStateNormal];
        _foodMaterial.type = @"2";
    }
    return _foodMaterial;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
