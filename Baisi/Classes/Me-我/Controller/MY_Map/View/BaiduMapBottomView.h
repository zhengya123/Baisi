//
//  BaiduMapBottomView.h
//  Baisi
//
//  Created by dqong on 2017/6/9.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol qiandaoBtnDelegate <NSObject>

-(void)gotoQiandao;

@end

@interface BaiduMapBottomView : UIView

@property (nonatomic, strong) UILabel * addressLabel;
@property (nonatomic, strong) UILabel * timeLabel;
@property (nonatomic, strong) UIButton * qiandaoBtn;

@property (nonatomic, assign) id<qiandaoBtnDelegate>Delegate;
@end
