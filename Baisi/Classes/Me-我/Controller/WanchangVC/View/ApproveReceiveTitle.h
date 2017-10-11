//
//  ApproveReceiveTitle.h
//  Baisi
//
//  Created by dqong on 2017/6/27.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApproveReceiveModel.h"
@interface ApproveReceiveTitle : UIView

@property (nonatomic, strong) UILabel * departmentLeft;
@property (nonatomic, strong) UILabel * goodsUseLeft;
@property (nonatomic, strong) UILabel * goodsNameLeft;
@property (nonatomic, strong) UILabel * goodsNumLeft;

//死数据
@property (nonatomic, strong) UIView * goodsNameTopLine;
@property (nonatomic, strong) UIView * goodsNameBottonLine;
@property (nonatomic, strong) UILabel * goodsDetailLabel;

//活数据
@property (nonatomic, strong) UILabel * department;
@property (nonatomic, strong) UILabel * goodsUse;
@property (nonatomic, strong) UILabel * goodsName;
@property (nonatomic, strong) UILabel * goodsNum;

- (void)setTextWithModel:(ApproveReceiveModel *)model;
- (CGFloat)returnFrameHeight;
@end
