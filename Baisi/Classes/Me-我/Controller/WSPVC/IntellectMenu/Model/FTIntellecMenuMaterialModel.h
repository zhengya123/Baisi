//
//  FTIntellecMenuMaterialModel.h
//  Baisi
//
//  Created by 中商国际 on 2017/10/24.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTIntellecMenuMaterialModel : NSObject
@property (nonatomic, strong) NSString * type;
@property (nonatomic, strong) NSString * foodName;
@property (nonatomic, strong) NSString * sizes;

+ (instancetype)setParameter:(NSDictionary *)dic;
@end
