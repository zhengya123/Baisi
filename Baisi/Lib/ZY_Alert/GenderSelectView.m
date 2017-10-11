//
//  GenderSelectView.m
//  Baisi
//
//  Created by dqong on 2017/9/21.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "GenderSelectView.h"
@implementation GenderSelectView

+ (GenderSelectView *)shareView{
    static GenderSelectView * genderSelectView = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        genderSelectView = [[GenderSelectView alloc]init];
    });
    return genderSelectView;


}
- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.frame = [[UIScreen mainScreen] bounds];
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.baseView];
        [self.baseView addSubview:self.cancelBtn];
        [self.baseView addSubview:self.titlelabel];
        [self.baseView addSubview:self.ManGender];
        [self.baseView addSubview:self.WomenGender];
        
    }
    return self;
}
- (void)shoeWithView:(UIView *)view Delegate:(id<GenderSelectDelegate>)delegate{
    
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.7;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [self.baseView.layer addAnimation:animation forKey:nil];
    [view addSubview:self];
    self.delegate = delegate;
    self.baseView.frame = CGRectMake(40, self.frame.size.height/2 - 200, self.frame.size.width - 80, 100);
    self.cancelBtn.frame = CGRectMake(self.baseView.frame.size.width - 40, 5, 30, 30);
    self.titlelabel.frame = CGRectMake(0, 20, self.baseView.frame.size.width, 20);
    self.ManGender.frame = CGRectMake(self.baseView.frame.size.width/4 - 30, CGRectGetMaxY(self.titlelabel.frame) + 20, 60, 30);
    self.WomenGender.frame = CGRectMake(self.baseView.frame.size.width/4 * 3 - 30, CGRectGetMaxY(self.titlelabel.frame) + 20, 60, 30);
    
}
- (void)hides{
    [self removeFromSuperview];


}
- (void)MangenClick:(UIButton *)btn{
    [self.delegate genderSelect:@"true"];
    [self hides];
}
- (void)womenGenderClick:(UIButton *)btn{
    [self.delegate genderSelect:@"false"];
    [self hides];
}
- (void)cancelBtnClick:(UIButton *)btn{
    [self hides];

}
#pragma mark - lan
- (UIView *)baseView{
    if (_baseView == nil) {
        _baseView = [UIView new];
        _baseView.backgroundColor = [UIColor whiteColor];
        _baseView.layer.masksToBounds = YES;
        _baseView.layer.cornerRadius  = 8;
    }
    return _baseView;
}
- (UILabel *)titlelabel{
    if (_titlelabel == nil) {
        _titlelabel = [UILabel new];
        _titlelabel.textColor = [UIColor blackColor];
        _titlelabel.textAlignment = NSTextAlignmentCenter;
        _titlelabel.font = [UIFont systemFontOfSize:16];
        _titlelabel.text = @"宝贝性别";
    }
    return _titlelabel;
}
- (UIButton *)ManGender{
    if (_ManGender == nil) {
        _ManGender = [UIButton buttonWithType:UIButtonTypeCustom];
        [_ManGender setTitle:@"男" forState:UIControlStateNormal];
        [_ManGender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _ManGender.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
        _ManGender.layer.masksToBounds = YES;
        _ManGender.layer.cornerRadius  = 14;
        [_ManGender addTarget:self action:@selector(MangenClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _ManGender;
}
- (UIButton *)WomenGender{
    if (_WomenGender == nil) {
        _WomenGender = [UIButton buttonWithType:UIButtonTypeCustom];
        [_WomenGender setTitle:@"女" forState:UIControlStateNormal];
        [_WomenGender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _WomenGender.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
        _WomenGender.layer.masksToBounds = YES;
        _WomenGender.layer.cornerRadius  = 14;
        [_WomenGender addTarget:self action:@selector(womenGenderClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _WomenGender;
}
- (UIButton *)cancelBtn{
    if (_cancelBtn == nil) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelBtn setTitle:@"X" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}
@end
