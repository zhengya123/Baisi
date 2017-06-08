//
//  SeconddescribeTableViewCell.h
//  Baisi
//
//  Created by dqong on 2017/6/8.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SeconddeleteBtnDelegate <NSObject>

-(void) SeconddeleteBtnMethod:(NSIndexPath *)indexP;
-(void) SecondChangeTextFieldText:(NSString *)text Index:(NSIndexPath *)indexS;
@end
@interface SeconddescribeTableViewCell : UITableViewCell <UITextFieldDelegate>

@property (nonatomic, strong) UITextField * celltextField;
@property (nonatomic, strong) UITextField * SizeTextField;
@property (nonatomic, strong) UIButton    * celldeleteBtn;

@property (nonatomic, assign) id<SeconddeleteBtnDelegate>delegate;
@end
