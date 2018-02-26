//
//  QMUITextField+Warning.m
//  DachangMerchantClient
//
//  Created by lijun mou on 2017/11/22.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "QMUITextField+Warning.h"

@implementation QMUITextField (Warning)

- (void)warningWithStyle:(QMUITextFieldStyle)style text:(NSString *)text
{
    if (self) {
        if (style == QMUITextFieldStyleWarning) {
            [QMUITips showError:text inView:[self currentController].view];
            [self addShakeAnimationOffset:1];
        }else if (style == QMUITextFieldStyleError){
            [QMUITips showError:text inView:[self currentController].view];
            [self addShakeAnimationOffset:1];
        }else if (style == QMUITextFieldStyleSuccess){
            [QMUITips showSucceed:text inView:[self currentController].view];
            [self addShakeAnimationOffset:1];
        }
    }
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    debug_NSLog(@"%@",text);
}

@end
