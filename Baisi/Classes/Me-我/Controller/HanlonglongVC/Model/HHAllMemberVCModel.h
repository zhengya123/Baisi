//
//  HHAllMemberVCModel.h
//  Baisi
//
//  Created by dqong on 2017/4/12.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HHAllMemberVCModel : NSObject

@property (nonatomic, strong) NSString * member_id;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * img;

+(instancetype)setModelWithDic:(NSDictionary *)dic;
+(id)isEmpty:(NSString *)str;
@end
