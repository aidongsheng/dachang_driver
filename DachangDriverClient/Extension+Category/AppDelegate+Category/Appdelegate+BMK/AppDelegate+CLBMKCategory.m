//
//  AppDelegate+CLBMKCategory.m
//  51carlife
//
//  Created by lijun mou on 2017/12/12.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "AppDelegate+CLBMKCategory.h"
#import <BMKLocationKit/BMKLocationAuth.h>

@interface AppDelegate()<BMKLocationAuthDelegate>

@end
static NSString * const bmkKey = @"Bjk6tca0ZIMHDv3wPZOi48QHnls1Zkmr";
@implementation AppDelegate (CLBMKCategory)

- (void)registerBMKKey
{
    BMKMapManager * manager = [[BMKMapManager alloc]init];
    if (![manager start:bmkKey generalDelegate:nil]) {
        debug_NSLog(@"配置百度ak失败");
    }else{
        debug_NSLog(@"配置百度ak成功");
    }
}


- (void)checkLocateAuth
{
    [[BMKLocationAuth sharedInstance] checkPermisionWithKey:bmkKey authDelegate:self];
}
// 定位鉴权代理方法
- (void)onCheckPermissionState:(BMKLocationAuthErrorCode)iError
{
    NSString * tipString = nil;
    switch (iError) {
        case BMKLocationAuthErrorFailed:
            tipString = @"定位鉴权失败";
            break;
        case BMKLocationAuthErrorSuccess:
            tipString = @"定位鉴权成功";
            break;
        case BMKLocationAuthErrorUnknown:
            tipString = @"定位鉴权未知信息";
            break;
        case BMKLocationAuthErrorNetworkFailed:
            tipString = @"定位鉴权网络错误";
            break;
        default:
            break;
    }
//    [QMUITips showInfo:tipString inView:keyWindow hideAfterDelay:2];
}


@end
