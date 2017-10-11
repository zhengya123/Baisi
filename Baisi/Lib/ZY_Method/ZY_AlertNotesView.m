//
//  ZY_AlertNotesView.m
//  Baisi
//
//  Created by dqong on 2017/4/10.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "ZY_AlertNotesView.h"

#define ZY_SCREEN_W [UIScreen mainScreen].bounds.size.width
#define ZY_SCREEN_H [UIScreen mainScreen].bounds.size.height
@implementation ZY_AlertNotesView

+(ZY_AlertNotesView *)shareView{
    
    static ZY_AlertNotesView * zy_alertnotesView = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        zy_alertnotesView = [[ZY_AlertNotesView alloc]init];
    });
    return zy_alertnotesView;
    
}
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.frame = [[UIScreen mainScreen] bounds];
        self.backgroundColor = [UIColor colorWithRed:103/255.0 green:103/255.0 blue:103/255.0 alpha:0.6];
        self.backView.frame = CGRectMake(60, 120, SCREEN_W - 120, SCREEN_H/2);
        self.titleName.frame = CGRectMake(0, 10, self.backView.frame.size.width, 30);
        self.contentLabel.frame = CGRectMake(5, CGRectGetMaxY(self.titleName.frame) + 20, self.backView.frame.size.width, 40);
        [self.backView addSubview:self.titleName];
        [self.backView addSubview:self.contentLabel];
        
        self.cancel.frame = CGRectMake(SCREEN_W/2 - 15, CGRectGetMaxY(self.backView.frame) + 40, 30, 30);
        [self addSubview:self.cancel];
        [self addSubview:self.backView];
        
    }
    return self;
}
-(void)show:(NSString *)str Font:(CGFloat)font{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.5;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];

    self.contentLabel.text = str;
    self.contentLabel.font = [UIFont systemFontOfSize:font];
    [self.backView.layer addAnimation:animation forKey:nil];
    [self updateFrame:str Font:font];
    ZYLog(@"%f -- %f \n %f -- %f",self.backView.frame.origin.x,self.backView.frame.origin.y,self.backView.frame.size.width,self.backView.frame.size.height);
}

-(void)updateFrame:(NSString *)str Font:(CGFloat)font{

    self.backView.frame = CGRectMake(60, 120, SCREEN_W - 120, SCREEN_H/2);
    self.titleName.frame = CGRectMake(0, 10, self.backView.frame.size.width, 30);
    self.contentLabel.frame = CGRectMake(5, CGRectGetMaxY(self.titleName.frame) + 20, self.backView.frame.size.width - 10, [self heightWithString:str fontSize:font width:self.backView.frame.size.width]);

}
#pragma mark - cancel按钮点击方法
-(void)cancelClick:(UIButton *)btn{

//    [UIView animateWithDuration:0.15
//                          delay:0
//                        options:UIViewAnimationCurveEaseIn | UIViewAnimationOptionAllowUserInteraction
//                     animations:^{
//                         self.titleName.transform = CGAffineTransformScale(self.titleName.transform, 0.8, 0.8);
//                     }
//                     completion:^(BOOL finished){
//                         [self removeFromSuperview];
//                     }];

    [self removeFromSuperview];
}
//获取字符串高度
- (CGFloat)heightWithString:(NSString*)string fontSize:(CGFloat)fontSize width:(CGFloat)width
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //    paragraphStyle.lineSpacing = 4;// 字体的行间距
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize], NSParagraphStyleAttributeName:paragraphStyle};
    CGSize newSize;
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_0) {
        newSize = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    }
    return newSize.height;
    
}

#pragma mark - lan
-(UIView *)backView{
    if (_backView == nil) {
        _backView = [UIView new];
        _backView.backgroundColor = [UIColor whiteColor];
        _backView.layer.masksToBounds = YES;
        _backView.layer.cornerRadius  = 8;
    }
    return _backView;
}
-(UILabel *)titleName{
    if (_titleName == nil) {
        _titleName = [UILabel new];
        _titleName.textAlignment = NSTextAlignmentCenter;
        _titleName.textColor = [UIColor lightGrayColor];
        _titleName.font = [UIFont systemFontOfSize:20];
        _titleName.text = @"通    知";
    }
    return _titleName;
}
-(UILabel *)contentLabel{
    if (_contentLabel == nil) {
        _contentLabel = [UILabel new];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}
-(UIButton *)cancel{
    if (_cancel == nil) {
        _cancel = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancel setBackgroundImage:[UIImage imageNamed:@"backImages"] forState:UIControlStateNormal];
        [_cancel addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancel;
}
@end
