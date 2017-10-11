//
//  ApproveDetailStateCell.h
//  Baisi
//
//  Created by dqong on 2017/6/28.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApproveDetailStateModel.h"
@interface ApproveDetailStateCell : UITableViewCell

@property (nonatomic, strong) UIView * lineV1;
@property (nonatomic, strong) UIView * lineV2;//(可隐藏)
@property (nonatomic, strong) UIImageView * StateImage;
@property (nonatomic, strong) UIView * LabelBaseV;
@property (nonatomic, strong) UIImageView * userImageV;
@property (nonatomic, strong) UILabel * userName;
@property (nonatomic, strong) UILabel * State;
@property (nonatomic, strong) UIView  * baseV_LineV;
@property (nonatomic, strong) UILabel * TimeLabel;
@property (nonatomic, strong) UILabel * receiveContent;

@property (nonatomic, strong) ApproveDetailStateModel * statemodel;
@end
