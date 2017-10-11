//
//  PhotoAlbumModel.h
//  Baisi
//
//  Created by dqong on 2017/9/25.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoAlbumModel : NSObject

@property (nonatomic, strong) NSString * imageTime;
@property (nonatomic, strong) NSString * Name;

+ (instancetype)setParameter:(NSDictionary *)dic;
@end
