//
//  ApproveDetailLeaveTitle.h
//  Baisi
//
//  Created by dqong on 2017/6/27.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApproveLeaveModel.h"
@interface ApproveDetailLeaveTitle : UIView

@property (nonatomic, strong) UILabel * departmentLeft;
@property (nonatomic, strong) UILabel * approveTypeLeft;
@property (nonatomic, strong) UILabel * beginTimeLeft;
@property (nonatomic, strong) UILabel * endTimeLeft;
@property (nonatomic, strong) UILabel * approveNumLeft;
@property (nonatomic, strong) UILabel * approveReasonLeft;

/**
 * 所在部门
 */
@property (nonatomic, strong) UILabel * department;
/**
 * 请假类型
 */
@property (nonatomic, strong) UILabel * approveType;
/**
 * 开始时间
 */
@property (nonatomic, strong) UILabel * beginTime;
/**
 * 结束时间
 */
@property (nonatomic, strong) UILabel * endTime;
/**
 * 请假天数
 */
@property (nonatomic, strong) UILabel * approveNum;
/**
 * 请假事由
 */
@property (nonatomic, strong) UILabel * approveReason;

- (void)changeFrameWithReasonText:(ApproveLeaveModel *)model;
- (CGFloat)returnHeights;
@end
