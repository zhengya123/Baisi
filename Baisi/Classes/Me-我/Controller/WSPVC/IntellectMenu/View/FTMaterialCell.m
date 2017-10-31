//
//  FTMaterialCell.m
//  Baisi
//
//  Created by 中商国际 on 2017/10/24.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "FTMaterialCell.h"

@implementation FTMaterialCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setModel:(FTIntellecMenuMaterialModel *)model{
    _model = model;
    //self.middle.frame = CGRectMake(30, 0, self.frame.size.width - 60, self.frame.size.height);
    
    self.foodName.text = _model.foodName;
    self.Size.text = _model.sizes;

}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}
- (void)createUI{
    [self.contentView addSubview:self.middle];
    [self.contentView addSubview:self.foodName];
    [self.contentView addSubview:self.Size];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.foodName.frame = CGRectMake(30, 0, [self stringWithSize:_model.foodName fontOfSize:17], 44);
    self.Size.frame = CGRectMake(self.frame.size.width - [self stringWithSize:_model.sizes fontOfSize:17] - 30, 0, [self stringWithSize:_model.sizes fontOfSize:17], 44);
}
#pragma mark - lan
- (UILabel *)foodName{
    if (_foodName == nil) {
        _foodName = [UILabel new];
        _foodName.backgroundColor = [UIColor whiteColor];
        _foodName.textAlignment = NSTextAlignmentLeft;
    }
    return _foodName;
}
- (UILabel *)Size{
    if (_Size == nil) {
        _Size = [UILabel new];
        _Size.backgroundColor = [UIColor whiteColor];
        _Size.textAlignment = NSTextAlignmentRight;
    }
    return _Size;
}
//- (UILabel *)middle{
//    if (_middle == nil) {
//        _middle = [UILabel new];
//        _middle.text = @"·······························";
//    }
//    return _middle;
//}
- (CGFloat)stringWithSize:(NSString*)string fontOfSize:(CGFloat)font
{
    CGRect rect =[string boundingRectWithSize:CGSizeMake(1000, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil];
    return rect.size.width;
}
@end
