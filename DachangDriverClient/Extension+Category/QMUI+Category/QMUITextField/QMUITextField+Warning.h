//
//  QMUITextField+Warning.h
//  DachangMerchantClient
//
//  Created by lijun mou on 2017/11/22.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import <QMUIKit/QMUIKit.h>

typedef NS_ENUM(NSUInteger, QMUITextFieldStyle) {
    QMUITextFieldStyleWarning,
    QMUITextFieldStyleError,
    QMUITextFieldStyleSuccess,
};

@interface QMUITextField (Warning)

- (void)warningWithStyle:(QMUITextFieldStyle)style text:(NSString *)text;

@end
