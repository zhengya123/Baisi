//
//  FTIntellecMenuAddFoodMaterialCell.h
//  Baisi
//
//  Created by 中商国际 on 2017/10/24.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FTAddFoodMaterialDelegate <NSObject>

- (void)addFoodMaterical:(NSString *)type index:(NSIndexPath *)dex arr:(NSMutableArray *)muarr;

@end


@interface FTIntellecMenuAddFoodMaterialCell : UITableViewCell

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * getDataArr;//传递过来的arr
@property (nonatomic, strong) NSMutableArray * dataArr;
@property (nonatomic, strong) UIView * titleView;
@property (nonatomic, strong) UIView * footView;
@property (nonatomic, assign) id<FTAddFoodMaterialDelegate>delegate;
@end
