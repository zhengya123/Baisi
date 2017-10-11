//
//  HHAllMemberVCModel.m
//  Baisi
//
//  Created by dqong on 2017/4/12.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "HHAllMemberVCModel.h"

@implementation HHAllMemberVCModel

+(instancetype)setModelWithDic:(NSDictionary *)dic{
    HHAllMemberVCModel * model = [HHAllMemberVCModel new];
    model.member_id            = [HHAllMemberVCModel isEmpty:[dic objectForKey:@"member_id"]];
    model.name                 = [HHAllMemberVCModel isEmpty:[dic objectForKey:@"name"]];
    model.img                  = [HHAllMemberVCModel isEmpty:[dic objectForKey:@"img"]];
    return model;

}
//判断是不是为空类型
+(id)isEmpty:(NSString *)str
{
    if (![str isKindOfClass:[NSNull class]]) {
        
    }else
    {
        str=@"";
    }
    return str;
}

@end
