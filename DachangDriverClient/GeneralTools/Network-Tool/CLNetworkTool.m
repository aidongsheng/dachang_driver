//
//  CLNetworkTool.m
//  51carlife
//
//  Created by lijun mou on 2018/1/20.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import "CLNetworkTool.h"
#import <AFNetworkReachabilityManager.h>

@implementation CLNetworkTool
+ (void)startMonitoring
{
    static CLNetworkTool * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[CLNetworkTool alloc]init];
        }
    });
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusUnknown:
                    [instance showText:@"网络情况未知"];
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                    [instance showText:@"网络不可用"];
                    break;
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    [instance showText:@"当前网络为WI-FI网络"];
                    break;
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    [instance showText:@"当前网络为蜂窝网络"];
                    break;
                default:
                    break;
            }
        }];
    }];
}
+ (void)stopMonitoring
{
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}

- (void)showText:(NSString *)text
{
    [QMUITips showInfo:text inView:keyWindow hideAfterDelay:1];
}
@end
