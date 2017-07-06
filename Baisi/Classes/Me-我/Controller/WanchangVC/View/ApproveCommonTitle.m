//
//  ApproveCommonTitle.m
//  Baisi
//
//  Created by dqong on 2017/6/28.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "ApproveCommonTitle.h"

@implementation ApproveCommonTitle
{
    CGFloat fontNum;
    CGFloat width;
    CGFloat height;

}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        fontNum = 16;
        width   = 70;
        height  = 30;
        [self addSubview:self.departmentLeft];
         [self addSubview:self.applyContentLeft];
         [self addSubview:self.approveDetailLeft];
         [self addSubview:self.accessoryLabel];
         [self addSubview:self.accessotyView];
        
        [self addSubview:self.department];
        [self addSubview:self.applyContent];
        [self addSubview:self.approveDetail];
        [self addSubview:self.accessoryLabel];
        [self.accessotyView addSubview:self.accessoryImgV];
        [self.accessotyView addSubview:self.accessoryName];
        [self.accessotyView addSubview:self.accessotySize];
    }
    return self;

}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.departmentLeft.frame = CGRectMake(10, 10, width, height);
    self.applyContentLeft.frame = CGRectMake(10, CGRectGetMaxY(self.departmentLeft.frame), width, height);
    self.approveDetailLeft.frame = CGRectMake(10, CGRectGetMaxY(self.applyContentLeft.frame), width, height);
    self.accessoryLabel.frame = CGRectMake(10, CGRectGetMaxY(self.approveDetailLeft.frame), width, height);
    self.accessotyView.frame = CGRectMake(10, CGRectGetMaxY(self.accessoryLabel.frame), SCREEN_W - 20, 80);
    
    
    self.department.frame = CGRectMake(width + 10, 10, SCREEN_W - width - 20, height);
    self.applyContent.frame = CGRectMake(width + 10, CGRectGetMaxY(self.department.frame), SCREEN_W - width - 20, height);
    self.approveDetail.frame = CGRectMake(width + 10, CGRectGetMaxY(self.applyContent.frame), SCREEN_W - width - 20, height);
    self.accessoryImgV.frame = CGRectMake(10, 10, 60, 60);
    self.accessoryName.frame = CGRectMake(CGRectGetMaxX(self.accessoryImgV.frame) + 10, 10, SCREEN_W - 110, 30);
    self.accessotySize.frame = CGRectMake(CGRectGetMaxX(self.accessoryImgV.frame) + 10, 40, SCREEN_W - 110, 40);
    [self.accessotySize sizeToFit];

}
- (CGFloat)returnFrameHeight{
    return height * 4 + 80 + 20;

}
- (void)setTextWith:(ApproveCommonModel *)model{

    self.department.text    = model.department;
    self.applyContent.text  = model.applyContent;
    self.approveDetail.text = model.approveDetail;
    self.accessoryName.text = model.accessoryName;
    self.accessotySize.text = model.accessotySize;


}
- (UILabel *)departmentLeft{
    if (_departmentLeft == nil) {
        _departmentLeft = [UILabel new];
        _departmentLeft.textAlignment = NSTextAlignmentLeft;
        _departmentLeft.textColor = [UIColor lightGrayColor];
        _departmentLeft.font = [UIFont systemFontOfSize:fontNum];
        _departmentLeft.text = @"所在部门:";
    }
    return _departmentLeft;
}
- (UILabel *)applyContentLeft{
    if (_applyContentLeft == nil) {
        _applyContentLeft = [UILabel new];
        _applyContentLeft.textAlignment = NSTextAlignmentLeft;
        _applyContentLeft.textColor = [UIColor lightGrayColor];
        _applyContentLeft.font = [UIFont systemFontOfSize:fontNum];
        _applyContentLeft.text = @"申请内容:";
    }
    return _applyContentLeft;
}
- (UILabel *)approveDetailLeft{
    if (_approveDetailLeft == nil) {
        _approveDetailLeft = [UILabel new];
        _approveDetailLeft.textAlignment = NSTextAlignmentLeft;
        _approveDetailLeft.textColor = [UIColor lightGrayColor];
        _approveDetailLeft.font = [UIFont systemFontOfSize:fontNum];
        _approveDetailLeft.text = @"审批详情:";
    }
    return _approveDetailLeft;
}
- (UILabel *)accessoryLabel{
    if (_accessoryLabel == nil) {
        _accessoryLabel = [UILabel new];
        _accessoryLabel.textAlignment = NSTextAlignmentLeft;
        _accessoryLabel.textColor = [UIColor lightGrayColor];
        _accessoryLabel.font = [UIFont systemFontOfSize:fontNum];
        _accessoryLabel.text = @"附件:";
    }
    return _accessoryLabel;
}
- (UIView *)accessotyView{
    if (_accessotyView == nil) {
        _accessotyView = [UIView new];
        _accessotyView.backgroundColor =[UIColor lightGrayColor];
        _accessotyView.alpha = 0.6;
        _accessotyView.layer.masksToBounds = YES;
        _accessotyView.layer.cornerRadius  = 8;
    }
    return _accessotyView;
}
- (UILabel *)department{
    if (_department == nil) {
        _department = [UILabel new];
        _department.textAlignment = NSTextAlignmentLeft;
        _department.textColor = [UIColor blackColor];
        _department.font = [UIFont systemFontOfSize:fontNum];
    }
    return _department;
}
- (UILabel *)applyContent{
    if (_applyContent == nil) {
        _applyContent = [UILabel new];
        _applyContent.textAlignment = NSTextAlignmentLeft;
        _applyContent.textColor = [UIColor blackColor];
        _applyContent.font = [UIFont systemFontOfSize:fontNum];
    }
    return _applyContent;
}
- (UILabel *)approveDetail{
    if (_approveDetail == nil) {
        _approveDetail = [UILabel new];
        _approveDetail.textAlignment = NSTextAlignmentLeft;
        _approveDetail.textColor = [UIColor blackColor];
        _approveDetail.font = [UIFont systemFontOfSize:fontNum];
    }
    return _approveDetail;
}
- (UILabel *)accessoryName{
    if (_accessoryName == nil) {
        _accessoryName = [UILabel new];
        _accessoryName.textAlignment = NSTextAlignmentLeft;
        _accessoryName.textColor = [UIColor blackColor];
        _accessoryName.font = [UIFont systemFontOfSize:fontNum];
    }
    return _accessoryName;
}
- (UILabel *)accessotySize{
    if (_accessotySize == nil) {
        _accessotySize = [UILabel new];
        _accessotySize.textAlignment = NSTextAlignmentLeft;
        _accessotySize.textColor = [UIColor blackColor];
        _accessotySize.font = [UIFont systemFontOfSize:fontNum];
    }
    return _accessotySize;
}
- (UIImageView *)accessoryImgV{
    if (_accessoryImgV == nil) {
        _accessoryImgV = [UIImageView new];
        _accessoryImgV.layer.masksToBounds = YES;
        _accessoryImgV.layer.cornerRadius  = 8;
        _accessoryImgV.backgroundColor = [UIColor purpleColor];
    }
    return _accessoryImgV;
}
@end
