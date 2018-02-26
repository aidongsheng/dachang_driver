//
//  UIView+ReturnControllers.m
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/10/28.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "UIView+ReturnController.h"

@implementation UIView (ReturnController)


UIViewController *zbcore_topViewController(UIViewController *vc){
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return zbcore_topViewController([(UINavigationController *)vc topViewController]) ;
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return zbcore_topViewController([(UITabBarController *)vc selectedViewController]);
    } else {
        return vc;
    }
    return nil;
}
/**
 获取当前正在显示的控制器
 */
- (UIViewController *)currentController {
    UIViewController *resultVC;
    resultVC = zbcore_topViewController([keyWindow rootViewController]);
    while (resultVC.presentedViewController) {
        resultVC = zbcore_topViewController(resultVC.presentedViewController);
    }
    return resultVC;
}


@end
