//
//  UIView+CLAddBaseLine.h
//  51carlife
//
//  Created by lijun mou on 2017/12/19.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BaseLineDirection) {
    BaseLineDirectionTop,
    BaseLineDirectionLeft,
    BaseLineDirectionBottom,
    BaseLineDirectionRight
};

@interface UIView (CLAddBaseLine)
- (void)addBaseline:(CGFloat)lineWidth color:(UIColor *)lineColor direction:(BaseLineDirection)direction;
@end
