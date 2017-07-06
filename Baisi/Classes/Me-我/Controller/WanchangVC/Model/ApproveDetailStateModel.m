//
//  ApproveDetailStateModel.m
//  Baisi
//
//  Created by dqong on 2017/6/28.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "ApproveDetailStateModel.h"

@implementation ApproveDetailStateModel

//数据没有容错，到时候注意一下
+(instancetype)setpartmentWith:(NSDictionary *)dic{
    ApproveDetailStateModel * model = [ApproveDetailStateModel new];
    model.userName = dic[@"userName"];
    model.State = dic[@"State"];
    model.Time = dic[@"Time"];
    model.Type = dic[@"type"];
    model.ReceiveContent = dic[@"receiveContent"];
    return model;
}
@end
