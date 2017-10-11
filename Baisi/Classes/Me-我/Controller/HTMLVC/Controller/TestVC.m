//
//  TestVC.m
//  Baisi
//
//  Created by dqong on 2017/9/25.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "TestVC.h"
#import "ZY_Method.h"
#import "PhotoAlbumModel.h"
@interface TestVC ()

@end

@implementation TestVC
{
    NSString * clickTime;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self detailData];
//    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
//    [formatter setDateFormat:@"yyyy-MM-dd"];
//    NSDate * datenow = [NSDate date];
//    clickTime =  [formatter stringFromDate:datenow];
//    clickTime = [ZY_Method getAfterDate:clickTime days:7];
//    NSString * bt = nil;
//    NSString * et = nil;
//    [ZY_Method getDateInWeekWithDate:clickTime OutBegenTime:&bt OutendTime:&et];
//    [self gotorequest:bt end:et];
}
- (void)detailData{
NSArray * arr = @[
                            @{
                                @"ImageTime":@"2017-09-21",
                                @"Name":@"1.jpg",
                                @"CreateTime":@"2017-09-21",
                             },
                             @{
                                 @"ImageTime":@"2017-09-21",
                                 @"Name":@"2.jpg",
                                 @"CreateTime":@"2017-09-21",
                             },
                             @{
                                 @"ImageTime":@"2017-09-21",
                                 @"Name":@"3.jpg",
                                 @"CreateTime":@"2017-09-21",
                             },
                             @{
                                 @"ImageTime":@"2017-09-22",
                                 @"Name":@"223.jpg",
                                 @"CreateTime":@"2017-09-22",
                             },
                             @{
                                 @"ImageTime":@"2017-09-22",
                                 @"Name":@"222.jpg",
                                 @"CreateTime":@"2017-09-22",
                             },
                             @{
                                 @"ImageTime":@"2017-09-22",
                                 @"Name":@"221.jpg",
                                 @"CreateTime":@"2017-09-22",
                             },
                             @{
                                 @"ImageTime":@"2017-09-22",
                                 @"Name":@"224.jpg",
                                 @"CreateTime":@"2017-09-22",
                             },
                             @{
                                 @"ImageTime":@"2017-09-23",
                                 @"Name":@"231.jpg",
                                 @"CreateTime":@"2017-09-23",
                             },
                             @{
                                 @"ImageTime":@"2017-09-23",
                                 @"Name":@"232.jpg",
                                 @"CreateTime":@"2017-09-23",
                             },
                             @{
                                 @"ImageTime":@"2017-09-23",
                                 @"Name":@"233.jpg",
                                 @"CreateTime":@"2017-09-23",
                             },
                  ];
//    NSMutableArray * dateMutArr = [@[] mutableCopy];
//    NSMutableArray * array = [NSMutableArray arrayWithArray:arr];
//    for (int i = 0; i < array.count; i++) {
//        NSString * str = [array[i] objectForKey:@"ImageTime"];
//        NSMutableArray * tempArray = [@[] mutableCopy];
//        [tempArray addObject:str];
//        for (int j = i+1; j<array.count; j++) {
//            NSString * Jstr = [array[j] objectForKey:@"ImageTime"];
//            if ([str isEqualToString:Jstr]) {
//                [tempArray addObject:array[j]];
//                [array removeObjectAtIndex:j];
//            }
//        }
//        [dateMutArr addObject:tempArray];
//    }
//    
//    ZYLog(@"%@",dateMutArr);
    
    NSMutableDictionary *sortDic = [NSMutableDictionary dictionaryWithCapacity:0];
    for (NSDictionary *dic in arr) {
        NSString *imageTime = dic[@"ImageTime"];
        NSMutableArray *groupArr = sortDic[imageTime];
        if (!groupArr) {
            groupArr = [NSMutableArray arrayWithCapacity:0];
            [sortDic setObject:groupArr forKey:imageTime];
        }
        [groupArr addObject:dic];
        
    }
    
    for (NSString *key in sortDic) {
        NSLog(@"ImageTime:%@  array:%@",key,sortDic[key]);
    }

}
- (IBAction)beforeWeek:(UIButton *)sender {
    ZYLog(@"点击了上一周");
    [self LeftBtn];
}
- (IBAction)afterWeek:(UIButton *)sender {
    ZYLog(@"点击了下一周");
    [self RightBtn];
}

- (void)LeftBtn{
    NSString * bT = nil;
    NSString * eT = nil;
    clickTime = [ZY_Method getBeforeDate:clickTime days:7];
    [ZY_Method getDateInWeekWithDate:clickTime OutBegenTime:&bT OutendTime:&eT];
    [self gotorequest:bT end:eT];

}
- (void)RightBtn{
    NSString * bT = nil;
    NSString * eT = nil;
    clickTime = [ZY_Method getAfterDate:clickTime days:7];
    [ZY_Method getDateInWeekWithDate:clickTime OutBegenTime:&bT OutendTime:&eT];
    [self gotorequest:bT end:eT];
}
- (void)gotorequest:(NSString *)bTime end:(NSString *)endTime{
    ZYLog(@"开始时间 == %@",bTime);
    ZYLog(@"结束时间 == %@",endTime);
    
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
