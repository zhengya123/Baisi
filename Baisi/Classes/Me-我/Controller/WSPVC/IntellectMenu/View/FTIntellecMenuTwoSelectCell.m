//
//  FTIntellecMenuTwoSelectCell.m
//  Baisi
//
//  Created by 中商国际 on 2017/10/23.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "FTIntellecMenuTwoSelectCell.h"
#define BGColor [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0];
@implementation FTIntellecMenuTwoSelectCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setModels:(FTIntellecMenuSelectModel *)models{
    _models = models;
    [self.Leftbtn setTitle:_models.leftStr forState:UIControlStateNormal];
    [self.rightBtn setTitle:_models.rightStr forState:UIControlStateNormal];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.Leftbtn.frame = CGRectMake(0, 0, self.frame.size.width/2, self.frame.size.height);
    self.rightBtn.frame = CGRectMake(CGRectGetMaxX(self.Leftbtn.frame), 0, self.frame.size.width/2, self.frame.size.height);
    self.lineV.frame = CGRectMake(CGRectGetMaxX(self.Leftbtn.frame), self.frame.size.height/4, 1, self.frame.size.height/2);
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}
- (void)createUI{
    [self.contentView addSubview:self.Leftbtn];
    [self.contentView addSubview:self.rightBtn];
    [self.contentView addSubview:self.lineV];

}
- (void)leftClick:(UIButton *)btn{
    UITableView *tableview = (UITableView *)[[self superview] superview];
    NSIndexPath *indexPath = [tableview indexPathForCell:self];
    [self.delegate ClickdelegateMethod:indexPath str:@"left" type:_models.type2];
}
- (void)rightClick:(UIButton *)btn{
    UITableView *tableview = (UITableView *)[[self superview] superview];
    NSIndexPath *indexPath = [tableview indexPathForCell:self];
    [self.delegate ClickdelegateMethod:indexPath str:@"right" type:_models.type2];
}
- (UIButton *)Leftbtn{
    if (_Leftbtn == nil) {
        _Leftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_Leftbtn setTitleColor:[UIColor colorWithRed:175/255.0 green:175/255.0 blue:175/255.0 alpha:1.0] forState:UIControlStateNormal];
        _Leftbtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_Leftbtn addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _Leftbtn;
}
- (UIButton *)rightBtn{
    if (_rightBtn == nil) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBtn setTitleColor:[UIColor colorWithRed:175/255.0 green:175/255.0 blue:175/255.0 alpha:1.0] forState:UIControlStateNormal];
        _rightBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_rightBtn addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}
- (UIView *)lineV{
    if (_lineV == nil) {
        _lineV = [UIView new];
        _lineV.backgroundColor = BGColor;
    }
    return _lineV;
}
@end
