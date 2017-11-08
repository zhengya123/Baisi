//
//  TableViewRefreshMethod.h
//  Baisi
//
//  Created by 中商国际 on 2017/11/8.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, refreshType) {
    TableViewHeaderRefresh,
    TableViewFooterRefresh

};


@interface TableViewRefreshMethod : NSObject

/**
 * tableView 刷新
 */
+ (void)tableViewRefresh:(UITableView *)tableView success:(void(^)(refreshType refresh))success;

/**
 * 结束刷新和加载
 */
+ (void)endFresh:(UITableView *)tableView;
@end
