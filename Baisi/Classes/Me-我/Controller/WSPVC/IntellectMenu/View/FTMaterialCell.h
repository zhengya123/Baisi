//
//  FTMaterialCell.h
//  Baisi
//
//  Created by 中商国际 on 2017/10/24.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTIntellecMenuMaterialModel.h"
@interface FTMaterialCell : UITableViewCell

@property (nonatomic, strong) UILabel * foodName;
@property (nonatomic, strong) UILabel * Size;
@property (nonatomic, strong) UILabel * middle;
@property (nonatomic, strong) FTIntellecMenuMaterialModel * model;
@end
