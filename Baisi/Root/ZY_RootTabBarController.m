//
//  ZY_RootTabBarController.m
//  Baisibudejie
//
//  Created by dqong on 16/10/8.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "ZY_RootTabBarController.h"
#import "ZY_RootNavigationController.h"
#import "OtherViewController.h"
#import "AddMainVC.h"
#import "EssenceViewController.h"
#import "NewViewController.h"
#import "FellowViewController.h"
#import "MeViewController.h"
#import "MyInformationController.h"
#import "PersonalViewController.h"
#import "MainTabBar.h"
#import "BHBPopView.h"
@interface ZY_RootTabBarController ()<MainTabBarDelegate>
@property (nonatomic, weak  )  MainTabBar            * mainTabBar;
@property (nonatomic, strong) OtherViewController    * otherVC;
@property (nonatomic, strong) AddMainVC              * addMainVC;
@property (nonatomic, strong) EssenceViewController  * essenceVC;
@property (nonatomic, strong) NewViewController      * NewVC;
@property (nonatomic, strong) FellowViewController   * fellowVC;
@property (nonatomic, strong) MeViewController       * meVC;
@property (nonatomic, strong) PersonalViewController * personalVC;

@end

@implementation ZY_RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self SetupMainTabBar];
    [self SetupAllControllers];
    
   
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [child removeFromSuperview];
        }
    }
}
- (void)SetupMainTabBar{
    MainTabBar *mainTabBar = [[MainTabBar alloc] init];
    mainTabBar.frame = self.tabBar.bounds;
    mainTabBar.delegate = self;
    [self.tabBar addSubview:mainTabBar];
   // [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
    _mainTabBar = mainTabBar;
    
}
- (void)SetupAllControllers{
    NSArray *titles = @[@"精选", @"最新", @"关注", @"我的"];
    NSArray *images = @[@"icon_tabbar_home~iphone", @"icon_tabbar_subscription~iphone", @"icon_tabbar_notification~iphone", @"icon_tabbar_me~iphone"];
    NSArray *selectedImages = @[@"icon_tabbar_home_active~iphone", @"icon_tabbar_subscription_active~iphone", @"icon_tabbar_notification_active~iphone", @"icon_tabbar_me_active~iphone"];
    
    //精选
    EssenceViewController * essenController = [[EssenceViewController alloc] init];
    self.essenceVC = essenController;
    
    //最新
    NewViewController * newController = [[NewViewController alloc] init];
    self.NewVC = newController;
    
    //关注
    FellowViewController * FellowController = [[FellowViewController alloc] init];
    self.fellowVC = FellowController;
    
    //我的
    MeViewController * meController = [[MeViewController alloc] init];
    self.meVC = meController;
    
    NSArray *viewControllers = @[essenController, newController, FellowController, meController];
    
    for (int i = 0; i < viewControllers.count; i++) {
        UIViewController *childVc = viewControllers[i];
        [self SetupChildVc:childVc title:titles[i] image:images[i] selectedImage:selectedImages[i]];
    }
}
- (void)SetupChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)imageName selectedImage:(NSString *)selectedImageName{
    ZY_RootNavigationController *nav = [[ZY_RootNavigationController alloc] initWithRootViewController:childVc];
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    childVc.tabBarItem.title = title;
    [self.mainTabBar addTabBarButtonWithTabBarItem:childVc.tabBarItem];
    [self addChildViewController:nav];
    
//    UIView * redV = [UIView new];
//    redV.backgroundColor = [UIColor redColor];
//    redV.frame = CGRectMake(10, 5, 2, 2);
//    redV.layer.masksToBounds = YES;
//    redV.layer.cornerRadius  = 1;
//    [childVc.tabBarItem];
    
}

#pragma mark --------------------mainTabBar delegate
- (void)tabBar:(MainTabBar *)tabBar didSelectedButtonFrom:(long)fromBtnTag to:(long)toBtnTag{
    self.selectedIndex = toBtnTag;
}

#pragma mark - 中间按钮点击
- (void)tabBarClickWriteButton:(MainTabBar *)tabBar{
//    OtherViewController *writeVc = [[OtherViewController alloc] init];
//    ZY_RootNavigationController *nav = [[ZY_RootNavigationController alloc] initWithRootViewController:writeVc];
//    
//    [self presentViewController:nav animated:YES completion:nil];
    //_menu.backgroundType = HyPopMenuViewBackgroundTypeLightBlur;
    //[_menu openMenu];
    
    BHBItem * item0 = [[BHBItem alloc]initWithTitle:@"Text" Icon:@"images.bundle/tabbar_compose_idea"];
    BHBItem * item1 = [[BHBItem alloc]initWithTitle:@"Albums" Icon:@"images.bundle/tabbar_compose_photo"];
    BHBItem * item2 = [[BHBItem alloc]initWithTitle:@"Camera" Icon:@"images.bundle/tabbar_compose_camera"];
    //第4个按钮内部有一组
    BHBGroup * item3 = [[BHBGroup alloc]initWithTitle:@"Check in" Icon:@"images.bundle/tabbar_compose_lbs"];
    BHBItem * item31 = [[BHBItem alloc]initWithTitle:@"Friend Circle" Icon:@"images.bundle/tabbar_compose_friend"];
    BHBItem * item32 = [[BHBItem alloc]initWithTitle:@"Weibo Camera" Icon:@"images.bundle/tabbar_compose_wbcamera"];
    BHBItem * item33 = [[BHBItem alloc]initWithTitle:@"Music" Icon:@"images.bundle/tabbar_compose_music"];
    item3.items = @[item31,item32,item33];
    
    BHBItem * item4 = [[BHBItem alloc]initWithTitle:@"Review" Icon:@"images.bundle/tabbar_compose_review"];
    
    //第六个按钮内部有一组
    BHBGroup * item5 = [[BHBGroup alloc]initWithTitle:@"More" Icon:@"images.bundle/tabbar_compose_more"];
    BHBItem * item51 = [[BHBItem alloc]initWithTitle:@"Friend Circle" Icon:@"images.bundle/tabbar_compose_friend"];
    BHBItem * item52 = [[BHBItem alloc]initWithTitle:@"Weibo Camera" Icon:@"images.bundle/tabbar_compose_wbcamera"];
    BHBItem * item53 = [[BHBItem alloc]initWithTitle:@"Music" Icon:@"images.bundle/tabbar_compose_music"];
    BHBItem * item54 = [[BHBItem alloc]initWithTitle:@"Blog" Icon:@"images.bundle/tabbar_compose_weibo"];
    BHBItem * item55 = [[BHBItem alloc]initWithTitle:@"Collection" Icon:@"images.bundle/tabbar_compose_transfer"];
    BHBItem * item56 = [[BHBItem alloc]initWithTitle:@"Voice" Icon:@"images.bundle/tabbar_compose_voice"];
    item5.items = @[item51,item52,item53,item54,item55,item56];
    
    
    //添加popview
    
    [BHBPopView showToView:self.view.window withItems:@[item0,item1,item2,item3,item4,item5]andSelectBlock:^(BHBItem *item) {
        if ([item isKindOfClass:[BHBGroup class]]) {
            NSLog(@"选中%@分组",item.title);
        }else{
            NSLog(@"选中%@项",item.title);
            if ([item.title isEqualToString:@"Text"]) {
                AddMainVC *writeVc = [[AddMainVC alloc] init];
                ZY_RootNavigationController *nav = [[ZY_RootNavigationController alloc] initWithRootViewController:writeVc];
                
                [self presentViewController:nav animated:YES completion:nil];
            }
        }
    }];

}
@end
