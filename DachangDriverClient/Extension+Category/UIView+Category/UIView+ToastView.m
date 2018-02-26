//
//  UIView+ToastView.m
//  DachangMerchantClient
//
//  Created by lijun mou on 2018/2/3.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import "UIView+ToastView.h"

@implementation UIView (ToastView)
- (void)showSuccess:(NSString *)text
{
    [QMUITips showSucceed:text inView:self.viewController.view hideAfterDelay:1];
}
- (void)showInfo:(NSString *)info
{
    [QMUITips showInfo:info inView:self.viewController.view hideAfterDelay:1];
}
- (void)showFailure:(NSString *)text
{
    [QMUITips showError:text inView:self.viewController.view hideAfterDelay:1];
}
@end
