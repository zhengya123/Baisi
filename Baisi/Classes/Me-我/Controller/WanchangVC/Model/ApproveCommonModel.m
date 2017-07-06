//
//  ApproveCommonModel.m
//  Baisi
//
//  Created by dqong on 2017/6/28.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "ApproveCommonModel.h"

@implementation ApproveCommonModel

+(instancetype)setParameterWith:(NSDictionary *)dic{
    ApproveCommonModel * model = [ApproveCommonModel new];
    model.department     = dic[@"department"];
    model.applyContent   = dic[@"applyContent"];
    model.approveDetail  = dic[@"approveDetail"];
    model.accessoryName  = dic[@"accessoryName"];
    model.accessotySize  = dic[@"accessotySize"];
    return model;

}
@end
