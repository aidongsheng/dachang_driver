//
//  UIView+POPAnimations.m
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/11/2.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "UIView+POPAnimations.h"

#define AnimationDuration   0.5

@implementation UIView (POPAnimations)

- (void)addScaleToSmallAnimation:(CGFloat)scale autoreverses:(BOOL)reverse
{
    [self.layer pop_removeAnimationForKey:@"layerScaleSmallAnimation"];
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(scale, scale)];
    scaleAnimation.autoreverses = reverse;
    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSmallAnimation"];
}

- (void)addScaleAnimation
{
    [self.layer pop_removeAnimationForKey:@"layerScaleSpringAnimation"];
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.fromValue = [NSValue valueWithCGSize:CGSizeMake(1.2, 1.2)];
    scaleAnimation.velocity = [NSValue valueWithCGSize:CGSizeMake(6.f, 6.f)];
    scaleAnimation.springSpeed = 100;
    scaleAnimation.springBounciness = 100;
    scaleAnimation.dynamicsMass = 500;
    scaleAnimation.dynamicsFriction = 10;
    scaleAnimation.dynamicsTension = 1000;
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    scaleAnimation.springBounciness = 100;
    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSpringAnimation"];
}

- (void)addAlphaAnimation:(CGFloat)alpha
{
    [self pop_removeAnimationForKey:@"layerAlphaAnimation"];
    POPBasicAnimation * alphaAnim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    alphaAnim.fromValue = @0;
    alphaAnim.toValue = @(alpha);
    alphaAnim.autoreverses = NO;
    alphaAnim.duration = AnimationDuration;
    [self pop_addAnimation:alphaAnim forKey:@"layerAlphaAnimation"];
}

- (void)addCornerRadiusAnimation
{
    [self.layer pop_removeAnimationForKey:@"layerCornerRadiusAnimation"];
    POPSpringAnimation * cornerRadius = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerCornerRadius];
    cornerRadius.fromValue = @0;
    cornerRadius.velocity = @1;
    CGFloat maxSize = self.frame.size.height > self.frame.size.width ? self.frame.size.width : self.frame.size.height;
    cornerRadius.toValue = @(maxSize/2);
    cornerRadius.springBounciness = 22.0f;
    [self.layer pop_addAnimation:cornerRadius forKey:@"layerCornerRadiusAnimation"];
}

- (void)addCornerRadiusAnimation:(CGFloat)radius
{
    [self.layer pop_removeAnimationForKey:@"layerCornerRadiusAnimation"];
    POPSpringAnimation * cornerRadius = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerCornerRadius];
    cornerRadius.fromValue = @0;
    cornerRadius.velocity = @1;
    CGFloat maxSize = self.frame.size.height > self.frame.size.width ? self.frame.size.width : self.frame.size.height;
    cornerRadius.toValue = @(radius);
    cornerRadius.springBounciness = 22.0f;
    [self.layer pop_addAnimation:cornerRadius forKey:@"layerCornerRadiusAnimation"];
}

- (void)addBackgroundColorAnimation:(UIColor *)color autoreverses:(BOOL)autoreverses
{
    [self pop_removeAnimationForKey:@"ViewBackgroudColorAnimation"];
    POPBasicAnimation * colorAnim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
    colorAnim.toValue = color;
    colorAnim.duration = AnimationDuration;
    colorAnim.autoreverses = autoreverses;
    [self pop_addAnimation:colorAnim forKey:@"ViewBackgroudColorAnimation"];
}

- (void)addRotationYAnimation:(CGFloat)rotationY
{
    [self.layer pop_removeAnimationForKey:@"rotationYAnimation"];
    POPBasicAnimation * rotationYAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotationY];
    rotationYAnimation.toValue = @(rotationY);
    rotationYAnimation.duration = AnimationDuration;
    [self.layer pop_addAnimation:rotationYAnimation forKey:@"rotationYAnimation"];
}

- (void)addRotationXAnimation:(CGFloat)rotationX
{
    [self.layer pop_removeAnimationForKey:@"rotationXAnimation"];
    POPBasicAnimation * rotationXAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotationX];
    rotationXAnimation.toValue = @(rotationX);
    rotationXAnimation.duration = AnimationDuration*3;
    [self.layer pop_addAnimation:rotationXAnimation forKey:@"rotationXAnimation"];
}

- (void)addCenterAnimation
{
    [self pop_removeAnimationForKey:@"centerAnimation"];
    POPBasicAnimation * centerAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
    centerAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(20, 20)];
    centerAnimation.duration = AnimationDuration;
    [self pop_addAnimation:centerAnimation forKey:@"centerAnimation"];
}

- (void)addLabelTextColorAnimation:(UIColor *)labelTextColor
{
    [self pop_removeAnimationForKey:@"labelTextColorAnimation"];
    if ([self isKindOfClass:[UILabel class]]) {
        POPBasicAnimation * labelTextColorAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLabelTextColor];
        labelTextColorAnimation.duration = AnimationDuration;
        labelTextColorAnimation.toValue = labelTextColor;
        [self pop_addAnimation:labelTextColorAnimation forKey:@"labelTextColorAnimation"];
    }else{
        debug_NSLog(@"此视图非 UILabel，不可添加 UILabel 文字颜色动画");
    }
}



- (void)addRotationAnimation:(CGFloat)rotation
{
    [self.layer pop_removeAnimationForKey:@"rotationAnimation"];
    POPBasicAnimation * rotationAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
    rotationAnimation.duration = AnimationDuration;
    rotationAnimation.toValue = @(rotation);
    [self.layer pop_addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)addDecayAnimation
{
    [self.layer pop_removeAnimationForKey:@"buttonDecayAnimation"];
    POPDecayAnimation * decayAnim = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerRotation];
    decayAnim.velocity = @10;
    decayAnim.deceleration = 10;
    [self.layer pop_addAnimation:decayAnim forKey:@"buttonDecayAnimation"];
}

- (void)addShakeAnimationOffset:(CGFloat)offset
{
    [self.layer pop_removeAnimationForKey:@"shakeAnimationTranslationX"];
    POPSpringAnimation * shakeAnimationTranslationX = [POPSpringAnimation animationWithCustomPropertyNamed:kPOPLayerTranslationX readBlock:^(id obj, CGFloat *values) {
        
    } writeBlock:^(id obj, const CGFloat *values) {
        
    }];
    shakeAnimationTranslationX.velocity = @200;
    shakeAnimationTranslationX.springSpeed = 200;
    shakeAnimationTranslationX.springBounciness = 400;
    shakeAnimationTranslationX.fromValue = @(offset);
    shakeAnimationTranslationX.toValue = @0;
    shakeAnimationTranslationX.dynamicsTension = 10000;
    shakeAnimationTranslationX.dynamicsMass = 20;
    shakeAnimationTranslationX.dynamicsFriction = 100;
    
    [self.layer pop_addAnimation:shakeAnimationTranslationX forKey:@"shakeAnimationTranslationX"];
}

- (void)addTableViewAnimationWithContentOffset:(CGPoint)contentOffset
{
    [self pop_removeAnimationForKey:@"tableViewOffsetAnimation"];
    POPSpringAnimation * tableViewOffsetAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPTableViewContentOffset];
    tableViewOffsetAnimation.toValue = [NSValue valueWithCGPoint:contentOffset];
    [self pop_addAnimation:tableViewOffsetAnimation forKey:@"tableViewOffsetAnimation"];
}

- (void)addTimerCountAnimation:(CGFloat)count
{
    [self pop_removeAnimationForKey:@"countdownAnimation"];
    POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"countdownAnimation" initializer:^(POPMutableAnimatableProperty *prop) {
        prop.writeBlock = ^(id obj, const CGFloat values[]) {
            UILabel *label = (UILabel*)obj;
            label.text = [NSString stringWithFormat:@"%i",(int)values[0]];
        };
    }];
    POPBasicAnimation *countAnimation = [POPBasicAnimation linearAnimation];   //秒表当然必须是线性的时间函数
    countAnimation.property = prop;    //自定义属性
    countAnimation.fromValue = @(0);   //从0开始
    countAnimation.toValue = @(count);  //180秒
    countAnimation.duration = count;    //持续3分钟
    countAnimation.beginTime = CACurrentMediaTime();    //延迟1秒开始
    [self pop_addAnimation:countAnimation forKey:@"countdownAnimation"];
}

- (void)addCountAnimation:(CGFloat)count
{
    [self pop_removeAnimationForKey:@"countdownAnimation"];
    POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"countdownAnimation" initializer:^(POPMutableAnimatableProperty *prop) {
        prop.writeBlock = ^(id obj, const CGFloat values[]) {
            UILabel *label = (UILabel*)obj;
            label.text = [NSString stringWithFormat:@"%i",(int)values[0]];
        };
    }];
    POPBasicAnimation *countAnimation = [POPBasicAnimation linearAnimation];   //秒表当然必须是线性的时间函数
    countAnimation.property = prop;    //自定义属性
    countAnimation.fromValue = @(0);   //从0开始
    countAnimation.toValue = @(count);  //180秒
    countAnimation.duration = AnimationDuration;    //持续3分钟
    countAnimation.beginTime = CACurrentMediaTime();    //延迟1秒开始
    [self pop_addAnimation:countAnimation forKey:@"countdownAnimation"];
}


- (void)addAnimationFrame:(CGRect)frame
{
    [self pop_removeAnimationForKey:@"frameAnimationKey"];
    POPSpringAnimation * frameAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    frameAnimation.toValue = [NSValue valueWithCGRect:frame];
    [self pop_addAnimation:frameAnimation forKey:@"frameAnimationKey"];
}
- (void)addWarningAnimationTintColor:(UIColor *)tintColor
{
    [self pop_removeAnimationForKey:@"ViewTintColorAnimation"];
    POPBasicAnimation * warningAnim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewTintColor];
    warningAnim.duration = AnimationDuration;
    warningAnim.toValue = tintColor;
    warningAnim.autoreverses = YES;
    [self pop_addAnimation:warningAnim forKey:@"ViewTintColorAnimation"];
    
}

- (void)addAnimationLayerBorderColor:(UIColor *)borderColor
{
    [self.layer pop_removeAnimationForKey:@"layerBorderColorAnimation"];
    POPBasicAnimation * warningAnim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerBorderColor];
    warningAnim.duration = AnimationDuration;
    warningAnim.toValue = borderColor;
    warningAnim.autoreverses = YES;
    self.layer.borderWidth = 1;
    [self.layer pop_addAnimation:warningAnim forKey:@"layerBorderColorAnimation"];
}
@end
