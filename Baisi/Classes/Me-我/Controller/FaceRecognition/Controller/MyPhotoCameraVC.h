//
//  MyPhotoCameraVC.h
//  Baisi
//
//  Created by dqong on 2017/7/12.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol cameraDelegate <NSObject>

- (void)getPicture:(UIImage *)img;

@end
@interface MyPhotoCameraVC : UIViewController
@property (nonatomic, strong) id<cameraDelegate>delegate;
@end
