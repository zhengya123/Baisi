//
//  RelationSelectView.h
//  Baisi
//
//  Created by dqong on 2017/9/21.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol RelationShipDelegate <NSObject>

- (void)selectRelation:(NSString *)str;

@end

@interface RelationSelectView : UIView

@property (nonatomic, strong) UIButton * cancelBtn;
@property (nonatomic, strong) UIView  * baseView;
@property (nonatomic, strong) UILabel * titlelabel;
@property (nonatomic, strong) UIButton * fatherBtn;
@property (nonatomic, strong) UIButton * monthBtn;
@property (nonatomic, strong) UICollectionView  * collectionView;
@property (nonatomic, strong) NSArray     * dataArrays;
@property (nonatomic, assign) id<RelationShipDelegate>delegate;

+ (RelationSelectView *)shareView;
- (void)showWithView:(UIView *)view Delegate:(id<RelationShipDelegate>)delegate;
- (void)hides;
@end
