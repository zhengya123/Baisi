//
//  ApproveGoOutModel.m
//  Baisi
//
//  Created by dqong on 2017/6/27.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "ApproveGoOutModel.h"

@implementation ApproveGoOutModel

+(instancetype)setPartmentWith:(NSDictionary *)dic{
    ApproveGoOutModel * model = [ApproveGoOutModel new];
    model.department          = [NSString stringWithFormat:@"%@",dic[@"department"]];
    model.beginTime           = [NSString stringWithFormat:@"%@",dic[@"beginTime"]];
    model.endTime             = [NSString stringWithFormat:@"%@",dic[@"endTime"]];
    model.GoOutTime           = [NSString stringWithFormat:@"%@",dic[@"GoOutTime"]];
    model.GoOutReason         = [NSString stringWithFormat:@"%@",dic[@"GoOutReason"]];
    return model;
}
@end
