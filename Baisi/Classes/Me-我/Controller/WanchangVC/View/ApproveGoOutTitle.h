//
//  ApproveGoOutTitle.h
//  Baisi
//
//  Created by dqong on 2017/6/27.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApproveGoOutModel.h"
@interface ApproveGoOutTitle : UIView

@property (nonatomic, strong) UILabel * departmentLeft;
@property (nonatomic, strong) UILabel * beginTimeLeft;
@property (nonatomic, strong) UILabel * endTimeLeft;
@property (nonatomic, strong) UILabel * GoOutTimeLeft;
@property (nonatomic, strong) UILabel * GoOutReasonLeft;



@property (nonatomic, strong) UILabel * department;
@property (nonatomic, strong) UILabel * beginTime;
@property (nonatomic, strong) UILabel * endTime;
@property (nonatomic, strong) UILabel * GoOutTime;
@property (nonatomic, strong) UILabel * GoOutReason;

- (void)changeFrameWithReasonText:(ApproveGoOutModel *)model;
- (CGFloat)returnHeight;
@end
