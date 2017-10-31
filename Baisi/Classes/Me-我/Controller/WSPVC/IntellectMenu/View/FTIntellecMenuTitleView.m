//
//  FTIntellecMenuTitleView.m
//  Baisi
//
//  Created by 中商国际 on 2017/10/23.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "FTIntellecMenuTitleView.h"
#define BGColor [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0];
#define TextColor [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
@implementation FTIntellecMenuTitleView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.coverImgV];
        [self addSubview:self.MemuName];
        [self addSubview:self.lineV];
        [self addSubview:self.describeLabel];
        [self addSubview:self.bottomlineV];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.coverImgV.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.width * 9/16);
    self.MemuName.frame  = CGRectMake(0, CGRectGetMaxY(self.coverImgV.frame) + 5, self.frame.size.width, 50);
    self.lineV.frame     = CGRectMake(20, CGRectGetMaxY(self.MemuName.frame), self.frame.size.width - 40, 1);
    self.describeLabel.frame = CGRectMake(20, CGRectGetMaxY(self.lineV.frame) + 10, self.frame.size.width - 40, [self heightWithString:self.describe fontSize:13 width:self.frame.size.width - 40]);
    self.bottomlineV.frame = CGRectMake(0, CGRectGetMaxY(self.describeLabel.frame) + 10, self.frame.size.width, 10);
    self.MemuName.text = [NSString stringWithFormat:@"%@",self.titleName];
    self.describeLabel.text = [NSString stringWithFormat:@"%@",self.describe];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.describeLabel.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:10];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.describeLabel.text length])];
    self.describeLabel.attributedText = attributedString;
    
}
- (UIImageView *)coverImgV{
    if (_coverImgV == nil) {
        _coverImgV = [UIImageView new];
        _coverImgV.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0];
    }
    return _coverImgV;
}
- (UILabel *)MemuName{
    if (_MemuName == nil) {
        _MemuName = [UILabel new];
        _MemuName.textColor = [UIColor blackColor];
        _MemuName.font = [UIFont systemFontOfSize:20];
        _MemuName.textAlignment = NSTextAlignmentCenter;
    }
    return _MemuName;
}
- (UIView *)lineV{
    if (_lineV == nil) {
        _lineV = [UIView new];
        _lineV.backgroundColor = BGColor;
    }
    return _lineV;
}
- (UILabel *)describeLabel{
    if (_describeLabel == nil) {
        _describeLabel = [UILabel new];
        _describeLabel.textColor = TextColor;
        _describeLabel.font = [UIFont systemFontOfSize:13];
        _describeLabel.numberOfLines = 0;
        
    }
    return _describeLabel;
}
- (UIView *)bottomlineV{
    if (_bottomlineV == nil) {
        _bottomlineV = [UIView new];
        _bottomlineV.backgroundColor = BGColor;
    }
    return _bottomlineV;
}
#pragma mark - commonMethod
-(CGFloat)heightWithString:(NSString*)string fontSize:(CGFloat)fontSize width:(CGFloat)width
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 10;// 字体的行间距
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize], NSParagraphStyleAttributeName:paragraphStyle};
    CGSize newSize;
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_0) {
        newSize = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    }
    return newSize.height;
    
}
@end
