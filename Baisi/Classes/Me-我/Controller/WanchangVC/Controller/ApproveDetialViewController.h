//
//  ApproveDetialViewController.h
//  Baisi
//
//  Created by dqong on 2017/6/27.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApproveDetialViewController : UIViewController

/**
 * 请假的类型 （1请假数据，2物品领用数据，3外出数据，4通用数据）
 */
@property (nonatomic, strong) NSString * Type;
/**
 * 请假详情
 */
@property (nonatomic, strong) NSString * approveTitle;
/**
 * 名字
 */
@property (nonatomic, strong) NSString * UserName;
@end
