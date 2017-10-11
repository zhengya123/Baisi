//
//  ApproveReceiveTitle.m
//  Baisi
//
//  Created by dqong on 2017/6/27.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "ApproveReceiveTitle.h"

@implementation ApproveReceiveTitle
{

    CGFloat fontNum;
    
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        fontNum = 16;
        [self addSubview:self.departmentLeft];
        [self addSubview:self.goodsUseLeft];
        [self addSubview:self.goodsNameLeft];
        [self addSubview:self.goodsNumLeft];
        
        
        [self addSubview:self.goodsNameTopLine];
        [self addSubview:self.goodsNameBottonLine];
        [self addSubview:self.goodsDetailLabel];
        
        
        [self addSubview:self.department];
        [self addSubview:self.goodsNum];
        [self addSubview:self.goodsName];
        [self addSubview:self.goodsUse];
        
    }
    return self;

}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = 70;
    CGFloat height = 30;
    self.departmentLeft.frame    = CGRectMake(10, 10, width, height);
    self.goodsUseLeft.frame   = CGRectMake(10, CGRectGetMaxY(self.departmentLeft.frame), width, height);
    self.goodsNameTopLine.frame = CGRectMake(10, CGRectGetMaxY(self.goodsUseLeft.frame), self.frame.size.width - 20, 1);
    self.goodsDetailLabel.frame = CGRectMake(10, CGRectGetMaxY(self.goodsNameTopLine.frame) + 5, self.frame.size.width - 20, height);
    self.goodsNameLeft.frame = CGRectMake(10, CGRectGetMaxY(self.goodsDetailLabel.frame), width, height);
    self.goodsNumLeft.frame = CGRectMake(10, CGRectGetMaxY(self.goodsNameLeft.frame), 50, height);
    self.goodsNameBottonLine.frame = CGRectMake(10, CGRectGetMaxY(self.goodsNumLeft.frame), self.frame.size.width - 20, 1);


    self.department.frame = CGRectMake(CGRectGetMaxX(self.departmentLeft.frame), 10, self.frame.size.width - CGRectGetMaxX(self.departmentLeft.frame) - 10, height);
    self.goodsUse.frame = CGRectMake(CGRectGetMaxX(self.goodsUseLeft.frame), CGRectGetMaxY(self.department.frame), self.frame.size.width - CGRectGetMaxX(self.goodsUseLeft.frame) - 10, height);
    self.goodsName.frame = CGRectMake(CGRectGetMaxX(self.goodsNameLeft.frame), CGRectGetMaxY(self.goodsDetailLabel.frame), self.frame.size.width - CGRectGetMaxX(self.goodsNameLeft.frame) - 10, height);
    self.goodsNum.frame = CGRectMake(CGRectGetMaxX(self.goodsNumLeft.frame), CGRectGetMaxY(self.goodsName.frame), self.frame.size.width - CGRectGetMaxX(self.goodsNumLeft.frame) - 10, height);
}
- (CGFloat)returnFrameHeight{
    
    return 30 * 5 + 20;

}
- (void)setTextWithModel:(ApproveReceiveModel *)model{
    self.department.text = model.department;
    self.goodsUse.text   = model.goodsUse;
    self.goodsName.text  = model.goodsName;
    self.goodsNum.text   = model.goodsNum;

}
#pragma mark - lan
- (UILabel *)departmentLeft{
    if (_departmentLeft == nil) {
        _departmentLeft = [UILabel new];
        _departmentLeft.text = @"所在部门:";
        _departmentLeft.textColor = [UIColor lightGrayColor];
        _departmentLeft.textAlignment = NSTextAlignmentLeft;
        _departmentLeft.font = [UIFont systemFontOfSize:fontNum];
    }
    return _departmentLeft;
}
- (UILabel *)goodsUseLeft{
    if (_goodsUseLeft == nil) {
        _goodsUseLeft = [UILabel new];
        _goodsUseLeft.text = @"物品用途:";
        _goodsUseLeft.textColor = [UIColor lightGrayColor];
        _goodsUseLeft.textAlignment = NSTextAlignmentLeft;
        _goodsUseLeft.font = [UIFont systemFontOfSize:fontNum];
    }
    return _goodsUseLeft;
}
- (UILabel *)goodsNameLeft{
    if (_goodsNameLeft == nil) {
        _goodsNameLeft = [UILabel new];
        _goodsNameLeft.text = @"物品名称:";
        _goodsNameLeft.textColor = [UIColor lightGrayColor];
        _goodsNameLeft.textAlignment = NSTextAlignmentLeft;
        _goodsNameLeft.font = [UIFont systemFontOfSize:fontNum];
    }
    return _goodsNameLeft;
}
- (UILabel *)goodsNumLeft{
    if (_goodsNumLeft == nil) {
        _goodsNumLeft = [UILabel new];
        _goodsNumLeft.text = @"数量:";
        _goodsNumLeft.textColor = [UIColor lightGrayColor];
        _goodsNumLeft.textAlignment = NSTextAlignmentLeft;
        _goodsNumLeft.font = [UIFont systemFontOfSize:fontNum];
    }
    return _goodsNumLeft;
}
- (UIView *)goodsNameTopLine{
    if (_goodsNameTopLine == nil) {
        _goodsNameTopLine = [UIView new];
        _goodsNameTopLine.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:0.8];
    }
    return _goodsNameTopLine;
}
- (UIView *)goodsNameBottonLine{
    if (_goodsNameBottonLine == nil) {
        _goodsNameBottonLine = [UIView new];
        _goodsNameBottonLine.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:0.8];
    }
    return _goodsNameBottonLine;
}
- (UILabel *)goodsDetailLabel{
    if (_goodsDetailLabel == nil) {
        _goodsDetailLabel = [UILabel new];
        _goodsDetailLabel.textColor = [UIColor lightGrayColor];
        _goodsDetailLabel.textAlignment = NSTextAlignmentLeft;
        _goodsDetailLabel.font = [UIFont systemFontOfSize:19];
        _goodsDetailLabel.text = @"物品明细";
    }
    return _goodsDetailLabel;
}
- (UILabel *)department{
    if (_department == nil) {
        _department = [UILabel new];
        _department.textColor = [UIColor blackColor];
        _department.textAlignment = NSTextAlignmentLeft;
        _department.font = [UIFont systemFontOfSize:fontNum];
    }
    return _department;
}
- (UILabel *)goodsUse{
    if (_goodsUse == nil) {
        _goodsUse = [UILabel new];
        _goodsUse.textColor = [UIColor blackColor];
        _goodsUse.textAlignment = NSTextAlignmentLeft;
        _goodsUse.font = [UIFont systemFontOfSize:fontNum];
    }
    return _goodsUse;
}
- (UILabel *)goodsName{
    if (_goodsName == nil) {
        _goodsName = [UILabel new];
        _goodsName.textColor = [UIColor blackColor];
        _goodsName.textAlignment = NSTextAlignmentLeft;
        _goodsName.font = [UIFont systemFontOfSize:fontNum];
    }
    return _goodsName;
}
- (UILabel *)goodsNum{
    if (_goodsNum == nil) {
        _goodsNum = [UILabel new];
        _goodsNum.textColor = [UIColor blackColor];
        _goodsNum.textAlignment = NSTextAlignmentLeft;
        _goodsNum.font = [UIFont systemFontOfSize:fontNum];
    }
    return _goodsNum;
}
@end
