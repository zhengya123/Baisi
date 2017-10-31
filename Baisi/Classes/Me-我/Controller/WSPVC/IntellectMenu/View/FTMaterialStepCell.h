//
//  FTMaterialStepCell.h
//  Baisi
//
//  Created by 中商国际 on 2017/10/30.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FTMaterialStepDelegate <NSObject>

//添加小贴士
- (void)addTipsMethod:(NSIndexPath *)index;
//录制烹饪曲线
- (void)recordcurveMethod:(NSIndexPath *)index;

@end

@interface FTMaterialStepCell : UITableViewCell

@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * titleBottomLabel;
@property (nonatomic, strong) UIImageView * StepimageView;
@property (nonatomic, strong) UITextField * inputStepTextField;
@property (nonatomic, strong) UIView * lineV;
@property (nonatomic, strong) UIButton * recordcurve;
@property (nonatomic, strong) UIButton * addTips;
@property (nonatomic, assign) id<FTMaterialStepDelegate>delegate;
@end
