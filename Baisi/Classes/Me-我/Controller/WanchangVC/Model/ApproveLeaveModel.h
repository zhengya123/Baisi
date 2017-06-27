//
//  ApproveLeaveModel.h
//  Baisi
//
//  Created by dqong on 2017/6/27.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApproveLeaveModel : NSObject
@property (nonatomic, strong) NSString * department;
@property (nonatomic, strong) NSString * approveType;
@property (nonatomic, strong) NSString * beginTime;
@property (nonatomic, strong) NSString * endTime;
@property (nonatomic, strong) NSString * approveNum;
@property (nonatomic, strong) NSString * approveReason;

+ (instancetype)setPartmentWithDic:(NSDictionary *)dic;
@end
