//
//  HHAllMemberViewCell.h
//  Baisi
//
//  Created by dqong on 2017/4/12.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHAllMemberVCModel.h"
@interface HHAllMemberViewCell : UICollectionViewCell

@property (nonatomic, strong)HHAllMemberVCModel * vcmodel;

@property (nonatomic, strong) UIImageView * titleImagV;
@property (nonatomic, strong) UILabel     * titleLabel;
@end
