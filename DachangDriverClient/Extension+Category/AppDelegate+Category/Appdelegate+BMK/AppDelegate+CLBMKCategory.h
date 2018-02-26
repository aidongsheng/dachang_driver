//
//  AppDelegate+CLBMKCategory.h
//  51carlife
//
//  Created by lijun mou on 2017/12/12.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (CLBMKCategory)

// 注册百度地图ak
- (void)registerBMKKey;
// 检查定位权限
- (void)checkLocateAuth;

@end
