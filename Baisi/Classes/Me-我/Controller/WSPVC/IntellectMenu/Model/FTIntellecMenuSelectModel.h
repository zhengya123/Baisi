//
//  FTIntellecMenuSelectModel.h
//  Baisi
//
//  Created by 中商国际 on 2017/10/23.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTIntellecMenuSelectModel : NSObject
@property (nonatomic, strong) NSString * type;
@property (nonatomic, strong) NSString * type2;
@property (nonatomic, strong) NSString * leftStr;
@property (nonatomic, strong) NSString * rightStr;
+ (instancetype)setParameter:(NSDictionary *)dic;
@end
