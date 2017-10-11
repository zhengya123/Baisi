//
//  OcTopUs-Loading.h
//  Baisi
//
//  Created by dqong on 2017/4/17.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OcTopUs_Loading : UIView


@property (nonatomic, strong) UIImageView * imageV;

+(OcTopUs_Loading *)shareLoading;

-(void)show;
-(void)hides;

@end
