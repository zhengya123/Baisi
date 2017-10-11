//
//  PhotoAlbumModel.m
//  Baisi
//
//  Created by dqong on 2017/9/25.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "PhotoAlbumModel.h"

@implementation PhotoAlbumModel

+ (instancetype)setParameter:(NSDictionary *)dic{
    PhotoAlbumModel * model = [PhotoAlbumModel new];
    model.imageTime = dic[@"ImageTime"];
    model.Name      = dic[@"Name"];
    return model;
}
@end
