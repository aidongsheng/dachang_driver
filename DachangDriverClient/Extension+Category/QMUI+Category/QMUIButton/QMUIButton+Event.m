//
//  QMUIButton+Event.m
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/11/22.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "QMUIButton+Event.h"
#import <objc/runtime.h>

@interface QMUIButton()

@property (nonatomic,copy) buttonEvent ClickBlock;

@end

@implementation QMUIButton (Event)

- (void)blockEvent:(buttonEvent)block
{
    if (self.ClickBlock != block) {
        objc_setAssociatedObject(self, @selector(ClickBlock), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
        
        [self addTarget:self
                 action:@selector(QMUIButtonTouchInsideAction:)
       forControlEvents:UIControlEventTouchUpInside];
    }else{
        [self removeTarget:self
                    action:@selector(QMUIButtonTouchInsideAction:)
          forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)QMUIButtonTouchInsideAction:(QMUIButton *)button
{
    if (self.ClickBlock) {
        self.ClickBlock(button);
    }
}
- (buttonEvent)ClickBlock
{
    return objc_getAssociatedObject(self, _cmd);
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    [super hitTest:point withEvent:event];
    
    CGRect rectBig = CGRectInset(self.bounds, -10, -10);
    
    if (CGRectContainsPoint(rectBig, point)) {
        return self;
    }else{
        return nil;
    }
    
    return self;
}
@end
