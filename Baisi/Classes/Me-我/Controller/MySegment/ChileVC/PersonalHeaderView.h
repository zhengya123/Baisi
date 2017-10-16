//
//  PersonalHeaderView.h
//  Baisi
//
//  Created by 中商国际 on 2017/10/16.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PersonHeaderViewDelegate <NSObject>

- (void)brnClick;

@end

@interface PersonalHeaderView : UIView

@property (nonatomic, strong) UIButton * rebackBtn;
@property (nonatomic, assign) id<PersonHeaderViewDelegate>delegate;
@end
