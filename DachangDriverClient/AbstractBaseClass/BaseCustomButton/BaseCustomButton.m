//
//  BaseCustomButton.m
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/10/18.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "BaseCustomButton.h"

@implementation BaseCustomButton

- (instancetype)init
{
    if (self = [super init]) {
        [self setTitleColor:ButtonBackgroundWhiteColor forState:UIControlStateNormal];
        [self setBackgroundColor:ButtonBackgroundThemeColor];
        self.titleLabel.font = [UIFont PingFangSCLightFontSize:LabelFontSizeMedium];
        [self blockEvent:^(BaseCustomButton *button) {
            [button addScaleAnimation];
        }];
    }
    return self;
}

- (void)setTitleText:(NSString *)titleText
{
    [self setTitle:titleText forState:UIControlStateNormal];
}
@end
