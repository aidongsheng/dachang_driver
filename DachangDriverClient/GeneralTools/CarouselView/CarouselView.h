//
//  CarouselView.h
//  xinxiangjia
//
//  Created by aidongsheng on 2017/12/6.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLIndexPageModel.h"

typedef NS_ENUM(NSUInteger, PageControlPositon) {
    PageControlPositonTop,
    PageControlPositonLeft,
    PageControlPositonBottom,
    PageControlPositonRight,
};

@protocol CarouselViewDelegate<NSObject>

- (void)carouselViewDidTapImageAtIndex:(NSInteger)index;

@end

@interface CarouselView : UIView
@property (nonatomic,strong) CLIndexPageAidsModel * aidsModel;
@property(nonatomic,weak) id<CarouselViewDelegate>delegate;


/**
 轮播视图初始化方法

 @param positon pagecontrol 控件位置枚举信息
 @param currentTintColor pagecontrol 当前选中的颜色
 @param indicatorTintColor pagecontrol 当前未选中的颜色
 @return 轮播图实例对象
 */
- (instancetype)initwithPageControlPositon:(PageControlPositon)positon
               pageControlCurrentTintColor:(UIColor *)currentTintColor
             pageControlIndicatorTintColor:(UIColor *)indicatorTintColor;


@end
