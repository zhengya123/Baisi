//
//  ApproveGoOutModel.h
//  Baisi
//
//  Created by dqong on 2017/6/27.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApproveGoOutModel : NSObject

@property (nonatomic, strong) NSString * department;
@property (nonatomic, strong) NSString * beginTime;
@property (nonatomic, strong) NSString * endTime;
@property (nonatomic, strong) NSString * GoOutTime;
@property (nonatomic, strong) NSString * GoOutReason;

+ (instancetype)setPartmentWith:(NSDictionary *)dic;
@end
