//
//  FTMaterialTextFieldCell.h
//  Baisi
//
//  Created by 中商国际 on 2017/10/26.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTIntellecMenuMaterialModel.h"
@interface FTMaterialTextFieldCell : UITableViewCell

@property (nonatomic, strong) UITextField * foodNametextField;
@property (nonatomic, strong) UITextField * foodSizetextField;
@property (nonatomic, strong) FTIntellecMenuMaterialModel * model;
@end
