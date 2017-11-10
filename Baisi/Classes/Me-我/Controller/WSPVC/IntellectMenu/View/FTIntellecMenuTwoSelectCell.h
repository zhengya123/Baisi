//
//  FTIntellecMenuTwoSelectCell.h
//  Baisi
//
//  Created by 中商国际 on 2017/10/23.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTIntellecMenuSelectModel.h"
@protocol FTIntellecMenuTwoSelectCellDelegate <NSObject>

- (void)ClickdelegateMethod:(NSIndexPath *)index str:(NSString *)Str type:(NSString *)type;


@end
@interface FTIntellecMenuTwoSelectCell : UITableViewCell

@property (nonatomic, strong) UIButton * Leftbtn;
@property (nonatomic, strong) UIButton * rightBtn;
@property (nonatomic, strong) UIView   * lineV;
@property (nonatomic, strong) FTIntellecMenuSelectModel * models;
@property (nonatomic, assign) id<FTIntellecMenuTwoSelectCellDelegate>delegate;
@end
