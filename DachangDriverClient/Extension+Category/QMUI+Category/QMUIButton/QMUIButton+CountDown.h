//
//  QMUIButton+CountDown.h
//  DachangMerchantClient
//
//  Created by lijun mou on 2017/11/22.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import <QMUIKit/QMUIKit.h>

@interface QMUIButton (CountDown)
@property (nonatomic,strong) NSTimer * countDownTimer;
@property (nonatomic,assign) NSInteger seconds;
- (void)startCountDown:(NSInteger)seconds;

@end
