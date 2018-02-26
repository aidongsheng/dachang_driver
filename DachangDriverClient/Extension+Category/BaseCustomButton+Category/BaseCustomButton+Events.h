//
//  BaseCustomButton+Events.h
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/10/18.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "BaseCustomButton.h"

/**
 *  Button's event block.
 *
 *  @param button Button.
 */
typedef void (^buttonEvent_t)(BaseCustomButton *button);

@interface BaseCustomButton (Event)

/**
 *  Button's block event method.
 *
 *  @param block Button event block.
 */
- (void)blockEvent:(buttonEvent_t)block;

@end
