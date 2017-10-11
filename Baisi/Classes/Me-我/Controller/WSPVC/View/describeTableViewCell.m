//
//  describeTableViewCell.m
//  Baisi
//
//  Created by dqong on 2017/6/8.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "describeTableViewCell.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@implementation describeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // setup subview UI
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.celltextField.frame = CGRectMake(0, 5, ScreenWidth - 60, 35);
    self.celldeleteBtn.frame = CGRectMake(CGRectGetMaxX(self.celltextField.frame) +10, 9, 26, 26);
    [self.contentView addSubview:self.celltextField];
    [self.contentView addSubview:self.celldeleteBtn];

}
- (void)deleteClick:(UIButton *)btn{
    UITableView *tableview = (UITableView *)[[self superview] superview];
    NSIndexPath *indexPath = [tableview indexPathForCell:self];
    [self.delegate deleteBtnMethod:indexPath];

}

-(void)textFieldDidEndEditing:(UITextField *)textField{

    UITableView *tableview = (UITableView *)[[self superview] superview];
    NSIndexPath *indexPath = [tableview indexPathForCell:self];
    [self.delegate changeTextFieldText:textField.text Index:indexPath];

}
#pragma mark - lan
- (UITextField *)celltextField{
    if (_celltextField == nil) {
        _celltextField = [UITextField new];
        _celltextField.placeholder = @"请输入描述内容";
        _celltextField.borderStyle = UITextBorderStyleRoundedRect;
        _celltextField.font = [UIFont fontWithName:@"Arial" size:15.0f];
        _celltextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _celltextField.keyboardAppearance=UIKeyboardAppearanceDefault;
        _celltextField.delegate = self;
    }
    return _celltextField;
}
-(UIButton *)celldeleteBtn{
    if (_celldeleteBtn == nil) {
        _celldeleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_celldeleteBtn setTitle:@"删" forState:UIControlStateNormal];
        [_celldeleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_celldeleteBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [_celldeleteBtn setBackgroundColor:[UIColor redColor]];
        [_celldeleteBtn addTarget:self action:@selector(deleteClick:) forControlEvents:UIControlEventTouchUpInside];
        _celldeleteBtn.layer.masksToBounds = YES;
        _celldeleteBtn.layer.cornerRadius = 13;
        
    }
    return _celldeleteBtn;
}
@end
