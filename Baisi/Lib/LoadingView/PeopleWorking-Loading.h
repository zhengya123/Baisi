//
//  PeopleWorking-Loading.h
//  Baisi
//
//  Created by dqong on 2017/4/17.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeopleWorking_Loading : UIView

@property (nonatomic, strong) UIImageView * imageV;

+(PeopleWorking_Loading *)shareLoading;

-(void)show;
-(void)hides;
@end
