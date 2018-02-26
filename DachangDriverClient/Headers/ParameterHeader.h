//
//  ParameterHeader.h
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/10/18.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#ifndef ParameterHeader_h
#define ParameterHeader_h

#define LabelFontSizeUltraLarge        24
#define LabelFontSizeLarge             18
#define LabelFontSizeMedium            14
#define LabelFontSizeSmall             12
#define LabelFontSizeUltraSmall        8

#define TextFieldFontSize              12
#define ButtonSubtitleFontSize         10

#define CellTextFontSize               15
#define CellFootnoteFontSize           10

#define TextFieldHeight                50

#define UIElementSpace                 5
#define EdgeSpace                      10

#define keyWindow                 [UIApplication sharedApplication].keyWindow

    //屏幕宽度
#define _ScreenWidth           [UIScreen mainScreen].bounds.size.width
    //屏幕高度
#define _ScreenHeight          [UIScreen mainScreen].bounds.size.height
    //导航栏高度
#define _NavigationHeight      44.0f
    //tab栏高度
#define _TabbarHeight          49.0f
    //状态栏高度
#define _StatusBarHeight       (iOS7 ? 20 : 0)
    //适配宽度
#define Fit_Width(width)       ((width) * (Fit_Ratio_Width))
    //适配高度
#define Fit_Height(height)     ((height) * (Fit_Ratio_Height))
    //适配比例
#define Fit_Ratio_Width              (_ScreenWidth / 375.0f)
#define Fit_Ratio_Height             (_ScreenHeight / 1334.0f)
    //是否为iOS7及以上系统
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
    //是否为iOS8及以上系统
#define iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)
    //是否为iOS9及以上系统
#define iOS9 ([[UIDevice currentDevice].systemVersion doubleValue] >= 9.0)
    //是否为iOS10及以上系统
#define iOS10 ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0)

#endif /* ParameterHeader_h */
