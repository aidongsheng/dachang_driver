//
//  BaseCustomTabBarController.m
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/10/13.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "BaseCustomTabBarController.h"
#import "BaseCustomNavigationController.h"

@interface BaseCustomTabBarController ()<UITabBarDelegate,UITabBarControllerDelegate>

@end

@implementation BaseCustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.translucent = NO;
    self.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)setRootControllers:(NSMutableArray *)rootControllers
{
    if (rootControllers.count) {
        
        BaseCustomNavigationController * orderNaviController = [self navControllerWithTabbarItemTitle:@"订单"
                                                                                 tabbarItemImageNamed:@"tabbar_order_normal"
                                                                           tabbarItemSelectImageNamed:@"tabbar_order_select"
                                                                                       rootController:rootControllers[0]?rootControllers[0]:nil];
        BaseCustomNavigationController * workBenchNaviController = [self navControllerWithTabbarItemTitle:@"工作台"
                                                                                 tabbarItemImageNamed:@"tabbar_workbench_normal"
                                                                           tabbarItemSelectImageNamed:@"tabbar_workbench_select"
                                                                                       rootController:rootControllers[1]?rootControllers[1]:nil];
        BaseCustomNavigationController * MineNaviController = [self navControllerWithTabbarItemTitle:@"我的"
                                                                                 tabbarItemImageNamed:@"tabbar_mine_normal"
                                                                           tabbarItemSelectImageNamed:@"tabbar_mine_select"
                                                                                       rootController:rootControllers[2]?rootControllers[2]:nil];
        self.viewControllers = @[orderNaviController,workBenchNaviController,MineNaviController];
        for (BaseCustomNavigationController * controller in self.viewControllers) {
            NSDictionary * dict=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
            controller.navigationBar.titleTextAttributes = dict;
        }
    }
}

/**
 生成导航控制器
 
 @param title tabbarcontroller 的标题
 @param imageName 默认状态的 tabbaritem 的图片名
 @param selectImageName 选中状态的 tabbaritem 的图片名
 @param controller ZJDCNavigationController 的根控制器
 @return 导航控制器
 */
- (BaseCustomNavigationController *)navControllerWithTabbarItemTitle:(NSString *)title
                                          tabbarItemImageNamed:(NSString *)imageName
                                    tabbarItemSelectImageNamed:(NSString *)selectImageName
                                                rootController:(UIViewController *)controller
{
    UIImage * image = [UIImage imageNamed:imageName];
    UIImage * selectImage = [UIImage imageNamed:selectImageName];
    
    BaseCustomNavigationController * nav = [[BaseCustomNavigationController alloc]initWithRootViewController:controller];
    UITabBarItem * item = [[UITabBarItem alloc]initWithTitle:title
                                                       image:image
                                               selectedImage:selectImage];
    
    self.tabBar.tintColor = tabBar_tint_color;
        // 设置选中 tabbaritem 字体属性
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:tabBar_selectTitle_color,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:10]} forState:UIControlStateSelected];
        // 设置非选中 tabbaritem 字体属性
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:tabBar_normalTitle_color,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:10]} forState:UIControlStateNormal];
    nav.tabBarItem = item;
    nav.navigationBar.translucent = NO;
    nav.navigationBar.barTintColor = naviBar_tint_color;
    nav.navigationBar.tintColor = naviBar_title_color;
    
    return nav;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    [AudioTool playKeypadToneType:kSystemKeyPressedSoundTock1];
}
@end
