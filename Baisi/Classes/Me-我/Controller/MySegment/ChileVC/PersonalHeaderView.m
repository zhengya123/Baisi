//
//  PersonalHeaderView.m
//  Baisi
//
//  Created by 中商国际 on 2017/10/16.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "PersonalHeaderView.h"

@implementation PersonalHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.rebackBtn];
        
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.rebackBtn.frame = CGRectMake(10, 10, 50, 50);

}
#pragma mark - 返回按钮
- (void)rebackClick:(UIButton *)btn{
    [self.delegate brnClick];

}
- (UIButton *)rebackBtn{
    if (_rebackBtn == nil) {
        _rebackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rebackBtn setTitle:@"返回" forState:UIControlStateNormal];
        [_rebackBtn addTarget:self action:@selector(rebackClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rebackBtn;
}
@end
