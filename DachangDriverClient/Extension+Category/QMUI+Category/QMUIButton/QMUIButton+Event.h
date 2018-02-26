//
//  QMUIButton+Event.h
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/11/22.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import <QMUIKit/QMUIKit.h>

typedef void(^buttonEvent)(QMUIButton * button);

@interface QMUIButton (Event)

- (void)blockEvent:(buttonEvent)block;

@end
