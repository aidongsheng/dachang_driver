//
//  BaseCustomTabBar.h
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/10/13.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseCustomTabBar;

@protocol BaseCustomTabBarDelegate<UITabBarDelegate>

- (void)tabbarDidClickWorkbenchButton:(BaseCustomTabBar *)tabBar;

@end

@interface BaseCustomTabBar : UITabBar

@property (nonatomic,strong) UIButton * workbenchButton;
@property (nonatomic,weak) id<BaseCustomTabBarDelegate>tabBarDelegate;

@end
