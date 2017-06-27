//
//  ApproveReceiveModel.h
//  Baisi
//
//  Created by dqong on 2017/6/27.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApproveReceiveModel : NSObject

@property (nonatomic, strong) NSString * department;
@property (nonatomic, strong) NSString * goodsUse;
@property (nonatomic, strong) NSString * goodsName;
@property (nonatomic, strong) NSString * goodsNum;

+ (instancetype)setPartmentWithDicc:(NSDictionary *)dic;
@end
