//
//  YTKRequest+Category.m
//  51carlife
//
//  Created by aidongsheng on 2017/12/28.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "YTKRequest+Category.h"
#import <objc/runtime.h>
#import "BaseCustomTabBarController.h"
#import "BaseCustomNavigationController.h"
#import "CLLoginViewController.h"
@implementation YTKRequest (Category)

- (void)requestFailedFilter
{
    
}
- (void)requestCompleteFilter
{
    
    if (self.responseStatusCode == 200) {
        if ([NSUserDefaults token] == nil) {
            debug_NSLog(@"token不存在");
            [self presentLoginViewController];
        }else{
            debug_NSLog(@"token = %@",[NSUserDefaults token]);
        }
    }
}
- (void)requestFailedPreprocessor {
    if (self.responseStatusCode == 401) {
        [self presentLoginViewController];
    }else if (self.responseStatusCode == 400){
        [self showText:@"请求的地址不存在或者包含不支持的参数[400]"];
    }else if (self.responseStatusCode == 403){
        [self showText:@"被禁止访问[403]"];
    }else if(self.responseStatusCode == 404){
        [self showText:@"请求的资源不存在[404]"];
    }else if (self.responseStatusCode == 500){
        [self showText:@"内部错误[500]"];
    }else if (self.responseStatusCode == 200){
        debug_NSLog(@"正常响应[200]");
    }else if (self.responseStatusCode == 422){
        [self showText:@"内部错误[422]"];
    }
}

- (void)requestCompletePreprocessor
{
    
    
}
- (void)presentLoginViewController
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showText:@"未授权"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            BaseCustomNavigationController * navController = ((BaseCustomTabBarController *)(keyWindow.rootViewController)).selectedViewController;
            CLLoginViewController * loginVC = [[CLLoginViewController alloc]init];
            [navController.topViewController presentViewController:loginVC animated:YES completion:nil];
        });
    });
    [NSUserDefaults removeObjectForKey:@"token"];
}

- (void)showText:(NSString *)text
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [QMUITips showInfo:text
                    inView:keyWindow
            hideAfterDelay:1];
    });
}

- (NSTimeInterval)requestTimeoutInterval
{
    return 10;
}

- (YTKRequestSerializerType)requestSerializerType
{
    return YTKRequestSerializerTypeHTTP;
}

- (YTKResponseSerializerType)responseSerializerType
{
    return YTKResponseSerializerTypeHTTP;
}

- (NSString *)baseUrl
{
    return CLBaseUrl;
}

- (nullable NSDictionary<NSString *, NSString *> *)requestHeaderFieldValueDictionary
{
    NSString * token = [NSString stringWithFormat:@"%@",[NSUserDefaults token]];
    return @{
             @"token":token,
             };
}

@end
