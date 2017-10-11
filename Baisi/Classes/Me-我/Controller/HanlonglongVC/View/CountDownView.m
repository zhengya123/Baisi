//
//  CountDownView.m
//  foodsecurity
//
//  Created by dqong on 2017/4/7.
//  Copyright © 2017年 net.bjzsgj. All rights reserved.
//

#import "CountDownView.h"
#define warmingT 120
@implementation CountDownView
{
    NSTimer * counttime;
    int      WarmingTime;//倒计时两分钟

}

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        self.countLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
        self.countLabel.textColor = [UIColor whiteColor];
        self.countLabel.textAlignment = NSTextAlignmentCenter;
        self.countLabel.font = [UIFont systemFontOfSize:13];
        
        WarmingTime = self.countT;
        counttime = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countWorming) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:counttime forMode:NSRunLoopCommonModes];
        [self addSubview:self.countLabel];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
}

-(void)countWorming{
    WarmingTime--;
    ZYLog(@"2分钟倒计时 == %d",WarmingTime);
    self.countLabel.text = [NSString stringWithFormat:@"%@",[self dealTheTime:[NSString stringWithFormat:@"%d",WarmingTime]]];
    if (WarmingTime <= 0) {
        [counttime invalidate];
        counttime = nil;
        [self.delegate endRealPlay];
        [self removeFromPlayVC];
    }
}
-(void)removeFromPlayVC{
    WarmingTime = 0;
    [counttime invalidate];
    counttime = nil;
    [self removeFromSuperview];
}
//时间处理
-(NSString *)dealTheTime:(NSString *)duration
{
    NSInteger second = [duration intValue];
    NSInteger hour = second/3600;
    NSInteger min = (second-hour*3600)/60;
    NSInteger secondfinal = second-hour*3600-min*60;
    if (hour < 1) {
        return [NSString stringWithFormat:@"%ld:%ld",(long)min,(long)secondfinal];
    }
    else {
        return [NSString stringWithFormat:@"%ld:%ld:%ld",(long)hour,(long)min,(long)secondfinal];
    }
}

@end
