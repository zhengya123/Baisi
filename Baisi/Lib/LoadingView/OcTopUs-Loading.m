//
//  OcTopUs-Loading.m
//  Baisi
//
//  Created by dqong on 2017/4/17.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "OcTopUs-Loading.h"
#import "UIImage+GIF.h"
#define ZY_SCREEN_W [UIScreen mainScreen].bounds.size.width
#define ZY_SCREEN_H [UIScreen mainScreen].bounds.size.height
@implementation OcTopUs_Loading

+(OcTopUs_Loading *)shareLoading{
    static OcTopUs_Loading * octopus_loading;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        octopus_loading = [[OcTopUs_Loading alloc]init];
    });
    return octopus_loading;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.frame = [[UIScreen mainScreen] bounds];
        self.backgroundColor = [UIColor colorWithRed:103/255.0 green:103/255.0 blue:103/255.0 alpha:0.2];
        self.imageV.frame = CGRectMake(ZY_SCREEN_W/2 - ZY_SCREEN_W/6 - 15, ZY_SCREEN_H/2 - ZY_SCREEN_W/6, ZY_SCREEN_W/3+ 30,ZY_SCREEN_W/3 - 20);
        [self addSubview:self.imageV];
    }
    return self;
}
-(void)show{

    self.imageV.image = [UIImage sd_animatedGIFNamed:@"OcTopUs_Image"];
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.5;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [self.imageV.layer addAnimation:animation forKey:nil];


}

-(void)hides{
//    [UIView animateWithDuration:0.15
//                          delay:0
//                        options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction
//                     animations:^{
//                         self.imageV.transform = CGAffineTransformScale(self.imageV.transform, 0.8, 0.8);
//                     }
//                     completion:^(BOOL finished){
//                         [self removeFromSuperview];
//                     }];

 
    [self removeFromSuperview];
}
#pragma mark - 懒
-(UIImageView *)imageV{
    if (_imageV == nil) {
        _imageV = [UIImageView new];
        _imageV.layer.masksToBounds = YES;
        _imageV.layer.cornerRadius  = 8;
    }
    return _imageV;
}
@end
