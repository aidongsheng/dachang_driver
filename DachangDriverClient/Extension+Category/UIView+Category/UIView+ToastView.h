//
//  UIView+ToastView.h
//  DachangMerchantClient
//
//  Created by lijun mou on 2018/2/3.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ToastView)
- (void)showSuccess:(NSString *)text;
- (void)showInfo:(NSString *)info;
- (void)showFailure:(NSString *)text;
@end
