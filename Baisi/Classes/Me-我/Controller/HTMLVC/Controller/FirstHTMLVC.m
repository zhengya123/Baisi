//
//  FirstHTMLVC.m
//  Baisibudejie
//
//  Created by dqong on 2016/12/14.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "FirstHTMLVC.h"
#import "PrefixHeader.pch"
#import "PNChart.h"
#import "PNChartDelegate.h"
@interface FirstHTMLVC ()<UIWebViewDelegate,PNChartDelegate>

@property (nonatomic, strong) UIWebView * my_webView;
@property (nonatomic, strong) PNRadarChart * radarChart;
@end

@implementation FirstHTMLVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"My First HTML";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [SVProgressHUD setMinimumDismissTimeInterval:0.5];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0.858 green:0.916 blue:0.886 alpha:1.000]];
    [SVProgressHUD setForegroundColor:[UIColor redColor]];
    [SVProgressHUD showWithStatus:@"正在加载"];
    //[self createUI];
    NSArray *items = @[[PNRadarChartDataItem dataItemWithValue:3 description:@"Art"],
                       [PNRadarChartDataItem dataItemWithValue:2 description:@"Math"],
                       [PNRadarChartDataItem dataItemWithValue:8 description:@"Sports"],
                       [PNRadarChartDataItem dataItemWithValue:5 description:@"Literature"],
                       [PNRadarChartDataItem dataItemWithValue:4 description:@"Other"],
                       ];
    self.radarChart = [[PNRadarChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_W, 300.0) items:items valueDivider:1];
    
    self.radarChart.plotColor = [UIColor redColor];
    
    [self.radarChart strokeChart];
    
    [self.view addSubview:self.radarChart];
}
-(void)createUI{
    self.my_webView.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H);
    [self.view addSubview:self.my_webView];
    NSString * filePath = [[NSBundle mainBundle]pathForResource:@"Untitled-1" ofType:@"html"];
    NSString * htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [self.my_webView loadHTMLString:htmlString baseURL:[NSURL URLWithString:filePath]];

}
#pragma mark - webViewDelegate
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [SVProgressHUD showSuccessWithStatus:@"加载成功"];

}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [SVProgressHUD showErrorWithStatus:@"加载出错"];

}
#pragma mark - 懒加载
-(UIWebView *)my_webView{
    if (_my_webView == nil) {
        _my_webView = [UIWebView new];
        _my_webView.backgroundColor = [UIColor whiteColor];
        _my_webView.delegate = self;
    }
    return _my_webView;
}
@end
