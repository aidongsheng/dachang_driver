//
//  AppDelegate.m
//  DachangDriverClient
//
//  Created by lijun mou on 2018/2/25.
//  Copyright © 2018年 dongsheng. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+CLBMKCategory.h"
#import "BaseCustomTabBarController.h"
#import <Bugly/Bugly.h>
#import <IQKeyboardManager.h>
#import "DCWorkbenchViewController.h"
#import "DCMineViewController.h"
#import "DCTotalOrderViewController.h"

static NSString * const BuglyAppId = @"38a416012e";

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //  配置腾讯Bugly appkey
    [Bugly startWithAppId:BuglyAppId];
    //  配置高德 appkey
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    BaseCustomTabBarController * tabBarController = [[BaseCustomTabBarController alloc]init];
    DCWorkbenchViewController * workbenchVC = [[DCWorkbenchViewController alloc]init];
    DCTotalOrderViewController * totalOrderVC = [[DCTotalOrderViewController alloc]init];
    DCMineViewController * mineVC = [[DCMineViewController alloc]init];
    tabBarController.rootControllers =[[NSMutableArray alloc]initWithObjects:totalOrderVC,workbenchVC,mineVC, nil];
    tabBarController.selectedIndex = 1;
    [tabBarController setHidesBottomBarWhenPushed:YES];
    _window.rootViewController = tabBarController;
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    [[IQKeyboardManager sharedManager]setEnable:YES];
    [IQKeyboardManager sharedManager].shouldShowToolbarPlaceholder = YES;
    [IQKeyboardManager sharedManager].shouldToolbarUsesTextFieldTintColor = YES;
    [self registerBMKKey];
    [self checkLocateAuth];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
