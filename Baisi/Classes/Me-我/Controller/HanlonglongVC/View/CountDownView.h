//
//  CountDownView.h
//  foodsecurity
//
//  Created by dqong on 2017/4/7.
//  Copyright © 2017年 net.bjzsgj. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CountViewDelegate <NSObject>

-(void)endRealPlay;//倒计时结束回调

@end
@interface CountDownView : UIView

@property (nonatomic, assign) int countT;
@property (nonatomic, strong) UILabel * countLabel;//倒计时显示的label

@property (nonatomic, assign)id<CountViewDelegate> delegate;

-(void)removeFromPlayVC;
@end
