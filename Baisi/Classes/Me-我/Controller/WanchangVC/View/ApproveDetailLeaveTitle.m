//
//  ApproveDetailLeaveTitle.m
//  Baisi
//
//  Created by dqong on 2017/6/27.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "ApproveDetailLeaveTitle.h"

@implementation ApproveDetailLeaveTitle
{
    CGFloat fontNum;
    NSString * reasonStr;
    CGFloat width;
    CGFloat height;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        fontNum = 16;
        width = 70;
        height = 30;
        [self addSubview:self.departmentLeft];
        [self addSubview:self.approveTypeLeft];
        [self addSubview:self.beginTimeLeft];
        [self addSubview:self.endTimeLeft];
        [self addSubview:self.approveNumLeft];
        [self addSubview:self.approveReasonLeft];
       
        [self addSubview:self.department];
        [self addSubview:self.approveType];
        [self addSubview:self.beginTime];
        [self addSubview:self.endTime];
        [self addSubview:self.approveNum];
        [self addSubview:self.approveReason];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.departmentLeft.frame    = CGRectMake(10, 10, width, height);
    self.approveTypeLeft.frame   = CGRectMake(10, CGRectGetMaxY(self.departmentLeft.frame), width, height);
    self.beginTimeLeft.frame     = CGRectMake(10, CGRectGetMaxY(self.approveTypeLeft.frame), width, height);
    self.endTimeLeft.frame       = CGRectMake(10, CGRectGetMaxY(self.beginTimeLeft.frame), width, height);
    self.approveNumLeft.frame    = CGRectMake(10, CGRectGetMaxY(self.endTimeLeft.frame), width, height);
    self.approveReasonLeft.frame = CGRectMake(10, CGRectGetMaxY(self.approveNumLeft.frame) +7, width, height);

    self.department.frame = CGRectMake(CGRectGetMaxX(self.departmentLeft.frame), 10, self.frame.size.width - CGRectGetMaxX(self.departmentLeft.frame) - 10 , height);
    self.approveType.frame = CGRectMake(CGRectGetMaxX(self.approveTypeLeft.frame), CGRectGetMaxY(self.department.frame), self.frame.size.width - CGRectGetMaxX(self.approveTypeLeft.frame) - 10 , height);
    self.beginTime.frame = CGRectMake(CGRectGetMaxX(self.beginTimeLeft.frame), CGRectGetMaxY(self.approveType.frame), self.frame.size.width - CGRectGetMaxX(self.beginTimeLeft.frame) - 10 , height);
    self.endTime.frame = CGRectMake(CGRectGetMaxX(self.endTimeLeft.frame), CGRectGetMaxY(self.beginTime.frame), self.frame.size.width - CGRectGetMaxX(self.endTimeLeft.frame) - 10 , height);
    self.approveNum.frame = CGRectMake(CGRectGetMaxX(self.approveNumLeft.frame), CGRectGetMaxY(self.endTime.frame), self.frame.size.width - CGRectGetMaxX(self.approveNumLeft.frame) - 10 , height);
    self.approveReason.frame = CGRectMake(CGRectGetMaxX(self.approveReasonLeft.frame), CGRectGetMaxY(self.approveNum.frame)+7, self.frame.size.width - CGRectGetMaxX(self.approveReasonLeft.frame) - 10 ,[self heightWithString:reasonStr fontSize:fontNum width:self.frame.size.width - CGRectGetMaxX(self.approveReasonLeft.frame)]);
    [self.approveReason sizeToFit];
    [self.approveReasonLeft sizeToFit];
}

- (void)changeFrameWithReasonText:(ApproveLeaveModel *)model{
    self.department.text = model.department;
    self.approveType.text = model.approveType;
    self.beginTime.text = model.beginTime;
    self.endTime.text = model.endTime;
    self.approveNum.text = model.approveNum;
    self.approveReason.text = model.approveReason;
    reasonStr = model.approveReason;
    
}
- (CGFloat)returnHeights{
    NSLog(@"换行高度1 == %f",[self heightWithString:reasonStr fontSize:fontNum width:SCREEN_W - width] + 30 * 5 + 20);
    return [self heightWithString:reasonStr fontSize:fontNum width:SCREEN_W - width] + 30 * 5 + 20;


}
- (CGFloat)heightWithString:(NSString*)string fontSize:(CGFloat)fontSize width:(CGFloat)width
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 4;// 字体的行间距
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize], NSParagraphStyleAttributeName:paragraphStyle};
    CGSize newSize;
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_0) {
        newSize = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    }
    return newSize.height;
    
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
- (UILabel *)approveTypeLeft{
    if (_approveTypeLeft == nil) {
        _approveTypeLeft = [UILabel new];
        _approveTypeLeft.text = @"请假类型:";
        _approveTypeLeft.textColor = [UIColor lightGrayColor];
        _approveTypeLeft.textAlignment = NSTextAlignmentLeft;
        _approveTypeLeft.font = [UIFont systemFontOfSize:fontNum];
    }
    return _approveTypeLeft;
}
- (UILabel *)beginTimeLeft{
    if (_beginTimeLeft == nil) {
        _beginTimeLeft = [UILabel new];
        _beginTimeLeft.text = @"开始时间:";
        _beginTimeLeft.textColor = [UIColor lightGrayColor];
        _beginTimeLeft.textAlignment = NSTextAlignmentLeft;
        _beginTimeLeft.font = [UIFont systemFontOfSize:fontNum];
    }
    return _beginTimeLeft;
}
- (UILabel *)endTimeLeft{
    if (_endTimeLeft == nil) {
        _endTimeLeft = [UILabel new];
        _endTimeLeft.text = @"结束时间:";
        _endTimeLeft.textColor = [UIColor lightGrayColor];
        _endTimeLeft.textAlignment = NSTextAlignmentLeft;
        _endTimeLeft.font = [UIFont systemFontOfSize:fontNum];
    }
    return _endTimeLeft;
}
- (UILabel *)approveNumLeft{
    if (_approveNumLeft == nil) {
        _approveNumLeft = [UILabel new];
        _approveNumLeft.text = @"请假天数:";
        _approveNumLeft.textColor = [UIColor lightGrayColor];
        _approveNumLeft.textAlignment = NSTextAlignmentLeft;
        _approveNumLeft.font = [UIFont systemFontOfSize:fontNum];
    }
    return _approveNumLeft;
}
- (UILabel *)approveReasonLeft{
    if (_approveReasonLeft == nil) {
        _approveReasonLeft = [UILabel new];
        _approveReasonLeft.text = @"请假事由:";
        _approveReasonLeft.textColor = [UIColor lightGrayColor];
        _approveReasonLeft.textAlignment = NSTextAlignmentLeft;
        _approveReasonLeft.font = [UIFont systemFontOfSize:fontNum];
    }
    return _approveReasonLeft;
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
- (UILabel *)approveType{
    if (_approveType == nil) {
        _approveType = [UILabel new];
        _approveType.textColor = [UIColor blackColor];
        _approveType.textAlignment = NSTextAlignmentLeft;
        _approveType.font = [UIFont systemFontOfSize:fontNum];
    }
    return _approveType;
}
- (UILabel *)beginTime{
    if (_beginTime == nil) {
        _beginTime = [UILabel new];
        _beginTime.textColor = [UIColor blackColor];
        _beginTime.textAlignment = NSTextAlignmentLeft;
        _beginTime.font = [UIFont systemFontOfSize:fontNum];
    }
    return _beginTime;
}
- (UILabel *)endTime{
    if (_endTime == nil) {
        _endTime = [UILabel new];
        _endTime.textColor = [UIColor blackColor];
        _endTime.textAlignment = NSTextAlignmentLeft;
        _endTime.font = [UIFont systemFontOfSize:fontNum];
    }
    return _endTime;
}
- (UILabel *)approveNum{
    if (_approveNum == nil) {
        _approveNum = [UILabel new];
        _approveNum.textColor = [UIColor blackColor];
        _approveNum.textAlignment = NSTextAlignmentLeft;
        _approveNum.font = [UIFont systemFontOfSize:fontNum];
    }
    return _approveNum;
}
- (UILabel *)approveReason{
    if (_approveReason == nil) {
        _approveReason = [UILabel new];
        _approveReason.textAlignment = NSTextAlignmentLeft;
        _approveReason.textColor = [UIColor blackColor];
        _approveReason.font = [UIFont systemFontOfSize:fontNum];
        _approveReason.numberOfLines = 0;
    }
    return _approveReason;
}
@end
