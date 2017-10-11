//
//  GenderSelectView.h
//  Baisi
//
//  Created by dqong on 2017/9/21.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol GenderSelectDelegate <NSObject>

- (void)genderSelect:(NSString *)gender;

@end
@interface GenderSelectView : UIView


@property (nonatomic, strong) UIView * baseView;
@property (nonatomic, strong) UILabel * titlelabel;
@property (nonatomic, strong) UIButton * ManGender;
@property (nonatomic, strong) UIButton * WomenGender;
@property (nonatomic, strong) UIButton * cancelBtn;
@property (nonatomic, assign) id<GenderSelectDelegate>delegate;

+ (GenderSelectView *)shareView;
- (void)shoeWithView:(UIView *)view Delegate:(id<GenderSelectDelegate>)delegate;
- (void)hides;
@end
