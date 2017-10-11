//
//  RelationShipCell.m
//  Baisi
//
//  Created by dqong on 2017/9/21.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "RelationShipCell.h"

@implementation RelationShipCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}
-(void)createUI{
    
    self.relationlabel.frame = CGRectMake(self.frame.size.width/2 - 30, self.frame.size.height/2 - 15, 60, 30);
    [self.contentView addSubview:self.relationlabel];
    
    
}
- (UILabel *)relationlabel{
    if (_relationlabel == nil) {
        _relationlabel = [UILabel new];
        _relationlabel.textColor = [UIColor blackColor];
        _relationlabel.textAlignment = NSTextAlignmentCenter;
        _relationlabel.font = [UIFont systemFontOfSize:15];
        _relationlabel.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
        _relationlabel.layer.masksToBounds = YES;
        _relationlabel.layer.cornerRadius  = 14;
    }
    return _relationlabel;
}
@end
