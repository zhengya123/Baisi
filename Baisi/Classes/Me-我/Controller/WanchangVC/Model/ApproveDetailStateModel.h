//
//  ApproveDetailStateModel.h
//  Baisi
//
//  Created by dqong on 2017/6/28.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApproveDetailStateModel : NSObject


@property (nonatomic, strong) NSString * userName;
@property (nonatomic, strong) NSString * State;
@property (nonatomic, strong) NSString * Time;
@property (nonatomic, strong) NSString * Type;
@property (nonatomic, strong) NSString * ReceiveContent;

+ (instancetype)setpartmentWith:(NSDictionary *)dic;
@end
