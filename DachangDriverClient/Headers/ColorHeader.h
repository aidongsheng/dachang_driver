//
//  ColorHeader.h
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/10/13.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#ifndef ColorHeader_h
#define ColorHeader_h

#define S_RGB(v)                          RGB(v,v,v,1)
#define RGB(r,g,b,a)                      [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define UIColorFromRGB(r,g,b,a)           RGB(r,g,b,a)
/*
 *  导航栏元素颜色配置
 */
#define navbar_tint_color                RGB(221,24,37,1)
#define naviBar_tint_color_disable        RGB(221,24,37,0.5)
#define naviBar_tint_color             navbar_tint_color
#define naviBar_backBtn_color             RGB(240,240,240,1)
#define naviBar_title_color               RGB(240,240,240,1)
#define BackgroundColor                   WhiteColor
/*
 *  导航栏元素颜色配置
 */
#define tabBar_tint_color                 RGB(221,24,37,1)
#define tabBar_selectTitle_color          RGB(221,30,50,1)
#define tabBar_normalTitle_color          RGB(50,50,50,1)

#define controller_background_color       [UIColor colorWithHexString:@"fafafa"]

/*
 *  UIbutton 主体颜色
 */
#define ButtonWhiteTitleColor                 RGB(250,250,250,1)
#define ButtonBlackTitleColor                 RGB(89,89,89,1)
#define ButtonBackgroundThemeColor            RGB(55,166,242,1)
#define ButtonBackgroundWhiteColor            RGB(255,255,255,1)

#define BlackColor                              RGB(51,51,51,1)
#define GrayColor                               RGB(102,102,102,1)
#define LightTextColor                          [UIColor lightTextColor]
#define WhiteColor                              RGB(245,245,245,1)
#endif /* ColorHeader_h */
