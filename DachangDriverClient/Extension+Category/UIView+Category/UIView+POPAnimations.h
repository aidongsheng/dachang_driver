//
//  UIView+POPAnimations.h
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/11/2.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//



@interface UIView (POPAnimations)


- (void)addScaleToSmallAnimation:(CGFloat)scale autoreverses:(BOOL)reverse;

/**
 添加缩放动画
 */
- (void)addScaleAnimation;


/**
 添加视图中心位置变换动画
 */
- (void)addCenterAnimation;


/**
 视图围绕Y轴旋转的动画

 @param rotationY 旋转的角度
 */
- (void)addRotationYAnimation:(CGFloat)rotationY;
/**
 视图围绕X轴旋转的动画

 @param rotationX 旋转的角度
 */
- (void)addRotationXAnimation:(CGFloat)rotationX;
/**
 添加标签文字颜色过渡动画

 @param labelTextColor 过渡到的颜色
 */
- (void)addLabelTextColorAnimation:(UIColor *)labelTextColor;
/**
 添加透视动画
 */
- (void)addAlphaAnimation:(CGFloat)alpha;

/**
 添加倒角过度动画
 */
- (void)addCornerRadiusAnimation;
/**
 添加倒角过度动画 radius:倒角半径数值
 */
- (void)addCornerRadiusAnimation:(CGFloat)radius;
/**
 添加背景色过渡动画
 */
- (void)addBackgroundColorAnimation:(UIColor *)color  autoreverses:(BOOL)autoreverses;

/**
 添加旋转动画

 @param rotation 旋转角度
 */
- (void)addRotationAnimation:(CGFloat)rotation;


/**
 添加衰退动画
 */
- (void)addDecayAnimation;

/**
 视图弹簧动画

 @param offset 弹簧动画偏移量
 */
- (void)addShakeAnimationOffset:(CGFloat)offset;



/**
 视图内容偏移动画

 @param contentOffset 偏移量
 */
- (void)addTableViewAnimationWithContentOffset:(CGPoint)contentOffset;



/**
 添加每秒跳动一次的数字动画

 @param count 目标值
 */
- (void)addTimerCountAnimation:(CGFloat)count;

/**
 跳动数字动画（在规定时间内完成）

 @param count 目标值
 */
- (void)addCountAnimation:(CGFloat)count;

/**
 添加frame改变动画

 @param frame 目的frame
 */
- (void)addAnimationFrame:(CGRect)frame;

/**
 添加警告颜色过渡动画
 
 @param tintColor 过渡颜色
 */
- (void)addWarningAnimationTintColor:(UIColor *)tintColor;

/**
 layer边框添加警告颜色过渡动画
 
 @param borderColor 过渡颜色
 */
- (void)addAnimationLayerBorderColor:(UIColor *)borderColor;
@end
