//
//  ZY_AlertNotesView.h
//  Baisi
//
//  Created by dqong on 2017/4/10.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZY_AlertNotesView : UIView


@property (nonatomic, strong) UIView * backView;
@property (nonatomic, strong) UILabel * titleName;
@property (nonatomic, strong) UILabel * contentLabel;
@property (nonatomic, strong) UIButton * cancel;//取消按钮 X

+(ZY_AlertNotesView *)shareView;

-(void)show:(NSString *)str Font:(CGFloat)font;
@end
