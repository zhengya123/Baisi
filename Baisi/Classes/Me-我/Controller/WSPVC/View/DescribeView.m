//
//  DescribeView.m
//  Baisi
//
//  Created by dqong on 2017/6/8.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "DescribeView.h"
#import "describeTableViewCell.h"
#import "SeconddescribeTableViewCell.h"
@implementation DescribeView 

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.V_titleLabel];
        [self addSubview:self.V_tableView];
        [self addSubview:self.V_addBtn];
        
       
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.V_titleLabel.frame = CGRectMake(0, 0, self.frame.size.width, 30);
    self.V_tableView.frame = CGRectMake(0, CGRectGetMaxY(self.V_titleLabel.frame), self.frame.size.width, self.dataArray.count * 44);
    self.V_addBtn.frame = CGRectMake(0, CGRectGetMaxY(self.V_tableView.frame) + 30, self.frame.size.width, 30);
    if ([self.type isEqualToString:@"1"]) {
        [_V_tableView registerClass:[describeTableViewCell class] forCellReuseIdentifier:@"Cell"];
    }else{
        [_V_tableView registerClass:[SeconddescribeTableViewCell class] forCellReuseIdentifier:@"Cell"];
    }

}

#pragma mark - “add”按钮的点击方法
- (void)addBtnClick:(UIButton *)btn{
    if (self.dataArray.count < 10) {
        [self.dataArray addObjectsFromArray:@[@""]];
        [self.V_tableView reloadData];
        [self.delegate updateFrame];
    }else{
        
        UIAlertView * alt = [[UIAlertView alloc]initWithTitle:@"只能添加十个呦" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alt show];
    
    }
    
}

-(void)deleteBtnMethod:(NSIndexPath *)indexP{
    if (self.dataArray.count > 1) {
        ZYLog(@"删除的是第几个== %ld",(long)indexP.row);
        [self.dataArray removeObjectAtIndex:indexP.row];
        [self.V_tableView reloadData];
        [self.delegate updateFrame];
    }else{
        UIAlertView * alt = [[UIAlertView alloc]initWithTitle:@"就一个了，不能再减了！" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alt show];
    
    }

}
-(void) SeconddeleteBtnMethod:(NSIndexPath *)indexP{

    if (self.dataArray.count > 1) {
        [self.dataArray removeObjectAtIndex:indexP.row];
        [self.V_tableView reloadData];
        [self.delegate updateFrame];
    }else{
        UIAlertView * alt = [[UIAlertView alloc]initWithTitle:@"就一个了，不能再减了！" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alt show];
        
    }

}

-(void)changeTextFieldText:(NSString *)text Index:(NSIndexPath *)indexS{
    [self.dataArray replaceObjectAtIndex:indexS.row withObject:text];
    ZYLog(@"textField.text == %@",self.dataArray[indexS.row]);
    [self.delegate getChangeText1:self.dataArray];
}
-(void)SecondChangeTextFieldText:(NSString *)text Index:(NSIndexPath *)indexS{

    [self.dataArray replaceObjectAtIndex:indexS.row withObject:text];
    [self.delegate getChangeText2:self.dataArray];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.type isEqualToString:@"1"]) {
        describeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        cell.delegate = self;
        return cell;
    }else{
        SeconddescribeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        cell.delegate = self;
        return cell;
    }
   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.type isEqualToString:@"1"]) {
        describeTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.selected = NO;
    }else{
    
        SeconddescribeTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.selected = NO;
    }
}
#pragma mark - lan
- (UILabel *)V_titleLabel{
    if (_V_titleLabel == nil) {
        _V_titleLabel = [UILabel new];
        _V_titleLabel.textColor = [UIColor lightGrayColor];
    }
    return _V_titleLabel;
}
- (UITableView *)V_tableView{
    if (_V_tableView == nil) {
        _V_tableView = [[UITableView alloc]initWithFrame:CGRectZero];
        _V_tableView.delegate = self;
        _V_tableView.dataSource = self;
        _V_tableView.scrollEnabled = NO;
        _V_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _V_tableView;
}
- (UIButton *)V_addBtn{
    if (_V_addBtn == nil) {
        _V_addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_V_addBtn addTarget:self action:@selector(addBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_V_addBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _V_addBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _V_addBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    return _V_addBtn;
}
-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray new];
        [_dataArray addObjectsFromArray:@[@""]];
    }
    return _dataArray;
}
@end
