//
//  FTIntellecMenuMaterialModel.m
//  Baisi
//
//  Created by 中商国际 on 2017/10/24.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "FTIntellecMenuMaterialModel.h"

@implementation FTIntellecMenuMaterialModel

+(instancetype)setParameter:(NSDictionary *)dic{
    FTIntellecMenuMaterialModel * model = [FTIntellecMenuMaterialModel new];
    model.foodName = [NSString stringWithFormat:@"%@",dic[@"foodName"]];
    model.sizes    = [NSString stringWithFormat:@"%@",dic[@"foodSize"]];
    return model;
}
@end
