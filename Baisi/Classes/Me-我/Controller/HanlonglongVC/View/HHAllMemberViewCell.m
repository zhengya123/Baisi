//
//  HHAllMemberViewCell.m
//  Baisi
//
//  Created by dqong on 2017/4/12.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "HHAllMemberViewCell.h"
#import "UIImageView+WebCache.h"
@implementation HHAllMemberViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }

    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    

}
-(void)setVcmodel:(HHAllMemberVCModel *)vcmodel{
    _vcmodel = vcmodel;
    self.titleLabel.text = _vcmodel.name;
    if ([_vcmodel.member_id isEqualToString:@"add"]) {
        self.titleImagV.image = [UIImage imageNamed:_vcmodel.img];
    }else{
        [self.titleImagV sd_setImageWithURL:[NSURL URLWithString:_vcmodel.img] placeholderImage:[UIImage imageNamed:@"mine-icon-preview"]];
    }
   

}
-(void)setupUI{
    
    self.titleImagV.frame = CGRectMake(10, 5, SCREEN_W/5 - 20, SCREEN_W/5 - 20);
    self.titleImagV.layer.cornerRadius = (SCREEN_W/5 - 20)/2;
    self.titleLabel.frame = CGRectMake(5, CGRectGetMaxY(self.titleImagV.frame), SCREEN_W/5 - 10, 25);
    [self.contentView addSubview:self.titleImagV];
    [self.contentView addSubview:self.titleLabel];

}

#pragma mark - lan
-(UIImageView *)titleImagV{
    if (_titleImagV == nil) {
        _titleImagV = [UIImageView new];
        _titleImagV.backgroundColor = [UIColor whiteColor];
        _titleImagV.layer.masksToBounds = YES;
    }

    return _titleImagV;
}
-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleLabel;
}
@end
