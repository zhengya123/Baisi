//
//  DescribeView.h
//  Baisi
//
//  Created by dqong on 2017/6/8.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "describeTableViewCell.h"
#import "SeconddescribeTableViewCell.h"
@protocol addBtnDelegate <NSObject>

- (void)updateFrame;
- (void)getChangeText1:(NSMutableArray *)arr;
- (void)getChangeText2:(NSMutableArray *)arr;
@end
@interface DescribeView : UIView <UITableViewDelegate,UITableViewDataSource,deleteBtnDelegate,SeconddeleteBtnDelegate>

@property (nonatomic, strong) NSString *  type;
@property (nonatomic, strong) UILabel * V_titleLabel;
@property (nonatomic, strong) UIButton * V_addBtn;
@property (nonatomic, strong) UITableView * V_tableView;
@property (nonatomic, strong) NSMutableArray * dataArray;


@property (nonatomic, assign) id<addBtnDelegate>delegate;
@end
