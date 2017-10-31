//
//  FTMaterialStepCell.m
//  Baisi
//
//  Created by 中商国际 on 2017/10/30.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "FTMaterialStepCell.h"
#define BGColor [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0];
#define TextColors [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
@implementation FTMaterialStepCell

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
    [self.contentView addSubview:self.titleBottomLabel];
    [self.contentView addSubview:self.StepimageView];
    [self.contentView addSubview:self.inputStepTextField];
    [self.contentView addSubview:self.lineV];
    [self.contentView addSubview:self.recordcurve];
    [self.contentView addSubview:self.addTips];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(0, 10, self.frame.size.width, 20);
    self.titleBottomLabel.frame = CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame) + 10, self.frame.size.width, 20);
    self.StepimageView.frame = CGRectMake(10, CGRectGetMaxY(self.titleBottomLabel.frame) + 10, self.frame.size.width - 20, (self.frame.size.width - 20) * 9/16);
    self.inputStepTextField.frame = CGRectMake(20, CGRectGetMaxY(self.StepimageView.frame) + 10, self.frame.size.width - 40, 30);
    self.lineV.frame = CGRectMake(20, CGRectGetMaxY(self.inputStepTextField.frame), self.frame.size.width - 40, 1);
    self.recordcurve.frame = CGRectMake(0, CGRectGetMaxY(self.lineV.frame), self.frame.size.width/2, 44);
    self.addTips.frame = CGRectMake(CGRectGetMaxX(self.recordcurve.frame), CGRectGetMaxY(self.lineV.frame), self.frame.size.width/2, 44);
}
- (void)addTipClick:(UIButton *)btn{
    UITableView *tableview = (UITableView *)[[self superview] superview];
    NSIndexPath *indexPath = [tableview indexPathForCell:self];
    [self.delegate addTipsMethod:indexPath];
}
- (void)recordCurveClick:(UIButton *)btn{
    UITableView *tableview = (UITableView *)[[self superview] superview];
    NSIndexPath *indexPath = [tableview indexPathForCell:self];
    [self.delegate recordcurveMethod:indexPath];

}
#pragma mark - lan
- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"-烹饪步骤-";
        _titleLabel.font = [UIFont systemFontOfSize:18];
    }
    return _titleLabel;
}
- (UILabel *)titleBottomLabel{
    if (_titleBottomLabel == nil) {
        _titleBottomLabel = [UILabel new];
        _titleBottomLabel.textAlignment = NSTextAlignmentCenter;
        _titleBottomLabel.font = [UIFont systemFontOfSize:13];
        _titleBottomLabel.text = @"批量添加步骤";
        _titleBottomLabel.textColor = [UIColor grayColor];
    }
    return _titleBottomLabel;
}
- (UIImageView *)StepimageView{
    if (_StepimageView == nil) {
        _StepimageView = [UIImageView new];
        _StepimageView.backgroundColor = BGColor;
    }
    return _StepimageView;
}
- (UITextField *)inputStepTextField{
    if (_inputStepTextField == nil) {
        _inputStepTextField = [UITextField new];
        _inputStepTextField.placeholder = @"步骤详细描述";
        _inputStepTextField.font = [UIFont systemFontOfSize:13];
    }
    return _inputStepTextField;
}
- (UIView *)lineV{
    if (_lineV == nil) {
        _lineV = [UIView new];
        _lineV.backgroundColor = BGColor;
    }
    return _lineV;
}
- (UIButton *)recordcurve{
    if (_recordcurve == nil) {
        _recordcurve = [UIButton buttonWithType:UIButtonTypeCustom];
        [_recordcurve setTitle:@"录制烹饪曲线" forState:UIControlStateNormal];
        [_recordcurve setTitleColor:[UIColor colorWithRed:175/255.0 green:175/255.0 blue:175/255.0 alpha:1.0] forState:UIControlStateNormal];
        _recordcurve.titleLabel.textAlignment = NSTextAlignmentLeft;
        _recordcurve.titleLabel.font = [UIFont systemFontOfSize:13];
        [_recordcurve addTarget:self action:@selector(recordCurveClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _recordcurve;
}
- (UIButton *)addTips{
    if (_addTips == nil) {
        _addTips = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addTips setTitle:@"添加小贴士" forState:UIControlStateNormal];
        [_addTips setTitleColor:[UIColor colorWithRed:175/255.0 green:175/255.0 blue:175/255.0 alpha:1.0] forState:UIControlStateNormal];
        _addTips.titleLabel.textAlignment = NSTextAlignmentRight;
        _addTips.titleLabel.font = [UIFont systemFontOfSize:13];
        [_addTips addTarget:self action:@selector(addTipClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addTips;
}
@end
