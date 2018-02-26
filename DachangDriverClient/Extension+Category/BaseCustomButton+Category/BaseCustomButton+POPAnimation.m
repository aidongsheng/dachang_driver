//
//  BaseCustomButton+POPAnimation.m
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/10/18.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "BaseCustomButton+POPAnimation.h"

@implementation BaseCustomButton (POPAnimation)
//
//- (void)addScaleToSmallAnimation
//{
//    NSLog(@"scaletoSmall");
//    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
//    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.95f, 0.95f)];
//    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSmallAnimation"];
//}
//
//- (void)addScaleAnimation
//{
//    NSLog(@"scaleAnimation");
//    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
//    scaleAnimation.velocity = [NSValue valueWithCGSize:CGSizeMake(6.f, 6.f)];
//    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
//    scaleAnimation.springBounciness = 10.0f;
//    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSpringAnimation"];
//}
//
//- (void)addAlphaAnimation
//{
//    POPSpringAnimation * alphaAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewAlpha];
//    
//    alphaAnim.fromValue = @0;
//    alphaAnim.toValue = @(0.5);
//    alphaAnim.velocity = @1;
//    alphaAnim.springBounciness = 22.0f;
//    [self pop_addAnimation:alphaAnim forKey:@"layerAlphaAnimation"];
//}
//
//- (void)addCornerRadiusAnimation
//{
//    POPSpringAnimation * cornerRadius = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerCornerRadius];
//    cornerRadius.fromValue = @0;
//    cornerRadius.velocity = @1;
//    cornerRadius.toValue = @(self.frame.size.height/2);
//    cornerRadius.springBounciness = 22.0f;
//    [self.layer pop_addAnimation:cornerRadius forKey:@"layerCornerRadiusAnimation"];
//}
//
//- (void)addBackgroundColorAnimation
//{
//    POPBasicAnimation * cornerRadius = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerBackgroundColor];
//    cornerRadius.toValue = [UIColor colorWithRed:0.2 green:0.4 blue:0.8 alpha:0.5];
//    [self.layer pop_addAnimation:cornerRadius forKey:@"layerBackgroudColorAnimation"];
//}
//
//- (void)addRotationAnimation
//{
//    
//}
//
//- (void)addDecayAnimation
//{
//    POPDecayAnimation * decayAnim = [POPDecayAnimation animationWithPropertyNamed:kPOPViewFrame];
//        //    decayAnim.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 100, 100)];
//    decayAnim.velocity = @10;
//    decayAnim.deceleration = 10;
//    
//    [self pop_addAnimation:decayAnim forKey:@"buttonDecayAnimation"];
//}
@end
