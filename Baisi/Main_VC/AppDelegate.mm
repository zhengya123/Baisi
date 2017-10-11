//
//  AppDelegate.m
//  Baisi
//
//  Created by dqong on 2017/3/30.
//  Copyright © 2017年 ZY. All rights reserved.
//

#import "AppDelegate.h"
#import "ZY_RootTabBarController.h"
#import "XHLaunchAd.h"
#import "ADViewController.h"
#import "PrefixHeader.pch"
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
BMKMapManager * _mapManager;
//百度地图appKey
#define BaiduMapAppkey @"4ZoIwfqPKH1po7icAPXRQI1DrwvUXDp1"
//静态广告
#define ImgUrlString1 @"http://d.hiphotos.baidu.com/image/pic/item/14ce36d3d539b60071473204e150352ac75cb7f3.jpg"
//动态广告
#define ImgUrlString2 @"http://c.hiphotos.baidu.com/image/pic/item/d62a6059252dd42a6a943c180b3b5bb5c8eab8e7.jpg"
@interface AppDelegate ()

@end

@implementation AppDelegate
{
    BOOL gotoBuy;
    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self IsLogin];
    //[self createAD];
    [self creatMap];//初始化百度地图
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)createAD{
    /**
     *  1.显示启动页广告
     */
    [XHLaunchAd showWithAdFrame:CGRectMake(0, 0,self.window.bounds.size.width, self.window.bounds.size.height- 130) setAdImage:^(XHLaunchAd *launchAd) {
        
        //未检测到广告数据,启动页停留时间,默认3,(设置4即表示:启动页显示了4s,还未检测到广告数据,就自动进入window根控制器)
        //launchAd.noDataDuration = 4;
        
        //获取广告数据
        [self requestImageData:^(NSString *imgUrl, NSInteger duration, NSString *openUrl) {
            
            /**
             *  2.设置广告数据
             */
            [launchAd setImageUrl:imgUrl duration:duration skipType:SkipTypeTimeText options:XHWebImageDefault completed:^(UIImage *image, NSURL *url) {
                
                //异步加载图片完成回调(若需根据图片尺寸,刷新广告frame,可在这里操作)
                //launchAd.adFrame = ...;
                
            } click:^{
                
                //广告点击事件
                //  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:openUrl]];
                
                gotoBuy = YES;
                
            }];
            
        }];
        
    } showFinish:^{
        if (gotoBuy) {
            [self isgotoBuy:@"http://www.returnoc.com"];
        }else{
            //广告展示完成回调,设置window根控制器
            [self IsLogin];
            
        }
        
        
    }];
    
}
-(void)requestImageData:(void(^)(NSString *imgUrl,NSInteger duration,NSString *openUrl))imageData{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if(imageData)
        {
            imageData(ImgUrlString1,6,@"http://www.returnoc.com");
        }
    });
}

-(void)IsLogin{
    NSString * loginPassWord = [[NSUserDefaults standardUserDefaults]objectForKey:@"UserPassWord"];
    if (loginPassWord == nil) {
        
        LoginViewController * loginVC = [LoginViewController new];
        self.window.rootViewController = loginVC;
    }else{
        
        ZY_RootTabBarController * vc = [ZY_RootTabBarController new];
        self.window.rootViewController = vc;
    }
    
    
}
-(void)isgotoBuy:(NSString *)adURL{
    ADViewController * adVC = [ADViewController new];
    adVC.AD_URL = adURL;
    self.window.rootViewController = adVC;
    
}
-(void)errorhides{
    exit(0);
    
}
#pragma mark - 初始化百度地图
- (void)creatMap{
    _mapManager = [[BMKMapManager alloc]init];
//    if ([BMKMapManager setCoordinateTypeUsedInBaiduMapSDK:BMK_COORDTYPE_BD09LL]) {
//        NSLog(@"经纬度类型设置成功");
//    } else {
//        NSLog(@"经纬度类型设置失败");
//    }
    BOOL ret = [_mapManager start:BaiduMapAppkey generalDelegate:self];
    if (!ret) {
        ZYLog(@"初始化失败");
    }

}
#pragma mark - 百度地图回调代理
- (void)onGetNetworkState:(int)iError{
    if (0 == iError) {
        ZYLog(@"Baidu联网成功");
    }else{
        ZYLog(@"Baidu联网失败 == %d",iError);
    
    }

}
- (void)onGetPermissionState:(int)iError{
    if (0 == iError) {
        ZYLog(@"Baidu授权成功");
    }else{
        ZYLog(@"Baidu授权失败 == %d",iError);
    }
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
