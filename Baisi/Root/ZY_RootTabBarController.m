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

#import "HyPopMenuView.h"
#import "popMenvTopView.h"
@interface ZY_RootTabBarController ()<MainTabBarDelegate,HyPopMenuViewDelegate>
@property (nonatomic, weak  )  MainTabBar            * mainTabBar;
@property (nonatomic, strong) OtherViewController    * otherVC;
@property (nonatomic, strong) AddMainVC              * addMainVC;
@property (nonatomic, strong) EssenceViewController  * essenceVC;
@property (nonatomic, strong) NewViewController      * NewVC;
@property (nonatomic, strong) FellowViewController   * fellowVC;
@property (nonatomic, strong) MeViewController       * meVC;
@property (nonatomic, strong) PersonalViewController * personalVC;
@property (nonatomic, strong) HyPopMenuView* menu;
@end

@implementation ZY_RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self SetupMainTabBar];
    [self SetupAllControllers];
    [self SetupTabbarClick];
   
}
-(void)SetupTabbarClick{
    _menu = [HyPopMenuView sharedPopMenuManager];
    PopMenuModel* model = [PopMenuModel
                           allocPopMenuModelWithImageNameString:@"tabbar_compose_idea"
                           AtTitleString:@"文字/头条"
                           AtTextColor:[UIColor grayColor]
                           AtTransitionType:PopMenuTransitionTypeCustomizeApi
                           AtTransitionRenderingColor:nil];
    
    PopMenuModel* model1 = [PopMenuModel
                            allocPopMenuModelWithImageNameString:@"tabbar_compose_photo"
                            AtTitleString:@"相册/视频"
                            AtTextColor:[UIColor grayColor]
                            AtTransitionType:PopMenuTransitionTypeSystemApi
                            AtTransitionRenderingColor:nil];
    
    PopMenuModel* model2 = [PopMenuModel
                            allocPopMenuModelWithImageNameString:@"tabbar_compose_camera"
                            AtTitleString:@"拍摄/短视频"
                            AtTextColor:[UIColor grayColor]
                            AtTransitionType:PopMenuTransitionTypeCustomizeApi
                            AtTransitionRenderingColor:nil];
    
    PopMenuModel* model3 = [PopMenuModel
                            allocPopMenuModelWithImageNameString:@"tabbar_compose_lbs"
                            AtTitleString:@"签到"
                            AtTextColor:[UIColor grayColor]
                            AtTransitionType:PopMenuTransitionTypeSystemApi
                            AtTransitionRenderingColor:nil];
    
    PopMenuModel* model4 = [PopMenuModel
                            allocPopMenuModelWithImageNameString:@"tabbar_compose_review"
                            AtTitleString:@"点评"
                            AtTextColor:[UIColor grayColor]
                            AtTransitionType:PopMenuTransitionTypeCustomizeApi
                            AtTransitionRenderingColor:nil];
    
    PopMenuModel* model5 = [PopMenuModel
                            allocPopMenuModelWithImageNameString:@"tabbar_compose_more"
                            AtTitleString:@"更多"
                            AtTextColor:[UIColor grayColor]
                            AtTransitionType:PopMenuTransitionTypeSystemApi
                            AtTransitionRenderingColor:nil];
    
    _menu.dataSource = @[ model, model1, model2, model3, model4, model5 ];
    _menu.delegate = self;
    _menu.popMenuSpeed = 12.0f;
    _menu.automaticIdentificationColor = false;
    _menu.animationType = HyPopMenuViewAnimationTypeViscous;
    
    popMenvTopView* topView = [popMenvTopView popMenvTopView];
    topView.frame = CGRectMake(0, 44, CGRectGetWidth(self.view.frame), 92);
    _menu.topView = topView;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
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
    _menu.backgroundType = HyPopMenuViewBackgroundTypeLightBlur;
    [_menu openMenu];
}
- (void)popMenuView:(HyPopMenuView*)popMenuView
didSelectItemAtIndex:(NSUInteger)index
{
//    UIViewController* t =
//    [self.storyboard instantiateViewControllerWithIdentifier:@"two"];
//    [self.navigationController pushViewController:t animated:false];
    
        AddMainVC *writeVc = [[AddMainVC alloc] init];
        ZY_RootNavigationController *nav = [[ZY_RootNavigationController alloc] initWithRootViewController:writeVc];
    
        [self presentViewController:nav animated:YES completion:nil];
}
@end
