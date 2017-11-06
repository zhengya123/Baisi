//
//  FTMaterialTextFieldCell.m
//  Baisi
//
//  Created by 中商国际 on 2017/10/26.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "FTMaterialTextFieldCell.h"
#import "PrefixHeader.pch"
@interface FTMaterialTextFieldCell ()<UITextFieldDelegate>

@end

@implementation FTMaterialTextFieldCell

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
    [self.contentView addSubview:self.foodNametextField];
    [self.contentView addSubview:self.foodSizetextField];
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.foodNametextField.frame = CGRectMake(10, 0, self.frame.size.width/4 * 3 - 10, self.frame.size.height);
    self.foodSizetextField.frame = CGRectMake(CGRectGetMaxX(self.foodNametextField.frame), 0, self.frame.size.width - CGRectGetMaxX(self.foodNametextField.frame) - 10, self.frame.size.height);

}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField == self.foodNametextField) {
        ZYLog(@"%@",textField.text);
    }else if(textField == self.foodSizetextField){
        ZYLog(@"%@",textField.text);
    }

}
#pragma mark - lan
- (UITextField *)foodNametextField{
    if (_foodNametextField == nil) {
        _foodNametextField = [UITextField new];
        _foodNametextField.textAlignment = NSTextAlignmentLeft;
        _foodNametextField.placeholder = @"食材如:西红柿";
        _foodNametextField.delegate = self;
    }
    return _foodNametextField;
}
- (UITextField *)foodSizetextField{
    if (_foodSizetextField == nil) {
        _foodSizetextField = [UITextField new];
        _foodSizetextField.textAlignment = NSTextAlignmentRight;
        _foodSizetextField.placeholder = @"用量:如50g";
        _foodSizetextField.delegate = self;
    }
    return _foodSizetextField;
}
@end
