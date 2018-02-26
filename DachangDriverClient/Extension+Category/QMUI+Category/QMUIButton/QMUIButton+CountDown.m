//
//  QMUIButton+CountDown.m
//  DachangMerchantClient
//
//  Created by lijun mou on 2017/11/22.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "QMUIButton+CountDown.h"
#import <objc/runtime.h>

@interface QMUIButton()



@end

@implementation QMUIButton (CountDown)

@dynamic countDownTimer,seconds;
static char associateLengthKey, associateTimerKey;


- (void)startCountDown:(NSInteger)seconds
{
    if (self) {
        self.enabled = false;
        if (self.countDownTimer == nil) {
            self.countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                                   target:self
                                                                 selector:@selector(countDown)
                                                                 userInfo:nil
                                                                  repeats:YES];
            
        }
        self.seconds = seconds;
        [self.countDownTimer fire];
    }else{
        [QMUITips showLoading:@"loadding" inView:self];
    }
}
- (void)countDown
{
    NSString * title = [NSString stringWithFormat:@"%li秒 后重新发送",self.seconds];
    [self setTitle:title forState:UIControlStateNormal];
    
    
    self.seconds--;
    if (self.seconds == 0) {
        [self.countDownTimer invalidate];
        self.countDownTimer = nil;
        self.enabled = YES;
        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
    [self setTitleColor:WhiteColor forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont PingFangSCSemiboldFontSize:LabelFontSizeSmall];
}

#pragma mark - getter && setter

- (NSInteger)seconds
{
    return [(NSNumber *)objc_getAssociatedObject(self, &associateLengthKey) integerValue];
}
- (void)setSeconds:(NSInteger)seconds
{
    objc_setAssociatedObject(self, &associateLengthKey, @(seconds), OBJC_ASSOCIATION_ASSIGN);
}

- (NSTimer *)countDownTimer
{
    return objc_getAssociatedObject(self, &associateTimerKey);
}
- (void)setCountDownTimer:(NSTimer *)countDownTimer
{
    objc_setAssociatedObject(self, &associateTimerKey, countDownTimer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
