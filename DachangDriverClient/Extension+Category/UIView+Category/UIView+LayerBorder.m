//
//  UIView+LayerBorder.m
//  DachangMerchantClient
//
//  Created by lijun mou on 2018/2/10.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import "UIView+LayerBorder.h"
#import <objc/runtime.h>
@implementation UIView (LayerBorder)
char const * borderColorKey = "borderColorKey";
char const * borderWidthKey = "borderWidthKey";
- (UIColor *)borderColor
{
    return objc_getAssociatedObject(self, &borderColorKey);
}
- (void)setBorderColor:(UIColor *)borderColor
{
    objc_setAssociatedObject(self, &borderWidthKey, self.borderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)borderWidth
{
    return [objc_getAssociatedObject(self, &borderWidthKey) floatValue];
}
- (void)setBorderWidth:(CGFloat)borderWidth
{
    objc_setAssociatedObject(self, &borderWidthKey, @(borderWidth), OBJC_ASSOCIATION_ASSIGN);
    self.layer.borderWidth = borderWidth;
}
@end
