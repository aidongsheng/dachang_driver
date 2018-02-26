//
//  UIView+CLEvent.m
//  51carlife
//
//  Created by lijun mou on 2017/12/19.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "UIView+CLEvent.h"
#import <objc/runtime.h>

@interface UIView()
@property (nonatomic,copy) TapGestureEvent tapEvent;

@end

@implementation UIView (CLEvent)

- (void)gestureEvent:(TapGestureEvent)gestureEventBlock
{
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    if (self.tapEvent != gestureEventBlock) {
        objc_setAssociatedObject(self, @selector(tapEvent), gestureEventBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self addGestureRecognizer:tapGesture];
    }else{
        [self removeGestureRecognizer:tapGesture];
    }
}

- (TapGestureEvent)tapEvent
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)tapAction:(UIView *)view
{
    if (self.tapEvent) {
        self.tapEvent(view);
    }
    debug_NSLog(@"手势点击事件");
}
@end
