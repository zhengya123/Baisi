//
//  ApproveDetailStateCell.m
//  Baisi
//
//  Created by dqong on 2017/6/28.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "ApproveDetailStateCell.h"

@implementation ApproveDetailStateCell

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
- (void)setStatemodel:(ApproveDetailStateModel *)statemodel{
    _statemodel = statemodel;
    if ([_statemodel.Type isEqualToString:@"1"]) {
        self.StateImage.backgroundColor = [UIColor greenColor];
        self.State.textColor = [UIColor greenColor];
    }else if ([_statemodel.Type isEqualToString:@"2"]){
        self.StateImage.backgroundColor = [UIColor yellowColor];
        self.State.textColor = [UIColor yellowColor];
    }else{
        self.StateImage.backgroundColor = [UIColor redColor];
        self.State.textColor = [UIColor redColor];
    }
   
    self.userName.text = _statemodel.userName;
    self.State.text = _statemodel.State;
    self.TimeLabel.text = _statemodel.Time;
    if ([_statemodel.ReceiveContent isEqualToString:@""]) {
        self.baseV_LineV.hidden = YES;
        self.receiveContent.hidden = YES;
    }else{
        self.baseV_LineV.hidden = NO;
        self.receiveContent.hidden = NO;
        self.receiveContent.text = _statemodel.ReceiveContent;
        self.LabelBaseV.frame = CGRectMake(CGRectGetMaxX(self.StateImage.frame) + 10, 20, SCREEN_W - CGRectGetMaxX(self.StateImage.frame) - 20, 160 - 40);
        [self refreshFrame];
    }

}
-(void)setupUI{
    self.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:0.8];
    self.lineV1.frame = CGRectMake(20, 0, 1, 30);
    self.StateImage.frame = CGRectMake(10, CGRectGetMaxY(self.lineV1.frame), 20, 20);
    self.lineV2.frame = CGRectMake(20, CGRectGetMaxY(self.StateImage.frame), 1, 60);
    self.LabelBaseV.frame = CGRectMake(CGRectGetMaxX(self.StateImage.frame) + 10, 20, SCREEN_W - CGRectGetMaxX(self.StateImage.frame) - 20, 110 - 40);
    
    [self refreshFrame];
    [self.contentView addSubview:self.lineV1];
    [self.contentView addSubview:self.StateImage];
    [self.contentView addSubview:self.lineV2];
    [self.contentView addSubview:self.LabelBaseV];

    [self.LabelBaseV addSubview:self.userImageV];
    [self.LabelBaseV addSubview:self.userName];
    [self.LabelBaseV addSubview:self.State];
    [self.LabelBaseV addSubview:self.TimeLabel];
    [self.LabelBaseV addSubview:self.baseV_LineV];
    [self.LabelBaseV addSubview:self.receiveContent];
    
}
- (void)refreshFrame{
    self.userImageV.frame = CGRectMake(10, 10, 50, 50);
    self.userImageV.layer.cornerRadius = 25;
    self.userName.frame = CGRectMake(CGRectGetMaxX(self.userImageV.frame) + 10, 10, 100, 25);
    self.State.frame = CGRectMake(CGRectGetMaxX(self.userImageV.frame) + 10, CGRectGetMaxY(self.userName.frame), 100, 25);
    self.TimeLabel.frame = CGRectMake(CGRectGetMaxX(self.userName.frame), 10, CGRectGetMaxX(self.LabelBaseV.frame)/2, 25);
    self.baseV_LineV.frame = CGRectMake(CGRectGetMaxX(self.userImageV.frame) + 10, CGRectGetMaxY(self.userImageV.frame) + 5, self.LabelBaseV.frame.size.width - 80, 1);
    self.receiveContent.frame = CGRectMake(CGRectGetMaxX(self.userImageV.frame) + 10, CGRectGetMaxY(self.baseV_LineV.frame), self.LabelBaseV.frame.size.width - 80, 40);

}
#pragma mark - lan
- (UIView *)lineV1{
    if (_lineV1 == nil) {
        _lineV1 = [UIView new];
        _lineV1.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    }
    return _lineV1;

}
- (UIImageView *)StateImage{
    if (_StateImage == nil) {
        _StateImage = [UIImageView new];
        _StateImage.layer.masksToBounds = YES;
        _StateImage.layer.cornerRadius  = 10;
    }
    return _StateImage;
}
- (UIView *)lineV2{
    if (_lineV2 == nil) {
        _lineV2 = [UIView new];
        _lineV2.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    }
    return _lineV2;
}
- (UIView *)LabelBaseV{
    if (_LabelBaseV == nil) {
        _LabelBaseV = [UIView new];
        _LabelBaseV.backgroundColor = [UIColor whiteColor];
        _LabelBaseV.layer.masksToBounds = YES;
        _LabelBaseV.layer.cornerRadius  = 8;
    }
    return _LabelBaseV;
}
- (UIImageView *)userImageV{
    if (_userImageV == nil) {
        _userImageV = [UIImageView new];
        _userImageV.backgroundColor = [UIColor lightGrayColor];
        _userImageV.layer.masksToBounds = YES;
    }
    return _userImageV;

}
- (UILabel *)userName{
    if (_userName == nil) {
        _userName = [UILabel new];
        _userName.textColor = [UIColor blackColor];
        _userName.font = [UIFont systemFontOfSize:19];
        _userName.textAlignment = NSTextAlignmentLeft;
    }
    return _userName;

}
- (UILabel *)State{
    if (_State == nil) {
        _State = [UILabel new];
        _State.font = [UIFont systemFontOfSize:16];
        _State.textAlignment = NSTextAlignmentLeft;
    }
    return _State;
}
- (UILabel *)TimeLabel{
    if (_TimeLabel == nil) {
        _TimeLabel = [UILabel new];
        _TimeLabel.textColor = [UIColor blackColor];
        _TimeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _TimeLabel;
}
- (UIView * )baseV_LineV{
    if (_baseV_LineV == nil) {
        _baseV_LineV = [UIView new];
        _baseV_LineV.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    }
    return _baseV_LineV;
}
- (UILabel *)receiveContent{
    if (_receiveContent == nil) {
        _receiveContent =[UILabel new];
        _receiveContent.textColor = [UIColor lightGrayColor];
        _receiveContent.textAlignment = NSTextAlignmentLeft;
    }
    return _receiveContent;
}
@end
