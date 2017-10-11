//
//  ApproveGoOutTitle.m
//  Baisi
//
//  Created by dqong on 2017/6/27.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "ApproveGoOutTitle.h"

@implementation ApproveGoOutTitle
{
    CGFloat fontNum;
    NSString * reasonStr;
    CGFloat width;
    CGFloat height;

}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        fontNum = 16;
        [self addSubview:self.departmentLeft];
        [self addSubview:self.beginTimeLeft];
        [self addSubview:self.endTimeLeft];
        [self addSubview:self.GoOutTimeLeft];
        [self addSubview:self.GoOutReasonLeft];
        
        [self addSubview:self.department];
        [self addSubview:self.beginTime];
        [self addSubview:self.endTime];
        [self addSubview:self.GoOutTime];
        [self addSubview:self.GoOutReason];
        
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    width = 70;
    height = 30;
    self.departmentLeft.frame    = CGRectMake(10, 10, width, height);
    self.beginTimeLeft.frame   = CGRectMake(10, CGRectGetMaxY(self.departmentLeft.frame), width, height);
    self.endTimeLeft.frame     = CGRectMake(10, CGRectGetMaxY(self.beginTimeLeft.frame), width, height);
    self.GoOutTimeLeft.frame       = CGRectMake(10, CGRectGetMaxY(self.endTimeLeft.frame), width+50, height);
    self.GoOutReasonLeft.frame    = CGRectMake(10, CGRectGetMaxY(self.GoOutTimeLeft.frame) + 7, width, height);
    
    
    self.department.frame = CGRectMake(CGRectGetMaxX(self.departmentLeft.frame), 10, self.frame.size.width - CGRectGetMaxX(self.departmentLeft.frame) - 10 , height);
    self.beginTime.frame = CGRectMake(CGRectGetMaxX(self.beginTimeLeft.frame), CGRectGetMaxY(self.department.frame), self.frame.size.width - CGRectGetMaxX(self.beginTimeLeft.frame) - 10 , height);
    self.endTime.frame = CGRectMake(CGRectGetMaxX(self.endTimeLeft.frame), CGRectGetMaxY(self.beginTime.frame), self.frame.size.width - CGRectGetMaxX(self.endTimeLeft.frame) - 10 , height);
    self.GoOutTime.frame = CGRectMake(CGRectGetMaxX(self.GoOutTimeLeft.frame), CGRectGetMaxY(self.endTime.frame), self.frame.size.width - CGRectGetMaxX(self.GoOutTimeLeft.frame) - 10 , height);
    self.GoOutReason.frame = CGRectMake(CGRectGetMaxX(self.GoOutReasonLeft.frame), CGRectGetMaxY(self.GoOutTime.frame)+7, self.frame.size.width - CGRectGetMaxX(self.GoOutReasonLeft.frame) - 10 ,[self heightWithString:reasonStr fontSize:fontNum width:self.frame.size.width - CGRectGetMaxX(self.GoOutReasonLeft.frame)]);
    [self.GoOutReasonLeft sizeToFit];
    [self.GoOutReason sizeToFit];

}

- (CGFloat)heightWithString:(NSString*)string fontSize:(CGFloat)fontSize width:(CGFloat)widths
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 4;// 字体的行间距
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize], NSParagraphStyleAttributeName:paragraphStyle};
    CGSize newSize;
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_0) {
        newSize = [string boundingRectWithSize:CGSizeMake(widths, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    }
    return newSize.height;
    
}

-(void)changeFrameWithReasonText:(ApproveGoOutModel *)model{
    self.department.text  = model.department;
    self.beginTime.text   = model.beginTime;
    self.endTime.text     = model.endTime;
    self.GoOutTime.text   = model.GoOutTime;
    self.GoOutReason.text = model.GoOutReason;
    reasonStr = model.GoOutReason;

}
- (CGFloat)returnHeight{
    
    NSLog(@"reason == %f",[self heightWithString:reasonStr fontSize:fontNum width:SCREEN_W - width]);
    return [self heightWithString:reasonStr fontSize:fontNum width:SCREEN_W - width] + 40 + 4 * 30;

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

- (UILabel *)GoOutTimeLeft{
    if (_GoOutTimeLeft == nil) {
        _GoOutTimeLeft = [UILabel new];
        _GoOutTimeLeft.text = @"外出时间(小时):";
        _GoOutTimeLeft.textColor = [UIColor lightGrayColor];
        _GoOutTimeLeft.textAlignment = NSTextAlignmentLeft;
        _GoOutTimeLeft.font = [UIFont systemFontOfSize:fontNum];
    }
    return _GoOutTimeLeft;
}

- (UILabel *)GoOutReasonLeft{
    if (_GoOutReasonLeft == nil) {
        _GoOutReasonLeft = [UILabel new];
        _GoOutReasonLeft.text = @"外出事由:";
        _GoOutReasonLeft.textColor = [UIColor lightGrayColor];
        _GoOutReasonLeft.textAlignment = NSTextAlignmentLeft;
        _GoOutReasonLeft.font = [UIFont systemFontOfSize:fontNum];
    }
    return _GoOutReasonLeft;
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
- (UILabel *)GoOutTime{
    if (_GoOutTime == nil) {
        _GoOutTime = [UILabel new];
        _GoOutTime.textColor = [UIColor blackColor];
        _GoOutTime.textAlignment = NSTextAlignmentLeft;
        _GoOutTime.font = [UIFont systemFontOfSize:fontNum];
    }
    return _GoOutTime;
}
- (UILabel *)GoOutReason{
    if (_GoOutReason == nil) {
        _GoOutReason = [UILabel new];
        _GoOutReason.textColor = [UIColor blackColor];
        _GoOutReason.textAlignment = NSTextAlignmentLeft;
        _GoOutReason.font = [UIFont systemFontOfSize:fontNum];
        _GoOutReason.numberOfLines = 0;
    }
    return _GoOutReason;
}
@end
