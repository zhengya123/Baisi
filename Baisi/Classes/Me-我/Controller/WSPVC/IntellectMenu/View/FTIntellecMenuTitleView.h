//
//  FTIntellecMenuTitleView.h
//  Baisi
//
//  Created by 中商国际 on 2017/10/23.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FTIntellecMenuTitleView : UIView

@property (nonatomic, strong) UIImage  * img;
@property (nonatomic, strong) NSString * titleName;
@property (nonatomic, strong) NSString * describe;

@property (nonatomic, strong) UIImageView * coverImgV;
@property (nonatomic, strong) UILabel     * MemuName;
@property (nonatomic, strong) UIView      * lineV;
@property (nonatomic, strong) UILabel     * describeLabel;
@property (nonatomic, strong) UIView      * bottomlineV;

@end
