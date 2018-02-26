//
//  UIView+CLEvent.h
//  51carlife
//
//  Created by lijun mou on 2017/12/19.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TapGestureEvent)(UIView * view);

@interface UIView (CLEvent)
- (void)gestureEvent:(TapGestureEvent)gestureEventBlock;
@end
