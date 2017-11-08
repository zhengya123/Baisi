//
//  TableViewRefreshMethod.m
//  Baisi
//
//  Created by 中商国际 on 2017/11/8.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "TableViewRefreshMethod.h"
#import "PrefixHeader.pch"
#import "MJRefresh.h"
@implementation TableViewRefreshMethod

+ (void)tableViewRefresh:(UITableView *)tableView success:(void (^)(refreshType))success{

    NSMutableArray * images = [NSMutableArray new];
    for (int i=1; i<13; i++) {
        NSString * imageName = [NSString stringWithFormat:@"ifree_load_0%d@2x.png",i];
        UIImage * image = [UIImage imageNamed:imageName];
        [images addObject:image];
    }
    
    MJRefreshGifHeader * header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        success(TableViewHeaderRefresh);
    }];
    [header setImages:images forState:MJRefreshStateIdle];
    [header setImages:images forState:MJRefreshStatePulling];
    [header setImages:images forState:MJRefreshStateRefreshing];
    tableView.mj_header = header;
    [tableView.mj_header beginRefreshing];
    tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        success(TableViewFooterRefresh);
    }];
    tableView.mj_footer.automaticallyHidden = YES;
}
+ (void)endFresh:(UITableView *)tableView{
    [tableView.mj_header endRefreshing];
    [tableView.mj_footer endRefreshing];

}
@end
