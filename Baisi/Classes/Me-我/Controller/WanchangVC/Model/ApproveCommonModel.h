//
//  ApproveCommonModel.h
//  Baisi
//
//  Created by dqong on 2017/6/28.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApproveCommonModel : NSObject


@property (nonatomic, strong) NSString  * department;
@property (nonatomic, strong) NSString  * applyContent;
@property (nonatomic, strong) NSString  * approveDetail;
@property (nonatomic, strong) NSString  * accessoryName;
@property (nonatomic, strong) NSString  * accessotySize;

+(instancetype)setParameterWith:(NSDictionary *)dic;
@end
