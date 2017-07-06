//
//  ApproveCommonTitle.h
//  Baisi
//
//  Created by dqong on 2017/6/28.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApproveCommonModel.h"
@interface ApproveCommonTitle : UIView


@property (nonatomic, strong) UILabel * departmentLeft;
@property (nonatomic, strong) UILabel * applyContentLeft;
@property (nonatomic, strong) UILabel * approveDetailLeft;
@property (nonatomic, strong) UILabel * accessoryLabel;
@property (nonatomic, strong) UIView  * accessotyView;



@property (nonatomic, strong) UILabel * department;
@property (nonatomic, strong) UILabel * applyContent;
@property (nonatomic, strong) UILabel * approveDetail;
@property (nonatomic, strong) UILabel * accessoryName;
@property (nonatomic, strong) UILabel * accessotySize;
@property (nonatomic, strong) UIImageView * accessoryImgV;
- (void)setTextWith:(ApproveCommonModel *)model;
-(CGFloat)returnFrameHeight;
@end
