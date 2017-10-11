//
//  describeTableViewCell.h
//  Baisi
//
//  Created by dqong on 2017/6/8.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol deleteBtnDelegate <NSObject>

-(void) deleteBtnMethod:(NSIndexPath *)indexP;
-(void) changeTextFieldText:(NSString *)text Index:(NSIndexPath *)indexS;
@end
@interface describeTableViewCell : UITableViewCell <UITextFieldDelegate>

@property (nonatomic, strong) UITextField * celltextField;
@property (nonatomic, strong) UIButton    * celldeleteBtn;

@property (nonatomic, assign) id<deleteBtnDelegate>delegate;

@end
