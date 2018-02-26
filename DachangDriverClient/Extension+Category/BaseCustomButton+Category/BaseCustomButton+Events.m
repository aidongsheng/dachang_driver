//
//  BaseCustomButton+Events.m
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/10/18.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "BaseCustomButton+Events.h"
#import <objc/runtime.h>

@interface BaseCustomButton ()

@property (nonatomic, copy) buttonEvent_t buttonEventBlock;

@end

@implementation BaseCustomButton (Event)

- (void)blockEvent:(buttonEvent_t)block{
    
    if (self.buttonEventBlock != block) {
        objc_setAssociatedObject(self, @selector(buttonEventBlock), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
        
        [self addTarget:self
                 action:@selector(QMUIButtonTouchInsideAction:)
       forControlEvents:UIControlEventTouchUpInside];
    }else{
        [self removeTarget:self
                    action:@selector(QMUIButtonTouchInsideAction:)
          forControlEvents:UIControlEventTouchUpInside];
    }
}
- (void)QMUIButtonTouchInsideAction:(BaseCustomButton *)button
{
    if (self.buttonEventBlock) {
        self.buttonEventBlock(button);
    }
}
- (buttonEvent_t)buttonEventBlock
{
    return objc_getAssociatedObject(self, _cmd);
}


@end
