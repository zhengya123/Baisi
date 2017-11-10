//
//  FTIntellecMenuSelectModel.m
//  Baisi
//
//  Created by 中商国际 on 2017/10/23.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "FTIntellecMenuSelectModel.h"

@implementation FTIntellecMenuSelectModel
+(instancetype)setParameter:(NSDictionary *)dic{
    FTIntellecMenuSelectModel * model = [FTIntellecMenuSelectModel new];
    if ([[dic objectForKey:@"type"] isEqualToString:@"1"]) {
        
        model.leftStr  = [NSString stringWithFormat:@"%@",dic[@"left"]];
        model.rightStr = [NSString stringWithFormat:@"%@",dic[@"right"]];
        model.type2    = [NSString stringWithFormat:@"%@",dic[@"type2"]];
        
    }
    return model;
    
}
@end
