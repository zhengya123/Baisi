//
//  ApproveReceiveModel.m
//  Baisi
//
//  Created by dqong on 2017/6/27.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "ApproveReceiveModel.h"

@implementation ApproveReceiveModel

+(instancetype)setPartmentWithDicc:(NSDictionary *)dic{
    ApproveReceiveModel * model = [ApproveReceiveModel new];
    model.department            = [NSString stringWithFormat:@"%@",dic[@"department"]];
    model.goodsUse              = [NSString stringWithFormat:@"%@",dic[@"goodsUse"]];
    model.goodsName             = [NSString stringWithFormat:@"%@",dic[@"goodsName"]];
    model.goodsNum              = [NSString stringWithFormat:@"%@",dic[@"goodsNum"]];
    return model;
}
@end
