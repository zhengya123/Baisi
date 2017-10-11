//
//  SeconddescribeTableViewCell.m
//  Baisi
//
//  Created by dqong on 2017/6/8.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "SeconddescribeTableViewCell.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@implementation SeconddescribeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // setup subview UI
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.celltextField.frame = CGRectMake(0, 5, (ScreenWidth - 70)/2, 35);
    self.SizeTextField.frame = CGRectMake(CGRectGetMaxX(self.celltextField.frame) +10, 5, (ScreenWidth - 70)/2, 35);
    self.celldeleteBtn.frame = CGRectMake(CGRectGetMaxX(self.SizeTextField.frame) +10, 9, 26, 26);
    [self.contentView addSubview:self.celltextField];
    [self.contentView addSubview:self.SizeTextField];
    [self.contentView addSubview:self.celldeleteBtn];

}
- (void)seconddeleteClick:(UIButton *)btn{

    UITableView *tableview = (UITableView *)[[self superview] superview];
    NSIndexPath *indexPath = [tableview indexPathForCell:self];
    [self.delegate SeconddeleteBtnMethod:indexPath];

}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    UITableView *tableview = (UITableView *)[[self superview] superview];
    NSIndexPath *indexPath = [tableview indexPathForCell:self];
    [self.delegate SecondChangeTextFieldText:[NSString stringWithFormat:@"%@--%@",self.celltextField.text,self.SizeTextField.text] Index:indexPath];
}
#pragma mark - lan
- (UITextField *)celltextField{
    if (_celltextField == nil) {
        _celltextField = [UITextField new];
        _celltextField.placeholder = @"用料名称";
        _celltextField.borderStyle = UITextBorderStyleRoundedRect;
        _celltextField.font = [UIFont fontWithName:@"Arial" size:15.0f];
        _celltextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _celltextField.keyboardAppearance=UIKeyboardAppearanceDefault;
        _celltextField.delegate = self;
    }
    return _celltextField;
}
- (UITextField *)SizeTextField{
    if (_SizeTextField == nil) {
        _SizeTextField = [UITextField new];
        _SizeTextField.placeholder = @"用量（含单位）";
        _SizeTextField.borderStyle = UITextBorderStyleRoundedRect;
        _SizeTextField.font = [UIFont fontWithName:@"Arial" size:15.0f];
        _SizeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _SizeTextField.keyboardAppearance=UIKeyboardAppearanceDefault;
        _SizeTextField.delegate = self;
    }
    return _SizeTextField;
}
-(UIButton *)celldeleteBtn{
    if (_celldeleteBtn == nil) {
        _celldeleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_celldeleteBtn setTitle:@"删" forState:UIControlStateNormal];
        [_celldeleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_celldeleteBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [_celldeleteBtn setBackgroundColor:[UIColor redColor]];
        [_celldeleteBtn addTarget:self action:@selector(seconddeleteClick:) forControlEvents:UIControlEventTouchUpInside];
        _celldeleteBtn.layer.masksToBounds = YES;
        _celldeleteBtn.layer.cornerRadius = 13;
        
    }
    return _celldeleteBtn;
}

@end
