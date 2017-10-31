//
//  FTMaterialTipsCell.m
//  Baisi
//
//  Created by 中商国际 on 2017/10/31.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "FTMaterialTipsCell.h"

@implementation FTMaterialTipsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}
- (void)createUI{
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.textView];
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(0, 10, self.frame.size.width, 20);
    self.textView.frame   = CGRectMake(10, CGRectGetMaxY(self.titleLabel.frame) + 10, self.frame.size.width - 20, 100);

}
#pragma mark - lan
- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"-小贴士-";
        _titleLabel.font = [UIFont systemFontOfSize:18];
    }
    return _titleLabel;
}
- (UITextView*)textView{
    if (_textView == nil) {
        _textView = [UITextView new];
        _textView.backgroundColor = [UIColor colorWithRed:244/255.0 green:230/255.0 blue:222/255.0 alpha:0.8];
        _textView.text = @"讲讲让这道菜更美味的小细节吧";
        _textView.textColor = [UIColor colorWithRed:175/255.0 green:175/255.0 blue:175/255.0 alpha:1.0];
        _textView.font = [UIFont systemFontOfSize:13];
    }
    return _textView;
}
@end
