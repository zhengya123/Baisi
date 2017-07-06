//
//  ApproveLeaveModel.m
//  Baisi
//
//  Created by dqong on 2017/6/27.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "ApproveLeaveModel.h"

@implementation ApproveLeaveModel

+ (instancetype)setPartmentWithDic:(NSDictionary *)dic{
    ApproveLeaveModel * model = [ApproveLeaveModel new];
    model.department          = [NSString stringWithFormat:@"%@",dic[@"department"]];
    model.approveType         = [NSString stringWithFormat:@"%@",dic[@"approveType"]];
    model.beginTime           = [NSString stringWithFormat:@"%@",dic[@"beginTime"]];
    model.endTime             = [NSString stringWithFormat:@"%@",dic[@"endTime"]];
    model.approveNum          = [NSString stringWithFormat:@"%@",dic[@"approveNum"]];
    model.approveReason       = [NSString stringWithFormat:@"%@",dic[@"approveReason"]];
    return model;
}
@end
