//
//  BaiduMapBottomView.m
//  Baisi
//
//  Created by dqong on 2017/6/9.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "BaiduMapBottomView.h"

@implementation BaiduMapBottomView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.addressLabel];
        [self addSubview:self.timeLabel];
        [self addSubview:self.qiandaoBtn];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.addressLabel.frame = CGRectMake(10, 5, self.frame.size.width - 120, self.frame.size.height/2);
    self.timeLabel.frame = CGRectMake(10, CGRectGetMaxY(self.addressLabel.frame) + 2, self.frame.size.width - 100, self.frame.size.height/2 - 5);
    self.qiandaoBtn.frame = CGRectMake(self.frame.size.width - 80, 10, self.frame.size.height - 20, self.frame.size.height - 20);
    self.qiandaoBtn.layer.cornerRadius = (self.frame.size.height - 20)/2;
}

-(void)qiandaoBtnClick:(UIButton *)btn{
    [self.Delegate gotoQiandao];

}
- (UILabel *)addressLabel{
    if (_addressLabel == nil) {
        _addressLabel = [UILabel new];
        _addressLabel.textAlignment = NSTextAlignmentLeft;
        _addressLabel.font = [UIFont systemFontOfSize:15];
        _addressLabel.numberOfLines = 0;
        _addressLabel.text = @"--------------";
        
    }
    return _addressLabel;
}
-(UILabel *)timeLabel{

    if (_timeLabel == nil) {
        _timeLabel = [UILabel new];
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        _timeLabel.font = [UIFont systemFontOfSize:15];
        _timeLabel.numberOfLines = 0;
        _timeLabel.text = @"--------------";
        
    }
    return _timeLabel;
}

-(UIButton *)qiandaoBtn{
    if (_qiandaoBtn == nil) {
        _qiandaoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_qiandaoBtn setTitle:@"签到" forState:UIControlStateNormal];
        [_qiandaoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_qiandaoBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [_qiandaoBtn setBackgroundColor:[UIColor colorWithRed:57/255.0 green:184/255.0 blue:35/255.0 alpha:0.8]];
        [_qiandaoBtn addTarget:self action:@selector(qiandaoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _qiandaoBtn.layer.masksToBounds = YES;
    }
    return _qiandaoBtn;
}
@end
